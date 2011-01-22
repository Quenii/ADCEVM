#ifndef QRDMPACKET_H
#define QRDMPACKET_H

#include "gkhy/pagoda/pagoda_global.h"
#include <QObject>

namespace gkhy
{
	namespace pagoda
	{
		class QRdmPeer;

		class PAGODA_EXPORT QRdmPacket : public QObject
		{
		public:
			enum PacketType
			{
				ConfigPacket,
				StatusPacket,
				CommandPacket,
			};
			struct Preamble
			{ 
				int sop;
				int size;
				int id;
			};

		public:
			static int identify(char* buf, int bufSize, int* len = 0);
		public:
			QRdmPacket(QObject* parent);
			virtual ~QRdmPacket() {}
		private:
			Q_DISABLE_COPY(QRdmPacket)

		public:
			virtual PacketType type() = 0; 
			virtual unsigned char packetId() const = 0;
			virtual int packetSize() const = 0;			
			virtual char* packetAddr() const = 0;

			virtual int preambleSize() = 0;	

			virtual int setLocal() { return 0; }
			virtual int getLocal() { return 0; }

			// return value: 1 - ok, 0 - buffer full, -1 - error.
			virtual int send(QRdmPeer& rdmPeer) const;
		
			// return value: 1 - ok, 0 - packet no recognized, -1 - error.
			virtual int recv(QRdmPeer& rdmPeer);		

		protected:
			virtual void on_GotPacket()  {}

		protected:
			static int SOP;	 
			static int EOP;
		};

		template <typename PAYLOAD_TYPE, int PACKET_ID, QRdmPacket::PacketType PACKET_TYPE>
		class QRdmPacketTemplate : public QRdmPacket
		{
		public: 
			struct PacketData
			{
				Preamble preamble;
				PAYLOAD_TYPE   payload;	
				int eop;
			};		

		public:
			QRdmPacketTemplate(QObject* parent) 
				: QRdmPacket(parent) 
			{
				m_packetData.preamble.sop = SOP;
				m_packetData.preamble.size = packetSize();
				m_packetData.eop = EOP;
			}
		private:			
			Q_DISABLE_COPY(QRdmPacketTemplate)

		public:				
			PacketType type() { return PACKET_TYPE; }
			unsigned char packetId() const { Q_ASSERT(PACKET_ID > 0); return PACKET_ID; }
			int packetSize() const { return sizeof(PacketData); }
			char* packetAddr() const { return (char*)&m_packetData; }

			int preambleSize() { return sizeof(Preamble); }

			PAYLOAD_TYPE& payload() { return m_packetData.payload; }
			const PAYLOAD_TYPE& payload() const { return m_packetData.payload; }
		
		private:
			PacketData  m_packetData;	
		};
	}
}

#endif // QRDMPACKET_H

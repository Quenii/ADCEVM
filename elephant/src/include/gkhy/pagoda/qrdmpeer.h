#pragma once 

#include "gkhy/pagoda/pagoda_global.h"
#include "gkhy/pagoda/QRebufferedTcpSocket.h"

#include <QHash>

namespace gkhy
{
	namespace pagoda
	{		
		class QRdmPacket;

		class PAGODA_EXPORT QRdmPeer : public QRebufferedTcpSocket
		{
			Q_OBJECT

		public:
			QRdmPeer(QObject *parent);
			virtual ~QRdmPeer();			

		private:
			Q_DISABLE_COPY(QRdmPeer)

		public:
			void installPacket(QList<QRdmPacket*>& packets);
			void installPacket(QRdmPacket* packet);
			QRdmPacket* uninstallPacket(int packetId);			

		private:
			void autoAdjectBufferSize();			
		private slots:
			void on_alt_readyRead();			

		private:
			typedef QHash<int, QRdmPacket*> Dict;
			Dict m_packetDict;
		};
	}
}
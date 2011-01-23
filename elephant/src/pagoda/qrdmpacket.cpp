#include "qrdmpacket.h"
#include "qrdmpeer.h"

using namespace gkhy::pagoda;

int QRdmPacket::SOP = int(0x04030201);
int QRdmPacket::EOP = int(0x08070605);

int QRdmPacket::identify(char* buf, int bufSize, int* len /*= 0*/)
{
	if (bufSize < sizeof(Preamble))
		return 0;
	
	Preamble* p = (Preamble*)buf;
	if (SOP != p->sop)
		return -1;

	// sop okay
	if (bufSize < p->size)
		return 0;

	if (EOP != *(int*)&buf[p->size - 4])
		return -1;

	if (len)
	{
		*len = p->size;
	}
	
	return p->id;
}

QRdmPacket::QRdmPacket(QObject *parent)
	: QObject(parent)
{

}


int QRdmPacket::send(QRdmPeer& socket) const
{
	if (socket.state() != QAbstractSocket::ConnectedState)
	{
		return -1;
	}

	if (socket.freeWriteBufferSize() <= packetSize())
	{
		return 0;
	}	

	int written = socket.write(packetAddr(), packetSize());	
	if (written != packetSize())	
	{
		return -1;
	}

	return 1;
}

int QRdmPacket::recv(QRdmPeer &socket)
{
	int id = QRdmPacket::identify(socket.readBuffer(), socket.bytesAvailable());
	if ( id > 0 )
	{
		int read = socket.read(packetAddr(), packetSize());
		if (read != packetSize()) 
			return -1;	

		return 1;
	}

	return id;
}
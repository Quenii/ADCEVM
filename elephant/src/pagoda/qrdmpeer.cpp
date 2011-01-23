#include "qrdmpeer.h"
#include "qrdmpacket.h"
#include "gkhy/pagoda/test.h"

#include <QtDebug>
#include <QTimer>

using namespace gkhy::pagoda;

QRdmPeer::QRdmPeer(QObject *parent)
: QRebufferedTcpSocket(parent)
{
	bool ok = connect(this, SIGNAL(readyRead()), this, SLOT(on_alt_readyRead()));
	Q_ASSERT(ok);

//	new Test(this);

	qDebug("QRdmPeer %d created.", reinterpret_cast<int>(this));
}

QRdmPeer::~QRdmPeer()
{
	qDebug("QRdmPeer %d deleted.", reinterpret_cast<int>(this));
}

void QRdmPeer::installPacket(QRdmPacket* packet)
{
	if (m_packetDict.find(packet->packetId()) == m_packetDict.end())
	{
		m_packetDict.insert(packet->packetId(), packet);
		autoAdjectBufferSize();
	}
	else
	{
		Q_ASSERT(false);
	}
}

void QRdmPeer::installPacket(QList<QRdmPacket*>& packets)
{
	for (int i = 0; i < packets.count(); ++i)
		installPacket(packets[i]);	
}

QRdmPacket* QRdmPeer::uninstallPacket(int packetId)
{	
	Dict::Iterator i = m_packetDict.find(packetId);
	if (i == m_packetDict.end())
	{
		return 0;
	}
	else
	{
		m_packetDict.remove(packetId);
		return i.value();
	}	
}

void QRdmPeer::on_alt_readyRead()
{	
	while(1)
	{
		bool accepted = false;
		bool error = true;
		int len = 0;
		int id = QRdmPacket::identify(readBuffer(), readBufferSize(), &len);
		if (id < 0)
		{
			Q_ASSERT(false);
			close();
			break;
		}
		else if(id == 0)
		{
			break;
		}
		else
		{
			Dict::Iterator i = m_packetDict.find(id);
			if (i == m_packetDict.end()) // uninstalled packet
			{			
				chop(len);
			}
			else
			{
				QRdmPacket* packet = i.value();
				int ret = packet->recv(*this);
				Q_ASSERT(ret == 1);
				//emit gotPacket(*packet);			
			}
		}	
	}
}

void QRdmPeer::autoAdjectBufferSize()
{
	int totalPacketSize = 0;
	QList<QRdmPacket*> packets = m_packetDict.values();
	for (int i = 0; i < packets.size(); ++i)
	{
		totalPacketSize += packets[i]->packetSize();
	}

	int preferredBufferSize = totalPacketSize * 2;

	if (readBufferSize() < preferredBufferSize)
	{
		setReadBufferSize(preferredBufferSize);
	}

	if (writeBufferSize() < preferredBufferSize)
	{
		setWriteBufferSize(preferredBufferSize);
	}					
}

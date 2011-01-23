#include "qserver.h"
#include "qsarsettings.h"
#include "qsmssettings.h"
#include "qdev.h"

#include <Qtimer>
#include <QObject>


QServer::QServer(QObject *parent)
	: QTcpServer(parent)
{
	QTimer* timer = new QTimer(this);
	bool ok = connect(timer, SIGNAL(timeout()), this, SLOT(update()));
	Q_ASSERT(ok);

	timer->start(300);
} 

QServer::~QServer()
{

}

void QServer::incomingConnection(int socket)
{
	QRdmPeer* rdmPeer = new QRdmPeer(this);
	rdmPeer->installPacket(rdmPackets());
	rdmPeer->setSocketDescriptor(socket);	

	if (rdmPeer->state() != QTcpSocket::ConnectedState)
		rdmPeer->deleteLater(); 	

	bool ok = connect(rdmPeer, SIGNAL(disconnected()), rdmPeer, SLOT(deleteLater())); 
	Q_ASSERT(ok);
	ok = connect(rdmPeer, SIGNAL(error(QAbstractSocket::SocketError)), rdmPeer, SLOT(deleteLater())); 
	Q_ASSERT(ok);

	m_rdmpeerList.push_back(QPointer<QRdmPeer>(rdmPeer));	
}

bool QServer::listen()
{
	return QTcpServer::listen(QHostAddress::Any, port());
}

bool QServer::isEmulator()
{
	return dev()->isEmulator(); 
}

void QServer::update()
{
	QList<QRdmPacket*> packets = rdmPackets();
	
	QList< QPointer<QRdmPeer> >::iterator peer_it = m_rdmpeerList.begin();
	while(peer_it != m_rdmpeerList.end())
	{
		QPointer<QRdmPeer> peerPtr = *peer_it;
		if (peerPtr.isNull())
		{
			peer_it = m_rdmpeerList.erase(peer_it);
			continue ;
		}

		for (QList<QRdmPacket*>::iterator it = packets.begin(); it != packets.end(); ++it)
		{
			QRdmPacket* packet = *it;
			if (packet->type() == QRdmPacket::StatusPacket || QRdmPacket::ConfigPacket)
			{				
				if (packet->send(*peerPtr) < 0)
				{
					peerPtr->deleteLater();
					break;
				}
			}
		}

		++peer_it;
	}
}
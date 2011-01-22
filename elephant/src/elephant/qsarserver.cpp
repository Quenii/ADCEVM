#include "qsarserver.h"
#include "qsar.h"
#include "qsarsettings.h"
#include "qdev.h"

QSarServer::QSarServer(QObject *parent)
	: QServer(parent)
	, m_sar(0)
	, m_packets(0)
{
	m_sar = new QSar(this);
	m_packets = new QSarPackets(this);

	// 
	m_sar->start();
}

QSarServer::~QSarServer()
{
	m_sar->stop();
}


qint16 QSarServer::port() const
{
	QSarSettings s;

	return s.serverPort();
}

QDev* QSarServer::dev() const
{
	return m_sar;
}


QList<QRdmPacket*> QSarServer::rdmPackets() const
{
	return m_packets->list;
}
	


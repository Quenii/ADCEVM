#pragma once

#include "qdevicewindow.h"

class QSarPackets; 

class QSarDeviceWindow : public QDeviceWindow
{
	Q_OBJECT

public:
	QSarDeviceWindow(QWidget*parent);
	~QSarDeviceWindow();

private:	
	QSarPackets* m_packets;
};

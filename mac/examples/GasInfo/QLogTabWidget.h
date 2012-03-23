#include "SerialTypes.hpp"
#include "ui_LogTab.h"

class QLogTabWidget : public QWidget
{
public:
        QLogTabWidget(QWidget* parent = 0, Qt::WindowFlags f = 0);

        void setData(QString zigbee, QString gps);

public:
        Ui_LogTab ui;

private:
	GasInfo gasInfo;
	const static int LogLength = 8192;

};

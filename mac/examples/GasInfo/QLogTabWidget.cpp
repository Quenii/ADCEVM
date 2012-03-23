
#include "QLogTabWidget.h"

QLogTabWidget::QLogTabWidget(QWidget* parent /* = 0 */, Qt::WindowFlags f /* = 0 */)
: QWidget(parent, f) 
{
	ui.setupUi(this);
	gasInfo.h2s_peak = 0;
	gasInfo.so2_peak = 0;
	gasInfo.fel_peak = 0;

}

void QLogTabWidget::setData(QString zigbee, QString gps)
{
    ui.plainTextEditZigbee->moveCursor(QTextCursor::End);
    ui.plainTextEditZigbee->insertPlainText(zigbee);

    ui.plainTextEditGps->moveCursor(QTextCursor::End);
    ui.plainTextEditGps->insertPlainText(gps);
}

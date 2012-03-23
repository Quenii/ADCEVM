
#include "QMyTabWidget.h"

QMyTabWidget::QMyTabWidget(QWidget* parent /* = 0 */, Qt::WindowFlags f /* = 0 */)
: QWidget(parent, f) 
{
	ui.setupUi(this);
	gasInfo.h2s_peak = 0;
	gasInfo.so2_peak = 0;
	gasInfo.fel_peak = 0;

}

void QMyTabWidget::setData(GasInfoItem item)
{
	if (gasInfo.h2s.size() > LogLength)
	{
		gasInfo.h2s.pop();
		gasInfo.so2.pop();
		gasInfo.fel.pop();

		gasInfo.h2s.push(item.h2s);
		gasInfo.so2.push(item.so2);
		gasInfo.fel.push(item.fel);
	}

	gasInfo.h2s_peak = gasInfo.h2s_peak > item.h2s ? gasInfo.h2s_peak : item.h2s;	
	gasInfo.so2_peak = gasInfo.so2_peak > item.so2 ? gasInfo.so2_peak : item.so2;	
	gasInfo.fel_peak = gasInfo.fel_peak > item.fel ? gasInfo.fel_peak : item.fel;

	ui.lineEditH2S->setText(QString("%L1").arg(item.h2s, 0, 'f', 2));
	ui.lineEditH2SPeak->setText(QString("%L1").arg(gasInfo.h2s_peak, 0, 'f', 2));

	ui.lineEditSO2->setText(QString("%L1").arg(item.so2, 0, 'f', 2));
	ui.lineEditSO2Peak->setText(QString("%L1").arg(gasInfo.so2_peak, 0, 'f', 2));

	ui.lineEditFEL->setText(QString("%L1").arg(item.fel, 0, 'f', 2));
        ui.lineEditFELPeak->setText(QString("%L1").arg(gasInfo.fel_peak, 0, 'f', 2));

        ui.lineEditLatitude->setText(item.latitude);
        ui.lineEditLongitude->setText(item.longitude);

}

#include "SerialTypes.hpp"
#include "ui_StatitonInfo.h"

class QMyTabWidget : public QWidget
{
public:
	QMyTabWidget(QWidget* parent = 0, Qt::WindowFlags f = 0);

        void setData(GasInfoItem);

public:
	Ui_StationInfo ui;

private:
	GasInfo gasInfo;
	const static int LogLength = 8192;

};

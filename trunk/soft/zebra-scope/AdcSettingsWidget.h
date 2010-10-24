#ifndef ADCSETTINGSWIDGET_H
#define ADCSETTINGSWIDGET_H

#include <QWidget>
#include "ui_AdcSettingsWidget.h"

using namespace Ui;

class AdcSettingsWidget : public QWidget, public AdcSettingsWidgetClass
{
	Q_OBJECT

public:
	AdcSettingsWidget(QWidget *parent = 0);
	~AdcSettingsWidget();
};

#endif // ADCSETTINGSWIDGET_H

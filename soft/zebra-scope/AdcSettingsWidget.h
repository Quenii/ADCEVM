#ifndef ADCSETTINGSWIDGET_H
#define ADCSETTINGSWIDGET_H

#include <QWidget>
#include "ui_AdcSettingsWidget.h"
#include "AdcSettingsDialog.h"

using namespace Ui;

class AdcSettingsWidget : public QWidget, public AdcSettingsWidgetClass
{
	Q_OBJECT

public:
	AdcSettingsWidget(QWidget *parent = 0);
	~AdcSettingsWidget();

public:
	void setSettings(const AdcSettings& settings);
	void settings(AdcSettings& settings);
};

#endif // ADCSETTINGSWIDGET_H

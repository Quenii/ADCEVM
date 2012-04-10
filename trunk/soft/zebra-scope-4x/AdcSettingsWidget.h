#ifndef ADCSETTINGSWIDGET_H
#define ADCSETTINGSWIDGET_H

#include <QWidget>
#include "ui_AdcSettingsWidget.h"
#include "AdcSettingsDialog.h"

class AdcSettingsWidget : public QWidget
{
	Q_OBJECT

public:
	AdcSettingsWidget(QWidget *parent = 0);
	~AdcSettingsWidget();

	void reloadSettings(bool initValue = false);
public slots:
	void on_pushButtonChangeSettings_clicked();

private:
	Ui::AdcSettingsWidgetClass ui;
};

#endif // ADCSETTINGSWIDGET_H

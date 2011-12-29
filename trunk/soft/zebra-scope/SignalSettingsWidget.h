#ifndef SIGNALSETTINGSWIDGET_H
#define SIGNALSETTINGSWIDGET_H

#include <QWidget>
#include "ui_SignalSettingsWidget.h"
#include "AdcBoardTypes.hpp"

using namespace Ui;

class SignalSettingsWidget : public QWidget, public SignalSettingsWidgetClass
{
	Q_OBJECT

public:
	SignalSettingsWidget(QWidget *parent = 0);
	~SignalSettingsWidget();

public slots:
	void on_pushButtonChangeSettings_clicked();

private:
	void reloadSettings();
	SignalSettings m_settings;

};

#endif // SIGNALSETTINGSWIDGET_H

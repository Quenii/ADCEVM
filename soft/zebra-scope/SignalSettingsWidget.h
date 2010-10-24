#ifndef SIGNALSETTINGSWIDGET_H
#define SIGNALSETTINGSWIDGET_H

#include <QWidget>
#include "ui_SignalSettingsWidget.h"

using namespace Ui;

class SignalSettingsWidget : public QWidget, public SignalSettingsWidgetClass
{
	Q_OBJECT

public:
	SignalSettingsWidget(QWidget *parent = 0);
	~SignalSettingsWidget();
};

#endif // SIGNALSETTINGSWIDGET_H

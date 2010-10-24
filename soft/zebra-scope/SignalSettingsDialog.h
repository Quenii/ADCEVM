#ifndef SIGNALSETTINGSDIALOG_H
#define SIGNALSETTINGSDIALOG_H

#include <QDialog>
#include "ui_SignalSettingsDialog.h"

using namespace Ui;

class SignalSettingsDialog : public QDialog, public SignalSettingsDialogClass
{
	Q_OBJECT

public:
	SignalSettingsDialog(QWidget *parent = 0);
	~SignalSettingsDialog();
};

#endif // SIGNALSETTINGSDIALOG_H

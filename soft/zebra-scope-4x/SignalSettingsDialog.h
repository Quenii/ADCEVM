#ifndef SIGNALSETTINGSDIALOG_H
#define SIGNALSETTINGSDIALOG_H

#include <QDialog>
#include "ui_SignalSettingsDialog.h"
#include "AdcBoardTypes.hpp"
#include "dacanalyzersettings.h"

using namespace Ui;

class SignalSettingsDialog : public QDialog, public SignalSettingsDialogClass
{
	Q_OBJECT

public:
	SignalSettingsDialog(QWidget *parent = 0);
	~SignalSettingsDialog();

protected:
	void accept();

private:
	void loadSettings();

private slots:
	void on_dualToneTestCheckBox_stateChanged( int state );

private:
	Ui::SignalSettingsDialogClass ui;
	AdcAnalyzerSettings m_analyzer;
	SignalSettings m_static;

};

#endif // SIGNALSETTINGSDIALOG_H

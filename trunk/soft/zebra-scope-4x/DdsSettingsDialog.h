#ifndef SIGNALSETTINGSDIALOG_H
#define SIGNALSETTINGSDIALOG_H

#include <QDialog>
#include "ui_DdsSettingsDialog.h"
#include "AdcBoardTypes.hpp"
#include "dacanalyzersettings.h"

using namespace Ui;

class DdsSettingsDialog : public QDialog, public DdsSettingsDialogClass
{
	Q_OBJECT

public:
	DdsSettingsDialog(QWidget *parent = 0);
	~DdsSettingsDialog();

protected:
	void accept();

private:
	void loadSettings();

private slots:
//	void on_dualToneTestCheckBox_stateChanged( int state );
	void on_comboBoxType_currentIndexChanged( int state );
private:
	Ui::DdsSettingsDialogClass ui;
	AdcAnalyzerSettings m_analyzer;
	DdsSettings m_static;

};

#endif // SIGNALSETTINGSDIALOG_H

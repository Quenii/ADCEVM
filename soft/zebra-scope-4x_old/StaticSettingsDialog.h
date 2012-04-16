#ifndef STATICSETTINGSDIALOG_H
#define STATICSETTINGSDIALOG_H

#include <QDialog>
#include "ui_StaticSettingsDialog.h"
#include "AdcBoardTypes.hpp"
#include "dacanalyzersettings.h"

using namespace Ui;

class StaticSettingsDialog : public QDialog, public StaticSettingsDialogClass
{
	Q_OBJECT

public:
	StaticSettingsDialog(bool noise=false, QWidget *parent = 0);
	~StaticSettingsDialog();
protected:
	void accept();

private:
	void loadSettings();

private:
	Ui::StaticSettingsDialogClass ui;
	AdcAnalyzerSettings m_analyzer;
	StaticTestSettings settings;

	//void setSettings(const StaticSettings& settings);
	//void settings(StaticSettings& settings);
};

#endif // STATICSETTINGSDIALOG_H

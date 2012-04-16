#ifndef SPANSETTINGSDIALOG_H
#define SPANSETTINGSDIALOG_H

#include <QDialog>
#include "ui_SpanSettingsDialog.h"
#include "AdcBoardTypes.hpp"
#include "dacanalyzersettings.h"

using namespace Ui;

class SpanSettingsDialog : public QDialog, public SpanSettingsDialogClass
{
	Q_OBJECT

public:
	SpanSettingsDialog(QWidget *parent = 0);
	~SpanSettingsDialog();
protected:
	void accept();

private:
	void loadSettings();

private:
	Ui::SpanSettingsDialogClass ui;
	AdcAnalyzerSettings m_analyzer;
	SpanSettings settings;

};

#endif // STATICSETTINGSDIALOG_H

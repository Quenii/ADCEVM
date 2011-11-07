#ifndef STATICSETTINGSDIALOG_H
#define STATICSETTINGSDIALOG_H

#include <QDialog>
#include "ui_StaticSettingsDialog.h"
#include "StaticBoardTypes.hpp"

using namespace Ui;

class StaticSettingsDialog : public QDialog, public StaticSettingsDialogClass
{
	Q_OBJECT

public:
	StaticSettingsDialog(QWidget *parent = 0);
	~StaticSettingsDialog();

public:
	void setSettings(const StaticSettings& settings);
	void settings(StaticSettings& settings);
};

#endif // STATICSETTINGSDIALOG_H

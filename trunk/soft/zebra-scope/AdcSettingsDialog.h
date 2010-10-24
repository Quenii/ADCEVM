#ifndef ADCSETTINGSDIALOG_H
#define ADCSETTINGSDIALOG_H

#include <QDialog>
#include "ui_AdcSettingsDialog.h"

using namespace Ui;

class AdcSettingsDialog : public QDialog, public AdcSettingsDialogClass
{
	Q_OBJECT

public:
	AdcSettingsDialog(QWidget *parent = 0);
	~AdcSettingsDialog();
};

#endif // ADCSETTINGSDIALOG_H

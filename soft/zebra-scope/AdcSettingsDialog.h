#ifndef ADCSETTINGSDIALOG_H
#define ADCSETTINGSDIALOG_H

#include <QDialog>
#include "ui_AdcSettingsDialog.h"
#include "AdcBoardTypes.hpp"

using namespace Ui;

class AdcSettingsDialog : public QDialog, public AdcSettingsDialogClass
{
	Q_OBJECT

public:
	AdcSettingsDialog(QWidget *parent = 0);
	~AdcSettingsDialog();

//public:
//	void setSettings(const AdcSettings& settings);
//	void settings(AdcSettings& settings);
protected:
	void accept();

private:
	void loadSettings(const QString& type);

private slots:
	void on_adcTypeComboBox_currentIndexChanged(const QString & type);

private:
	Ui::AdcSettingsDialogClass ui;
	QStringList m_adcTypeList;

};

#endif // ADCSETTINGSDIALOG_H

#ifndef QDEVICEDIALOG_H
#define QDEVICEDIALOG_H

#include <QDialog>
#include "ui_devicedialog.h"

using namespace Ui;

class QDeviceDialog : public QDialog, public QDeviceDialogClass
{
	Q_OBJECT

public:
	QDeviceDialog(QWidget *parent = 0);
	QDeviceDialog(QString name, QWidget *parent = 0);
	~QDeviceDialog();

protected:
	void accept();
	void changeEvent(QEvent *e);

private slots:
	void onPortNameChanged(const QString &name);
	void onBaudRateChanged(int idx);
	void onParityChanged(int idx);
	void onDataBitsChanged(int idx);
	void onStopBitsChanged(int idx);
	void onQueryModeChanged(int idx);
	void onTimeoutChanged(int val);

private:
	void initDevice();

private:
	Ui::QDeviceDialogClass ui;
	QString settingFileName;
};

#endif // QDEVICEDIALOG_H

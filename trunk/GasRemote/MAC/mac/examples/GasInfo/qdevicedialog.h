#ifndef QDEVICEDIALOG_H
#define QDEVICEDIALOG_H

#include <QDialog>
#include "ui_devicedialog.h"

//using namespace Ui;

class QDeviceDialog : public QDialog, public Ui::QDeviceDialogClass
{
	Q_OBJECT

public:
	QDeviceDialog(QWidget *parent = 0);
//	QDeviceDialog(QString name, QWidget *parent = 0);
	~QDeviceDialog();

protected:
	void accept();
	void changeEvent(QEvent *e);

private:
	void initDevice();

private:
	Ui::QDeviceDialogClass ui;
//	QString settingFileName;
};

#endif // QDEVICEDIALOG_H

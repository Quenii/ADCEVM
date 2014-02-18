#ifndef APP_H
#define APP_H

#include <QtGui/QMainWindow>
#include "ui_app.h"

class app : public QMainWindow
{
	Q_OBJECT

public:
	app(QWidget *parent = 0, Qt::WFlags flags = 0);
	~app();

private:
	Ui::appClass ui;
};

#endif // APP_H

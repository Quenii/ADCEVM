#include "mainwindow.h"
#include "CustomTypeHandler.h"

#include <QApplication>


int main(int argc, char *argv[])
{
	QApplication a(argc, argv);
	CustomTypeHandler::registerAll();
	MainWindow w;
	w.show();
	return a.exec();
}

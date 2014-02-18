#include "app.h"
#include <QtGui/QApplication>

int main(int argc, char *argv[])
{
	QApplication a(argc, argv);
	app w;
	w.show();
	return a.exec();
}

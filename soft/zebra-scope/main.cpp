#include "mainwindow.h"
#include <QtGui/QApplication>
#include <QMessageBox>



#ifdef MATLAB    //defined in AdcBoardTypes.hpp
#include "libalgo.h"

#pragma comment(lib, "libalgo.lib")
#pragma comment(lib, "mclmcrrt.lib")
#endif // MATLAB

int main(int argc, char *argv[])
{
	QApplication a(argc, argv);

	QApplication::setOrganizationName("quenii-roc");
	QApplication::setOrganizationDomain("quenii-roc.com");
	QApplication::setApplicationName("zebra-scope");


#ifdef MATLAB
	if (!(mclInitializeApplication(NULL, 0) && libalgoInitialize()))
	{
		QMessageBox::critical(NULL, "", "Failed to initialize Matlab.");

	}
#endif // MATLAB

	MainWindow w;
	w.showMaximized();

	int ret = a.exec();

#ifdef MATLAB
	libalgoTerminate();
	mclTerminateApplication();
#endif // MATLAB

	return ret;
}

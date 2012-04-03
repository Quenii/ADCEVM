#include <QApplication>
#include "maindialog.h"

#include "SerialTypes.hpp"

#include "mainwindow.h"

#define REGISTER_METATYPE_HELPER( type ) \
    qRegisterMetaType<type>(); \
    qRegisterMetaType<type>(#type); \
    qRegisterMetaTypeStreamOperators<type>(#type)

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    REGISTER_METATYPE_HELPER(SerialPortInfo);

    QCoreApplication::setOrganizationName("quenii");
    QCoreApplication::setOrganizationDomain("quenii.com");
    QCoreApplication::setApplicationName("GasInfo");

//    MainDialog w;
//    w.show();


    MainWindow mainWindow;
    mainWindow.showMaximized();

    return a.exec();
}

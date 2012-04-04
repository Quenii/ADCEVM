#include "mainwindow.h"
#include "SerialTypes.hpp"

#include <QTranslator>
#include <QApplication>


#define REGISTER_METATYPE_HELPER( type ) \
    qRegisterMetaType<type>(); \
    qRegisterMetaType<type>(#type); \
    qRegisterMetaTypeStreamOperators<type>(#type)

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    QTranslator translator;
    translator.load("gasinfo_zh");

    a.installTranslator(&translator);

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

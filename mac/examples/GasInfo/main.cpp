#include "mainwindow.h"
#include "SerialTypes.hpp"

#include <QTranslator>
#include <QApplication>
#include <QMacStyle>


#define REGISTER_METATYPE_HELPER( type ) \
    qRegisterMetaType<type>(); \
    qRegisterMetaType<type>(#type); \
    qRegisterMetaTypeStreamOperators<type>(#type)

int main(int argc, char *argv[])
{
    QApplication::setStyle("macintosh");

    QApplication a(argc, argv);

    REGISTER_METATYPE_HELPER(SerialPortInfo);


    QCoreApplication::setOrganizationName("quenii");
    QCoreApplication::setOrganizationDomain("quenii.com");
    QCoreApplication::setApplicationName("GasInfo");

    QTranslator translator;
    translator.load("gasinfo_zh");
    a.installTranslator(&translator);


    MainWindow mainWindow;
    mainWindow.showMaximized();

    return a.exec();
}

#include "mainwindow.h"
#include "SerialTypes.hpp"

#include <QTranslator>
#include <QApplication>
#include <QMacStyle>
#include <QTextCodec>

#define REGISTER_METATYPE_HELPER( type ) \
    qRegisterMetaType<type>(); \
    qRegisterMetaType<type>(#type); \
    qRegisterMetaTypeStreamOperators<type>(#type)

int main(int argc, char *argv[])
{
    QApplication::setStyle("macintosh");

    QApplication a(argc, argv);

    QTextCodec *codec = QTextCodec::codecForName("UTF8");
    QTextCodec::setCodecForTr(codec);
    QTextCodec::setCodecForLocale(codec);
    QTextCodec::setCodecForCStrings(codec);

    REGISTER_METATYPE_HELPER(SerialPortInfo);

    QCoreApplication::setOrganizationName("quenii");
    QCoreApplication::setOrganizationDomain("quenii.com");
    QCoreApplication::setApplicationName("GasInfo");

    QTranslator translator;
    translator.load("gasinfo_zh_CN");
    a.installTranslator(&translator);

    MainWindow mainWindow;
    mainWindow.showMaximized();

    return a.exec();
}

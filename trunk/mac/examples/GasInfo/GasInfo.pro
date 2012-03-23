#-------------------------------------------------
#
# Project created by QtCreator 2011-11-06T21:37:41
#
#-------------------------------------------------

QT       += core gui
contains(QT_VERSION, ^5\\..*\\..*): QT += widgets

TARGET = GasInfo
TEMPLATE = app

include(../../src/qextserialport.pri)

SOURCES += main.cpp\
        hled.cpp \
    serialsettings.cpp \
    qdevicedialog.cpp \
    maindialog.cpp \
    QMyTabWidget.cpp \
    QGasInfo.cpp \
    QLogTabWidget.cpp \
    QMapTabWidget.cpp

HEADERS  += \
            hled.h \
    SerialTypes.hpp \
    serialsettings.h \
    qdevicedialog.h \
    maindialog.h \
    QMyTabWidget.h \
    QGasInfo.h \
    QLogTabWidget.h \
    QMapTabWidget.h

FORMS    += dialog.ui \
    DeviceDialog.ui \
    StatitonInfo.ui \
    logTab.ui \
    mapTab.ui

RESOURCES += \
    res.qrc

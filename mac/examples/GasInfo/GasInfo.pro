#-------------------------------------------------
#
# Project created by QtCreator 2011-11-06T21:37:41
#
#-------------------------------------------------

QT       += core gui network webkit
contains(QT_VERSION, ^5\\..*\\..*): QT += widgets

TARGET = GasInfo
TEMPLATE = app

CONFIG += mobility
MOBILITY = location

include(../../src/qextserialport.pri)

SOURCES += main.cpp\
        hled.cpp \
    qdevicedialog.cpp \
    QGasInfo.cpp \
    mainwindow.cpp \
    devicelistwidget.cpp \
    terminalwidget.cpp \
    centralmodel.cpp \
    gasinfosettings.cpp \
    optiondialog.cpp \
    mapswidget.cpp \
    marker.cpp \
    locationmanager.cpp \
    qtermdatahandler.cpp

HEADERS  += \
            hled.h \
    SerialTypes.hpp \
    qdevicedialog.h \
    QGasInfo.h \
    mainwindow.h \
    devicelistwidget.h \
    terminalwidget.h \
    centralmodel.h \
    gasinfosettings.h \
    optiondialog.h \
    marker.h \
    mapswidget.h \
    locationmanager.h \
    qtermdatahandler.h

FORMS    += dialog.ui \
    DeviceDialog.ui \
    StatitonInfo.ui \
    logTab.ui \
    mapTab.ui \
    mainwindow.ui \
    devicelistwidget.ui \
    terminalwidget.ui \
    optiondialog.ui

RESOURCES += \
     gasinfo.qrc


 TRANSLATIONS = gasinfo_zh.ts























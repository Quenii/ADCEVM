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
    maindialog.cpp \
    QMyTabWidget.cpp \
    QGasInfo.cpp \
    QLogTabWidget.cpp \
    QMapTabWidget.cpp \
    mainwindow.cpp \
    devicelistwidget.cpp \
    commwidget.cpp \
    terminalwidget.cpp \
    centralmodel.cpp \
    gasinfosettings.cpp \
    optiondialog.cpp \
    mapswidget.cpp \
    marker.cpp

HEADERS  += \
            hled.h \
    SerialTypes.hpp \
    qdevicedialog.h \
    maindialog.h \
    QMyTabWidget.h \
    QGasInfo.h \
    QLogTabWidget.h \
    mainwindow.h \
    devicelistwidget.h \
    commwidget.h \
    terminalwidget.h \
    centralmodel.h \
    gasinfosettings.h \
    optiondialog.h \
    marker.h \
    mapswidget.h

FORMS    += dialog.ui \
    DeviceDialog.ui \
    StatitonInfo.ui \
    logTab.ui \
    mapTab.ui \
    mainwindow.ui \
    devicelistwidget.ui \
    commwidget.ui \
    terminalwidget.ui \
    optiondialog.ui

RESOURCES += \
#    res.qrc


























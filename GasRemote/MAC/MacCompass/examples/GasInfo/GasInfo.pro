#-------------------------------------------------
#
# Project created by QtCreator 2011-11-06T21:37:41
#
#-------------------------------------------------

QT       += core gui network webkit
contains(QT_VERSION, ^5\\..*\\..*): QT += widgets

INCLUDEPATH += $QTDIR/include/QtLocation

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
    qtermdatahandler.cpp \
    terminalalarmwidget.cpp \
    markerdialog.cpp \
    compass.cpp

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
    qtermdatahandler.h \
    terminalalarmwidget.h \
    markerdialog.h \
    compass.h

FORMS    += \
    DeviceDialog.ui \
    mainwindow.ui \
    devicelistwidget.ui \
    terminalwidget.ui \
    optiondialog.ui \
    terminalalarmwidget.ui \
    markerdialog.ui

RESOURCES += \
     gasinfo.qrc


TRANSLATIONS = gasinfo_zh_CN.ts

CODECFORTR = UTF-8






















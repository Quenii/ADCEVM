#-------------------------------------------------
#
# Project created by QtCreator 2011-11-06T21:37:41
#
#-------------------------------------------------

QT       += core gui network webkit
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
    QMapTabWidget.cpp \
    qmapwidget.cpp \
    mainwindow.cpp \
    devicelistwidget.cpp \
    overviewwidget.cpp \
    commwidget.cpp \
    ggooglemapview.cpp \
    terminalwidget.cpp \
    centralmodel.cpp \
    gasinfosettings.cpp

HEADERS  += \
            hled.h \
    SerialTypes.hpp \
    serialsettings.h \
    qdevicedialog.h \
    maindialog.h \
    QMyTabWidget.h \
    QGasInfo.h \
    QLogTabWidget.h \
    QMapTabWidget.h \
    qmapwidget.h \
    mainwindow.h \
    devicelistwidget.h \
    overviewwidget.h \
    commwidget.h \
    qgooglemapview.h \
    terminalwidget.h \
    centralmodel.h \
    gasinfosettings.h

FORMS    += dialog.ui \
    DeviceDialog.ui \
    StatitonInfo.ui \
    logTab.ui \
    mapTab.ui \
    qmapwidget.ui \
    mainwindow.ui \
    devicelistwidget.ui \
    overviewwidget.ui \
    commwidget.ui \
    terminalwidget.ui

RESOURCES += \
#    res.qrc


























/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created: Sun Sep 5 10:12:26 2010
**      by: Qt User Interface Compiler version 4.6.3
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QDockWidget>
#include <QtGui/QGridLayout>
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QMainWindow>
#include <QtGui/QMenuBar>
#include <QtGui/QScrollArea>
#include <QtGui/QStatusBar>
#include <QtGui/QToolBar>
#include <QtGui/QVBoxLayout>
#include <QtGui/QWidget>
#include "controlpanel.hpp"

QT_BEGIN_NAMESPACE

class Ui_MainWindowClass
{
public:
    QWidget *centralWidget;
    QHBoxLayout *horizontalLayout;
    QMenuBar *menuBar;
    QToolBar *mainToolBar;
    QStatusBar *statusBar;
    QDockWidget *dockWidgetControlPanel;
    QWidget *dockWidgetContents;
    QVBoxLayout *verticalLayout;
    QScrollArea *scrollArea;
    QWidget *scrollAreaWidgetContents;
    QGridLayout *gridLayout;
    ControlPanel *controlPanel;
    QDockWidget *dockWidgetWave;
    QWidget *dockWidgetContents_4;
    QDockWidget *dockWidgetFFT;
    QWidget *dockWidgetContents_5;
    QDockWidget *dockWidgetLogicWave;
    QWidget *dockWidgetContents_2;

    void setupUi(QMainWindow *MainWindowClass)
    {
        if (MainWindowClass->objectName().isEmpty())
            MainWindowClass->setObjectName(QString::fromUtf8("MainWindowClass"));
        MainWindowClass->resize(662, 596);
        MainWindowClass->setDockNestingEnabled(false);
        MainWindowClass->setDockOptions(QMainWindow::AllowTabbedDocks|QMainWindow::AnimatedDocks);
        centralWidget = new QWidget(MainWindowClass);
        centralWidget->setObjectName(QString::fromUtf8("centralWidget"));
        QSizePolicy sizePolicy(QSizePolicy::Minimum, QSizePolicy::Minimum);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(centralWidget->sizePolicy().hasHeightForWidth());
        centralWidget->setSizePolicy(sizePolicy);
        centralWidget->setMaximumSize(QSize(1, 1));
        horizontalLayout = new QHBoxLayout(centralWidget);
        horizontalLayout->setSpacing(6);
        horizontalLayout->setContentsMargins(11, 11, 11, 11);
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        horizontalLayout->setSizeConstraint(QLayout::SetDefaultConstraint);
        MainWindowClass->setCentralWidget(centralWidget);
        menuBar = new QMenuBar(MainWindowClass);
        menuBar->setObjectName(QString::fromUtf8("menuBar"));
        menuBar->setGeometry(QRect(0, 0, 662, 20));
        MainWindowClass->setMenuBar(menuBar);
        mainToolBar = new QToolBar(MainWindowClass);
        mainToolBar->setObjectName(QString::fromUtf8("mainToolBar"));
        MainWindowClass->addToolBar(Qt::TopToolBarArea, mainToolBar);
        statusBar = new QStatusBar(MainWindowClass);
        statusBar->setObjectName(QString::fromUtf8("statusBar"));
        MainWindowClass->setStatusBar(statusBar);
        dockWidgetControlPanel = new QDockWidget(MainWindowClass);
        dockWidgetControlPanel->setObjectName(QString::fromUtf8("dockWidgetControlPanel"));
        QSizePolicy sizePolicy1(QSizePolicy::Preferred, QSizePolicy::Preferred);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(dockWidgetControlPanel->sizePolicy().hasHeightForWidth());
        dockWidgetControlPanel->setSizePolicy(sizePolicy1);
        dockWidgetControlPanel->setMinimumSize(QSize(291, 0));
        dockWidgetControlPanel->setMaximumSize(QSize(291, 16777215));
        dockWidgetControlPanel->setAllowedAreas(Qt::LeftDockWidgetArea);
        dockWidgetContents = new QWidget();
        dockWidgetContents->setObjectName(QString::fromUtf8("dockWidgetContents"));
        verticalLayout = new QVBoxLayout(dockWidgetContents);
        verticalLayout->setSpacing(6);
        verticalLayout->setContentsMargins(11, 11, 11, 11);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        scrollArea = new QScrollArea(dockWidgetContents);
        scrollArea->setObjectName(QString::fromUtf8("scrollArea"));
        scrollArea->setHorizontalScrollBarPolicy(Qt::ScrollBarAsNeeded);
        scrollArea->setWidgetResizable(true);
        scrollAreaWidgetContents = new QWidget();
        scrollAreaWidgetContents->setObjectName(QString::fromUtf8("scrollAreaWidgetContents"));
        scrollAreaWidgetContents->setGeometry(QRect(0, 0, 271, 505));
        gridLayout = new QGridLayout(scrollAreaWidgetContents);
        gridLayout->setSpacing(6);
        gridLayout->setContentsMargins(11, 11, 11, 11);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        controlPanel = new ControlPanel(scrollAreaWidgetContents);
        controlPanel->setObjectName(QString::fromUtf8("controlPanel"));

        gridLayout->addWidget(controlPanel, 0, 0, 1, 1);

        scrollArea->setWidget(scrollAreaWidgetContents);

        verticalLayout->addWidget(scrollArea);

        dockWidgetControlPanel->setWidget(dockWidgetContents);
        MainWindowClass->addDockWidget(static_cast<Qt::DockWidgetArea>(1), dockWidgetControlPanel);
        dockWidgetWave = new QDockWidget(MainWindowClass);
        dockWidgetWave->setObjectName(QString::fromUtf8("dockWidgetWave"));
        QSizePolicy sizePolicy2(QSizePolicy::Maximum, QSizePolicy::Preferred);
        sizePolicy2.setHorizontalStretch(0);
        sizePolicy2.setVerticalStretch(0);
        sizePolicy2.setHeightForWidth(dockWidgetWave->sizePolicy().hasHeightForWidth());
        dockWidgetWave->setSizePolicy(sizePolicy2);
        dockWidgetWave->setAllowedAreas(Qt::RightDockWidgetArea);
        dockWidgetContents_4 = new QWidget();
        dockWidgetContents_4->setObjectName(QString::fromUtf8("dockWidgetContents_4"));
        dockWidgetWave->setWidget(dockWidgetContents_4);
        MainWindowClass->addDockWidget(static_cast<Qt::DockWidgetArea>(2), dockWidgetWave);
        dockWidgetFFT = new QDockWidget(MainWindowClass);
        dockWidgetFFT->setObjectName(QString::fromUtf8("dockWidgetFFT"));
        sizePolicy2.setHeightForWidth(dockWidgetFFT->sizePolicy().hasHeightForWidth());
        dockWidgetFFT->setSizePolicy(sizePolicy2);
        dockWidgetFFT->setAllowedAreas(Qt::RightDockWidgetArea);
        dockWidgetContents_5 = new QWidget();
        dockWidgetContents_5->setObjectName(QString::fromUtf8("dockWidgetContents_5"));
        dockWidgetFFT->setWidget(dockWidgetContents_5);
        MainWindowClass->addDockWidget(static_cast<Qt::DockWidgetArea>(2), dockWidgetFFT);
        dockWidgetLogicWave = new QDockWidget(MainWindowClass);
        dockWidgetLogicWave->setObjectName(QString::fromUtf8("dockWidgetLogicWave"));
        dockWidgetLogicWave->setAllowedAreas(Qt::RightDockWidgetArea);
        dockWidgetContents_2 = new QWidget();
        dockWidgetContents_2->setObjectName(QString::fromUtf8("dockWidgetContents_2"));
        dockWidgetLogicWave->setWidget(dockWidgetContents_2);
        MainWindowClass->addDockWidget(static_cast<Qt::DockWidgetArea>(2), dockWidgetLogicWave);

        retranslateUi(MainWindowClass);

        QMetaObject::connectSlotsByName(MainWindowClass);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindowClass)
    {
        MainWindowClass->setWindowTitle(QApplication::translate("MainWindowClass", "CETC58 ADC Analyzer", 0, QApplication::UnicodeUTF8));
        dockWidgetControlPanel->setWindowTitle(QApplication::translate("MainWindowClass", "Control Panel", 0, QApplication::UnicodeUTF8));
        dockWidgetWave->setWindowTitle(QApplication::translate("MainWindowClass", "Time-domain", 0, QApplication::UnicodeUTF8));
        dockWidgetFFT->setWindowTitle(QApplication::translate("MainWindowClass", "Freq-domain", 0, QApplication::UnicodeUTF8));
        dockWidgetLogicWave->setWindowTitle(QApplication::translate("MainWindowClass", "Logic Wave", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class MainWindowClass: public Ui_MainWindowClass {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H

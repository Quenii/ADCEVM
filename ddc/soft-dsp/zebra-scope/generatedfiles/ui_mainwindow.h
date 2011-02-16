/********************************************************************************
** Form generated from reading ui file 'mainwindow.ui'
**
** Created: Tue Feb 15 21:09:50 2011
**      by: Qt User Interface Compiler version 4.5.3
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
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
#include <QtGui/QMenu>
#include <QtGui/QMenuBar>
#include <QtGui/QStatusBar>
#include <QtGui/QWidget>
#include "controlpanel.h"

QT_BEGIN_NAMESPACE

class Ui_MainWindowClass
{
public:
    QAction *actionSaveData;
    QAction *actionLoadData;
    QAction *action_3;
    QAction *actionSpiCtrl;
    QAction *actionFftDepth;
    QAction *actionSpectrum;
    QAction *actionLogic;
    QAction *action_7;
    QAction *action_AboutAdcAnalyzer;
    QWidget *centralWidget;
    QHBoxLayout *horizontalLayout;
    QMenuBar *menuBar;
    QMenu *menu;
    QMenu *menuSettings;
    QMenu *menu_T;
    QMenu *menuWindow;
    QMenu *menuHelp;
    QStatusBar *statusBar;
    QDockWidget *dockWidgetWave;
    QWidget *dockWidgetContents_4;
    QDockWidget *dockWidgetFFT;
    QWidget *dockWidgetContents_5;
    QDockWidget *dockWidgetLogicWave;
    QWidget *dockWidgetContents_2;
    QDockWidget *dockWidgetControlPanel;
    QWidget *dockWidgetContents_x;
    QGridLayout *gridLayout;
    ControlPanel *controlPanel;

    void setupUi(QMainWindow *MainWindowClass)
    {
        if (MainWindowClass->objectName().isEmpty())
            MainWindowClass->setObjectName(QString::fromUtf8("MainWindowClass"));
        MainWindowClass->resize(662, 596);
        MainWindowClass->setDockNestingEnabled(false);
        MainWindowClass->setDockOptions(QMainWindow::AllowTabbedDocks|QMainWindow::AnimatedDocks);
        actionSaveData = new QAction(MainWindowClass);
        actionSaveData->setObjectName(QString::fromUtf8("actionSaveData"));
        actionLoadData = new QAction(MainWindowClass);
        actionLoadData->setObjectName(QString::fromUtf8("actionLoadData"));
        action_3 = new QAction(MainWindowClass);
        action_3->setObjectName(QString::fromUtf8("action_3"));
        actionSpiCtrl = new QAction(MainWindowClass);
        actionSpiCtrl->setObjectName(QString::fromUtf8("actionSpiCtrl"));
        actionFftDepth = new QAction(MainWindowClass);
        actionFftDepth->setObjectName(QString::fromUtf8("actionFftDepth"));
        actionSpectrum = new QAction(MainWindowClass);
        actionSpectrum->setObjectName(QString::fromUtf8("actionSpectrum"));
        actionSpectrum->setCheckable(true);
        actionLogic = new QAction(MainWindowClass);
        actionLogic->setObjectName(QString::fromUtf8("actionLogic"));
        actionLogic->setCheckable(true);
        action_7 = new QAction(MainWindowClass);
        action_7->setObjectName(QString::fromUtf8("action_7"));
        action_AboutAdcAnalyzer = new QAction(MainWindowClass);
        action_AboutAdcAnalyzer->setObjectName(QString::fromUtf8("action_AboutAdcAnalyzer"));
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
        horizontalLayout->setMargin(11);
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        horizontalLayout->setSizeConstraint(QLayout::SetDefaultConstraint);
        MainWindowClass->setCentralWidget(centralWidget);
        menuBar = new QMenuBar(MainWindowClass);
        menuBar->setObjectName(QString::fromUtf8("menuBar"));
        menuBar->setGeometry(QRect(0, 0, 662, 21));
        menu = new QMenu(menuBar);
        menu->setObjectName(QString::fromUtf8("menu"));
        menuSettings = new QMenu(menuBar);
        menuSettings->setObjectName(QString::fromUtf8("menuSettings"));
        menu_T = new QMenu(menuBar);
        menu_T->setObjectName(QString::fromUtf8("menu_T"));
        menuWindow = new QMenu(menuBar);
        menuWindow->setObjectName(QString::fromUtf8("menuWindow"));
        menuHelp = new QMenu(menuBar);
        menuHelp->setObjectName(QString::fromUtf8("menuHelp"));
        MainWindowClass->setMenuBar(menuBar);
        statusBar = new QStatusBar(MainWindowClass);
        statusBar->setObjectName(QString::fromUtf8("statusBar"));
        MainWindowClass->setStatusBar(statusBar);
        dockWidgetWave = new QDockWidget(MainWindowClass);
        dockWidgetWave->setObjectName(QString::fromUtf8("dockWidgetWave"));
        QSizePolicy sizePolicy1(QSizePolicy::Expanding, QSizePolicy::Preferred);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(dockWidgetWave->sizePolicy().hasHeightForWidth());
        dockWidgetWave->setSizePolicy(sizePolicy1);
        dockWidgetWave->setAllowedAreas(Qt::RightDockWidgetArea);
        dockWidgetContents_4 = new QWidget();
        dockWidgetContents_4->setObjectName(QString::fromUtf8("dockWidgetContents_4"));
        dockWidgetWave->setWidget(dockWidgetContents_4);
        MainWindowClass->addDockWidget(static_cast<Qt::DockWidgetArea>(2), dockWidgetWave);
        dockWidgetFFT = new QDockWidget(MainWindowClass);
        dockWidgetFFT->setObjectName(QString::fromUtf8("dockWidgetFFT"));
        sizePolicy1.setHeightForWidth(dockWidgetFFT->sizePolicy().hasHeightForWidth());
        dockWidgetFFT->setSizePolicy(sizePolicy1);
        dockWidgetFFT->setAllowedAreas(Qt::RightDockWidgetArea);
        dockWidgetContents_5 = new QWidget();
        dockWidgetContents_5->setObjectName(QString::fromUtf8("dockWidgetContents_5"));
        dockWidgetFFT->setWidget(dockWidgetContents_5);
        MainWindowClass->addDockWidget(static_cast<Qt::DockWidgetArea>(2), dockWidgetFFT);
        dockWidgetLogicWave = new QDockWidget(MainWindowClass);
        dockWidgetLogicWave->setObjectName(QString::fromUtf8("dockWidgetLogicWave"));
        sizePolicy1.setHeightForWidth(dockWidgetLogicWave->sizePolicy().hasHeightForWidth());
        dockWidgetLogicWave->setSizePolicy(sizePolicy1);
        dockWidgetLogicWave->setAllowedAreas(Qt::RightDockWidgetArea);
        dockWidgetContents_2 = new QWidget();
        dockWidgetContents_2->setObjectName(QString::fromUtf8("dockWidgetContents_2"));
        dockWidgetLogicWave->setWidget(dockWidgetContents_2);
        MainWindowClass->addDockWidget(static_cast<Qt::DockWidgetArea>(2), dockWidgetLogicWave);
        dockWidgetControlPanel = new QDockWidget(MainWindowClass);
        dockWidgetControlPanel->setObjectName(QString::fromUtf8("dockWidgetControlPanel"));
        QSizePolicy sizePolicy2(QSizePolicy::Minimum, QSizePolicy::Preferred);
        sizePolicy2.setHorizontalStretch(0);
        sizePolicy2.setVerticalStretch(0);
        sizePolicy2.setHeightForWidth(dockWidgetControlPanel->sizePolicy().hasHeightForWidth());
        dockWidgetControlPanel->setSizePolicy(sizePolicy2);
        dockWidgetControlPanel->setMaximumSize(QSize(240, 524287));
        dockWidgetControlPanel->setFeatures(QDockWidget::DockWidgetClosable);
        dockWidgetControlPanel->setAllowedAreas(Qt::LeftDockWidgetArea);
        dockWidgetContents_x = new QWidget();
        dockWidgetContents_x->setObjectName(QString::fromUtf8("dockWidgetContents_x"));
        gridLayout = new QGridLayout(dockWidgetContents_x);
        gridLayout->setSpacing(6);
        gridLayout->setMargin(11);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        controlPanel = new ControlPanel(dockWidgetContents_x);
        controlPanel->setObjectName(QString::fromUtf8("controlPanel"));
        sizePolicy2.setHeightForWidth(controlPanel->sizePolicy().hasHeightForWidth());
        controlPanel->setSizePolicy(sizePolicy2);

        gridLayout->addWidget(controlPanel, 0, 0, 1, 1);

        dockWidgetControlPanel->setWidget(dockWidgetContents_x);
        MainWindowClass->addDockWidget(static_cast<Qt::DockWidgetArea>(1), dockWidgetControlPanel);

        menuBar->addAction(menu->menuAction());
        menuBar->addAction(menu_T->menuAction());
        menuBar->addAction(menuSettings->menuAction());
        menuBar->addAction(menuWindow->menuAction());
        menuBar->addAction(menuHelp->menuAction());
        menu->addAction(actionLoadData);
        menu->addAction(actionSaveData);
        menu->addSeparator();
        menu->addAction(action_3);
        menuSettings->addAction(actionSpiCtrl);
        menuSettings->addAction(actionFftDepth);
        menu_T->addAction(actionSpectrum);
        menu_T->addAction(actionLogic);
        menuHelp->addAction(action_7);
        menuHelp->addAction(action_AboutAdcAnalyzer);

        retranslateUi(MainWindowClass);

        QMetaObject::connectSlotsByName(MainWindowClass);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindowClass)
    {
        MainWindowClass->setWindowTitle(QApplication::translate("MainWindowClass", "CETC58 ADC Analyzer", 0, QApplication::UnicodeUTF8));
        actionSaveData->setText(QApplication::translate("MainWindowClass", "\344\277\235\345\255\230\346\225\260\346\215\256(S)", 0, QApplication::UnicodeUTF8));
        actionLoadData->setText(QApplication::translate("MainWindowClass", "\350\257\273\345\205\245\346\225\260\346\215\256(R)", 0, QApplication::UnicodeUTF8));
        action_3->setText(QApplication::translate("MainWindowClass", "\351\200\200\345\207\272(X)", 0, QApplication::UnicodeUTF8));
        actionSpiCtrl->setText(QApplication::translate("MainWindowClass", "SPI\346\216\247\345\210\266(C)", 0, QApplication::UnicodeUTF8));
        actionFftDepth->setText(QApplication::translate("MainWindowClass", "FFT\346\267\261\345\272\246(D)", 0, QApplication::UnicodeUTF8));
        actionSpectrum->setText(QApplication::translate("MainWindowClass", "\351\242\221\350\260\261\345\210\206\346\236\220(&F)", 0, QApplication::UnicodeUTF8));
        actionLogic->setText(QApplication::translate("MainWindowClass", "\351\200\273\350\276\221\345\210\206\346\236\220(&L)", 0, QApplication::UnicodeUTF8));
        action_7->setText(QApplication::translate("MainWindowClass", "\345\270\256\345\212\251\344\270\273\351\242\230(&T)", 0, QApplication::UnicodeUTF8));
        action_AboutAdcAnalyzer->setText(QApplication::translate("MainWindowClass", "\345\205\263\344\272\216ADC Analyzer\357\274\210&A\357\274\211", 0, QApplication::UnicodeUTF8));
        menu->setTitle(QApplication::translate("MainWindowClass", "\346\226\207\344\273\266(&F)", 0, QApplication::UnicodeUTF8));
        menuSettings->setTitle(QApplication::translate("MainWindowClass", "\350\256\276\347\275\256(&S)", 0, QApplication::UnicodeUTF8));
        menu_T->setTitle(QApplication::translate("MainWindowClass", "\346\265\213\350\257\225\347\261\273\345\236\213(&T)", 0, QApplication::UnicodeUTF8));
        menuWindow->setTitle(QApplication::translate("MainWindowClass", "\347\252\227\345\217\243(&W)", 0, QApplication::UnicodeUTF8));
        menuHelp->setTitle(QApplication::translate("MainWindowClass", "\345\270\256\345\212\251(&H)", 0, QApplication::UnicodeUTF8));
        dockWidgetWave->setWindowTitle(QApplication::translate("MainWindowClass", "Time-domain", 0, QApplication::UnicodeUTF8));
        dockWidgetFFT->setWindowTitle(QApplication::translate("MainWindowClass", "Freq-domain", 0, QApplication::UnicodeUTF8));
        dockWidgetLogicWave->setWindowTitle(QApplication::translate("MainWindowClass", "Logic Wave", 0, QApplication::UnicodeUTF8));
        dockWidgetControlPanel->setWindowTitle(QApplication::translate("MainWindowClass", "Control Panel", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class MainWindowClass: public Ui_MainWindowClass {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H

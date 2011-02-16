/********************************************************************************
** Form generated from reading ui file 'ControlPanel.ui'
**
** Created: Tue Feb 15 21:09:50 2011
**      by: Qt User Interface Compiler version 4.5.3
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
********************************************************************************/

#ifndef UI_CONTROLPANEL_H
#define UI_CONTROLPANEL_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QGridLayout>
#include <QtGui/QGroupBox>
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QLineEdit>
#include <QtGui/QPushButton>
#include <QtGui/QSpacerItem>
#include <QtGui/QTabWidget>
#include <QtGui/QTreeView>
#include <QtGui/QVBoxLayout>
#include <QtGui/QWidget>
#include "adcsettingswidget.h"
#include "signalsettingswidget.h"

QT_BEGIN_NAMESPACE

class Ui_ControlPanelClass
{
public:
    QVBoxLayout *verticalLayout_3;
    QGroupBox *groupBox_DeviceList;
    QVBoxLayout *verticalLayout;
    QHBoxLayout *horizontalLayout;
    QLabel *labl;
    QSpacerItem *horizontalSpacer;
    QTreeView *devicesView;
    QGroupBox *groupBox_DeviceList_2;
    QVBoxLayout *verticalLayout_6;
    QGridLayout *gridLayout_10;
    QLabel *labl_25;
    QLineEdit *serverIP;
    QLabel *labl_26;
    QLineEdit *serverPort;
    QSpacerItem *horizontalSpacer_15;
    QSpacerItem *horizontalSpacer_16;
    QTabWidget *tabWidget;
    QWidget *tab_2;
    QVBoxLayout *verticalLayout_4;
    AdcSettingsWidget *adcSettingsWidget;
    QGridLayout *gridLayout_2;
    QSpacerItem *verticalSpacer_2;
    QWidget *tab;
    QVBoxLayout *verticalLayout_5;
    SignalSettingsWidget *signalSettingsWidget;
    QGridLayout *gridLayout_3;
    QSpacerItem *verticalSpacer_3;
    QGroupBox *groupBox_3;
    QVBoxLayout *verticalLayout_2;
    QWidget *dynamicTestButtons;
    QHBoxLayout *horizontalLayout_2;
    QPushButton *pushButtonStartDynamicTest;
    QPushButton *pushButtonStopDynamicTest;
    QWidget *staticTestButtons;
    QHBoxLayout *horizontalLayout_4;
    QPushButton *pushButtonStartStaticTest;
    QPushButton *pushButtonStopStaticTest;
    QSpacerItem *verticalSpacer_4;
    QGroupBox *groupBox_powerStatus;
    QGridLayout *gridLayout_8;
    QGridLayout *gridLayout_9;
    QLabel *labl_22;
    QLineEdit *vaLineEdit;
    QLabel *labl_23;
    QLabel *labl_24;
    QLabel *labl_29;
    QLabel *labl_30;
    QLineEdit *vdLineEdit;
    QLabel *labl_31;
    QLineEdit *iaLineEdit;
    QSpacerItem *horizontalSpacer_13;
    QSpacerItem *horizontalSpacer_14;
    QLabel *labl_32;
    QLineEdit *idLineEdit;
    QLabel *labl_33;
    QLabel *labl_34;
    QLabel *labl_35;
    QLineEdit *powerLineEdit;
    QHBoxLayout *horizontalLayout_5;
    QLabel *labl_2;
    QSpacerItem *horizontalSpacer_2;
    QTreeView *treeViewTdReport;
    QSpacerItem *verticalSpacer;

    void setupUi(QWidget *ControlPanelClass)
    {
        if (ControlPanelClass->objectName().isEmpty())
            ControlPanelClass->setObjectName(QString::fromUtf8("ControlPanelClass"));
        ControlPanelClass->resize(293, 1060);
        verticalLayout_3 = new QVBoxLayout(ControlPanelClass);
        verticalLayout_3->setMargin(0);
        verticalLayout_3->setObjectName(QString::fromUtf8("verticalLayout_3"));
        groupBox_DeviceList = new QGroupBox(ControlPanelClass);
        groupBox_DeviceList->setObjectName(QString::fromUtf8("groupBox_DeviceList"));
        QFont font;
        font.setPointSize(10);
        groupBox_DeviceList->setFont(font);
        groupBox_DeviceList->setAlignment(Qt::AlignCenter);
        verticalLayout = new QVBoxLayout(groupBox_DeviceList);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        labl = new QLabel(groupBox_DeviceList);
        labl->setObjectName(QString::fromUtf8("labl"));
        QFont font1;
        font1.setFamily(QString::fromUtf8("Arial"));
        font1.setPointSize(10);
        labl->setFont(font1);

        horizontalLayout->addWidget(labl);

        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer);


        verticalLayout->addLayout(horizontalLayout);

        devicesView = new QTreeView(groupBox_DeviceList);
        devicesView->setObjectName(QString::fromUtf8("devicesView"));
        QSizePolicy sizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(devicesView->sizePolicy().hasHeightForWidth());
        devicesView->setSizePolicy(sizePolicy);
        devicesView->setMaximumSize(QSize(16777215, 80));
        QFont font2;
        font2.setFamily(QString::fromUtf8("Arial"));
        font2.setPointSize(8);
        devicesView->setFont(font2);

        verticalLayout->addWidget(devicesView);


        verticalLayout_3->addWidget(groupBox_DeviceList);

        groupBox_DeviceList_2 = new QGroupBox(ControlPanelClass);
        groupBox_DeviceList_2->setObjectName(QString::fromUtf8("groupBox_DeviceList_2"));
        groupBox_DeviceList_2->setFont(font);
        groupBox_DeviceList_2->setAlignment(Qt::AlignCenter);
        verticalLayout_6 = new QVBoxLayout(groupBox_DeviceList_2);
        verticalLayout_6->setObjectName(QString::fromUtf8("verticalLayout_6"));
        gridLayout_10 = new QGridLayout();
        gridLayout_10->setObjectName(QString::fromUtf8("gridLayout_10"));
        labl_25 = new QLabel(groupBox_DeviceList_2);
        labl_25->setObjectName(QString::fromUtf8("labl_25"));
        labl_25->setFont(font1);
        labl_25->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_10->addWidget(labl_25, 0, 0, 1, 1);

        serverIP = new QLineEdit(groupBox_DeviceList_2);
        serverIP->setObjectName(QString::fromUtf8("serverIP"));
        serverIP->setEnabled(true);
        QSizePolicy sizePolicy1(QSizePolicy::Expanding, QSizePolicy::Fixed);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(serverIP->sizePolicy().hasHeightForWidth());
        serverIP->setSizePolicy(sizePolicy1);

        gridLayout_10->addWidget(serverIP, 0, 1, 1, 1);

        labl_26 = new QLabel(groupBox_DeviceList_2);
        labl_26->setObjectName(QString::fromUtf8("labl_26"));
        labl_26->setFont(font1);
        labl_26->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_10->addWidget(labl_26, 1, 0, 1, 1);

        serverPort = new QLineEdit(groupBox_DeviceList_2);
        serverPort->setObjectName(QString::fromUtf8("serverPort"));
        sizePolicy1.setHeightForWidth(serverPort->sizePolicy().hasHeightForWidth());
        serverPort->setSizePolicy(sizePolicy1);

        gridLayout_10->addWidget(serverPort, 1, 1, 1, 1);

        horizontalSpacer_15 = new QSpacerItem(75, 0, QSizePolicy::Fixed, QSizePolicy::Minimum);

        gridLayout_10->addItem(horizontalSpacer_15, 2, 0, 1, 1);

        horizontalSpacer_16 = new QSpacerItem(20, 0, QSizePolicy::Fixed, QSizePolicy::Minimum);

        gridLayout_10->addItem(horizontalSpacer_16, 2, 2, 1, 1);


        verticalLayout_6->addLayout(gridLayout_10);


        verticalLayout_3->addWidget(groupBox_DeviceList_2);

        tabWidget = new QTabWidget(ControlPanelClass);
        tabWidget->setObjectName(QString::fromUtf8("tabWidget"));
        tabWidget->setTabPosition(QTabWidget::North);
        tabWidget->setTabShape(QTabWidget::Rounded);
        tab_2 = new QWidget();
        tab_2->setObjectName(QString::fromUtf8("tab_2"));
        verticalLayout_4 = new QVBoxLayout(tab_2);
        verticalLayout_4->setObjectName(QString::fromUtf8("verticalLayout_4"));
        adcSettingsWidget = new AdcSettingsWidget(tab_2);
        adcSettingsWidget->setObjectName(QString::fromUtf8("adcSettingsWidget"));
        gridLayout_2 = new QGridLayout(adcSettingsWidget);
        gridLayout_2->setSpacing(0);
        gridLayout_2->setMargin(0);
        gridLayout_2->setObjectName(QString::fromUtf8("gridLayout_2"));

        verticalLayout_4->addWidget(adcSettingsWidget);

        verticalSpacer_2 = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout_4->addItem(verticalSpacer_2);

        tabWidget->addTab(tab_2, QString());
        tab = new QWidget();
        tab->setObjectName(QString::fromUtf8("tab"));
        verticalLayout_5 = new QVBoxLayout(tab);
        verticalLayout_5->setObjectName(QString::fromUtf8("verticalLayout_5"));
        signalSettingsWidget = new SignalSettingsWidget(tab);
        signalSettingsWidget->setObjectName(QString::fromUtf8("signalSettingsWidget"));
        gridLayout_3 = new QGridLayout(signalSettingsWidget);
        gridLayout_3->setSpacing(0);
        gridLayout_3->setMargin(0);
        gridLayout_3->setObjectName(QString::fromUtf8("gridLayout_3"));

        verticalLayout_5->addWidget(signalSettingsWidget);

        verticalSpacer_3 = new QSpacerItem(20, 136, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout_5->addItem(verticalSpacer_3);

        tabWidget->addTab(tab, QString());

        verticalLayout_3->addWidget(tabWidget);

        groupBox_3 = new QGroupBox(ControlPanelClass);
        groupBox_3->setObjectName(QString::fromUtf8("groupBox_3"));
        groupBox_3->setAlignment(Qt::AlignCenter);
        verticalLayout_2 = new QVBoxLayout(groupBox_3);
        verticalLayout_2->setObjectName(QString::fromUtf8("verticalLayout_2"));
        dynamicTestButtons = new QWidget(groupBox_3);
        dynamicTestButtons->setObjectName(QString::fromUtf8("dynamicTestButtons"));
        horizontalLayout_2 = new QHBoxLayout(dynamicTestButtons);
        horizontalLayout_2->setMargin(0);
        horizontalLayout_2->setObjectName(QString::fromUtf8("horizontalLayout_2"));
        pushButtonStartDynamicTest = new QPushButton(dynamicTestButtons);
        pushButtonStartDynamicTest->setObjectName(QString::fromUtf8("pushButtonStartDynamicTest"));
        QSizePolicy sizePolicy2(QSizePolicy::Preferred, QSizePolicy::Fixed);
        sizePolicy2.setHorizontalStretch(0);
        sizePolicy2.setVerticalStretch(0);
        sizePolicy2.setHeightForWidth(pushButtonStartDynamicTest->sizePolicy().hasHeightForWidth());
        pushButtonStartDynamicTest->setSizePolicy(sizePolicy2);

        horizontalLayout_2->addWidget(pushButtonStartDynamicTest);

        pushButtonStopDynamicTest = new QPushButton(dynamicTestButtons);
        pushButtonStopDynamicTest->setObjectName(QString::fromUtf8("pushButtonStopDynamicTest"));
        pushButtonStopDynamicTest->setEnabled(false);

        horizontalLayout_2->addWidget(pushButtonStopDynamicTest);


        verticalLayout_2->addWidget(dynamicTestButtons);

        staticTestButtons = new QWidget(groupBox_3);
        staticTestButtons->setObjectName(QString::fromUtf8("staticTestButtons"));
        horizontalLayout_4 = new QHBoxLayout(staticTestButtons);
        horizontalLayout_4->setMargin(0);
        horizontalLayout_4->setObjectName(QString::fromUtf8("horizontalLayout_4"));
        pushButtonStartStaticTest = new QPushButton(staticTestButtons);
        pushButtonStartStaticTest->setObjectName(QString::fromUtf8("pushButtonStartStaticTest"));

        horizontalLayout_4->addWidget(pushButtonStartStaticTest);

        pushButtonStopStaticTest = new QPushButton(staticTestButtons);
        pushButtonStopStaticTest->setObjectName(QString::fromUtf8("pushButtonStopStaticTest"));
        pushButtonStopStaticTest->setEnabled(false);

        horizontalLayout_4->addWidget(pushButtonStopStaticTest);


        verticalLayout_2->addWidget(staticTestButtons);


        verticalLayout_3->addWidget(groupBox_3);

        verticalSpacer_4 = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout_3->addItem(verticalSpacer_4);

        groupBox_powerStatus = new QGroupBox(ControlPanelClass);
        groupBox_powerStatus->setObjectName(QString::fromUtf8("groupBox_powerStatus"));
        groupBox_powerStatus->setAlignment(Qt::AlignCenter);
        gridLayout_8 = new QGridLayout(groupBox_powerStatus);
        gridLayout_8->setObjectName(QString::fromUtf8("gridLayout_8"));
        gridLayout_9 = new QGridLayout();
        gridLayout_9->setObjectName(QString::fromUtf8("gridLayout_9"));
        labl_22 = new QLabel(groupBox_powerStatus);
        labl_22->setObjectName(QString::fromUtf8("labl_22"));
        labl_22->setFont(font1);
        labl_22->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_9->addWidget(labl_22, 0, 0, 1, 1);

        vaLineEdit = new QLineEdit(groupBox_powerStatus);
        vaLineEdit->setObjectName(QString::fromUtf8("vaLineEdit"));
        vaLineEdit->setEnabled(true);
        sizePolicy1.setHeightForWidth(vaLineEdit->sizePolicy().hasHeightForWidth());
        vaLineEdit->setSizePolicy(sizePolicy1);

        gridLayout_9->addWidget(vaLineEdit, 0, 1, 1, 1);

        labl_23 = new QLabel(groupBox_powerStatus);
        labl_23->setObjectName(QString::fromUtf8("labl_23"));
        labl_23->setFont(font1);
        labl_23->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_9->addWidget(labl_23, 1, 0, 1, 1);

        labl_24 = new QLabel(groupBox_powerStatus);
        labl_24->setObjectName(QString::fromUtf8("labl_24"));
        labl_24->setFont(font1);
        labl_24->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_9->addWidget(labl_24, 2, 0, 1, 1);

        labl_29 = new QLabel(groupBox_powerStatus);
        labl_29->setObjectName(QString::fromUtf8("labl_29"));
        QSizePolicy sizePolicy3(QSizePolicy::Preferred, QSizePolicy::Preferred);
        sizePolicy3.setHorizontalStretch(0);
        sizePolicy3.setVerticalStretch(0);
        sizePolicy3.setHeightForWidth(labl_29->sizePolicy().hasHeightForWidth());
        labl_29->setSizePolicy(sizePolicy3);
        labl_29->setFont(font1);

        gridLayout_9->addWidget(labl_29, 2, 2, 1, 1);

        labl_30 = new QLabel(groupBox_powerStatus);
        labl_30->setObjectName(QString::fromUtf8("labl_30"));
        labl_30->setFont(font1);

        gridLayout_9->addWidget(labl_30, 0, 2, 1, 1);

        vdLineEdit = new QLineEdit(groupBox_powerStatus);
        vdLineEdit->setObjectName(QString::fromUtf8("vdLineEdit"));
        sizePolicy1.setHeightForWidth(vdLineEdit->sizePolicy().hasHeightForWidth());
        vdLineEdit->setSizePolicy(sizePolicy1);

        gridLayout_9->addWidget(vdLineEdit, 1, 1, 1, 1);

        labl_31 = new QLabel(groupBox_powerStatus);
        labl_31->setObjectName(QString::fromUtf8("labl_31"));
        labl_31->setFont(font1);

        gridLayout_9->addWidget(labl_31, 1, 2, 1, 1);

        iaLineEdit = new QLineEdit(groupBox_powerStatus);
        iaLineEdit->setObjectName(QString::fromUtf8("iaLineEdit"));
        sizePolicy1.setHeightForWidth(iaLineEdit->sizePolicy().hasHeightForWidth());
        iaLineEdit->setSizePolicy(sizePolicy1);

        gridLayout_9->addWidget(iaLineEdit, 2, 1, 1, 1);

        horizontalSpacer_13 = new QSpacerItem(75, 0, QSizePolicy::Fixed, QSizePolicy::Minimum);

        gridLayout_9->addItem(horizontalSpacer_13, 5, 0, 1, 1);

        horizontalSpacer_14 = new QSpacerItem(20, 0, QSizePolicy::Fixed, QSizePolicy::Minimum);

        gridLayout_9->addItem(horizontalSpacer_14, 5, 2, 1, 1);

        labl_32 = new QLabel(groupBox_powerStatus);
        labl_32->setObjectName(QString::fromUtf8("labl_32"));
        labl_32->setFont(font1);
        labl_32->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_9->addWidget(labl_32, 3, 0, 1, 1);

        idLineEdit = new QLineEdit(groupBox_powerStatus);
        idLineEdit->setObjectName(QString::fromUtf8("idLineEdit"));
        sizePolicy1.setHeightForWidth(idLineEdit->sizePolicy().hasHeightForWidth());
        idLineEdit->setSizePolicy(sizePolicy1);

        gridLayout_9->addWidget(idLineEdit, 3, 1, 1, 1);

        labl_33 = new QLabel(groupBox_powerStatus);
        labl_33->setObjectName(QString::fromUtf8("labl_33"));
        labl_33->setFont(font1);

        gridLayout_9->addWidget(labl_33, 3, 2, 1, 1);

        labl_34 = new QLabel(groupBox_powerStatus);
        labl_34->setObjectName(QString::fromUtf8("labl_34"));
        labl_34->setFont(font1);
        labl_34->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_9->addWidget(labl_34, 4, 0, 1, 1);

        labl_35 = new QLabel(groupBox_powerStatus);
        labl_35->setObjectName(QString::fromUtf8("labl_35"));
        labl_35->setFont(font1);

        gridLayout_9->addWidget(labl_35, 4, 2, 1, 1);

        powerLineEdit = new QLineEdit(groupBox_powerStatus);
        powerLineEdit->setObjectName(QString::fromUtf8("powerLineEdit"));
        sizePolicy1.setHeightForWidth(powerLineEdit->sizePolicy().hasHeightForWidth());
        powerLineEdit->setSizePolicy(sizePolicy1);

        gridLayout_9->addWidget(powerLineEdit, 4, 1, 1, 1);


        gridLayout_8->addLayout(gridLayout_9, 0, 0, 1, 1);


        verticalLayout_3->addWidget(groupBox_powerStatus);

        horizontalLayout_5 = new QHBoxLayout();
        horizontalLayout_5->setObjectName(QString::fromUtf8("horizontalLayout_5"));
        labl_2 = new QLabel(ControlPanelClass);
        labl_2->setObjectName(QString::fromUtf8("labl_2"));
        labl_2->setFont(font1);

        horizontalLayout_5->addWidget(labl_2);

        horizontalSpacer_2 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_5->addItem(horizontalSpacer_2);


        verticalLayout_3->addLayout(horizontalLayout_5);

        treeViewTdReport = new QTreeView(ControlPanelClass);
        treeViewTdReport->setObjectName(QString::fromUtf8("treeViewTdReport"));
        treeViewTdReport->setFont(font2);

        verticalLayout_3->addWidget(treeViewTdReport);

        verticalSpacer = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout_3->addItem(verticalSpacer);


        retranslateUi(ControlPanelClass);

        tabWidget->setCurrentIndex(0);


        QMetaObject::connectSlotsByName(ControlPanelClass);
    } // setupUi

    void retranslateUi(QWidget *ControlPanelClass)
    {
        ControlPanelClass->setWindowTitle(QApplication::translate("ControlPanelClass", "Control Panel", 0, QApplication::UnicodeUTF8));
        groupBox_DeviceList->setTitle(QApplication::translate("ControlPanelClass", "\345\217\257\347\224\250\347\232\204\347\275\221\347\273\234\350\256\276\345\244\207", 0, QApplication::UnicodeUTF8));
        labl->setText(QApplication::translate("ControlPanelClass", "\350\257\267\351\200\211\346\213\251\347\275\221\347\273\234", 0, QApplication::UnicodeUTF8));
        groupBox_DeviceList_2->setTitle(QApplication::translate("ControlPanelClass", "\346\234\215\345\212\241\345\231\250", 0, QApplication::UnicodeUTF8));
        labl_25->setText(QApplication::translate("ControlPanelClass", "\345\234\260\345\235\200", 0, QApplication::UnicodeUTF8));
        labl_26->setText(QApplication::translate("ControlPanelClass", "\347\253\257\345\217\243", 0, QApplication::UnicodeUTF8));
        tabWidget->setTabText(tabWidget->indexOf(tab_2), QApplication::translate("ControlPanelClass", "ADC\344\277\241\345\217\267\350\256\276\347\275\256", 0, QApplication::UnicodeUTF8));
        tabWidget->setTabText(tabWidget->indexOf(tab), QApplication::translate("ControlPanelClass", "\346\227\266\351\222\237\344\277\241\345\217\267\350\256\276\347\275\256", 0, QApplication::UnicodeUTF8));
        groupBox_3->setTitle(QString());
        pushButtonStartDynamicTest->setText(QApplication::translate("ControlPanelClass", "\345\212\250\346\200\201\346\265\213\350\257\225", 0, QApplication::UnicodeUTF8));
        pushButtonStopDynamicTest->setText(QApplication::translate("ControlPanelClass", "\345\201\234\346\255\242", 0, QApplication::UnicodeUTF8));
        pushButtonStartStaticTest->setText(QApplication::translate("ControlPanelClass", "\351\235\231\346\200\201\346\265\213\350\257\225", 0, QApplication::UnicodeUTF8));
        pushButtonStopStaticTest->setText(QApplication::translate("ControlPanelClass", "\345\201\234\346\255\242", 0, QApplication::UnicodeUTF8));
        groupBox_powerStatus->setTitle(QApplication::translate("ControlPanelClass", "\347\224\265\346\272\220\347\233\221\346\216\247", 0, QApplication::UnicodeUTF8));
        labl_22->setText(QApplication::translate("ControlPanelClass", "V<sub>A</sub>\346\250\241\346\213\237\347\224\265\345\216\213", 0, QApplication::UnicodeUTF8));
        labl_23->setText(QApplication::translate("ControlPanelClass", "V<sub>D</sub>\346\225\260\345\255\227\347\224\265\345\216\213", 0, QApplication::UnicodeUTF8));
        labl_24->setText(QApplication::translate("ControlPanelClass", "I<sub>A</sub>\346\250\241\346\213\237\347\224\265\346\265\201", 0, QApplication::UnicodeUTF8));
        labl_29->setText(QApplication::translate("ControlPanelClass", "mA", 0, QApplication::UnicodeUTF8));
        labl_30->setText(QApplication::translate("ControlPanelClass", "V", 0, QApplication::UnicodeUTF8));
        labl_31->setText(QApplication::translate("ControlPanelClass", "V", 0, QApplication::UnicodeUTF8));
        labl_32->setText(QApplication::translate("ControlPanelClass", "I<sub>D</sub>\346\225\260\345\255\227\347\224\265\346\265\201", 0, QApplication::UnicodeUTF8));
        labl_33->setText(QApplication::translate("ControlPanelClass", "mA", 0, QApplication::UnicodeUTF8));
        labl_34->setText(QApplication::translate("ControlPanelClass", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
"p, li { white-space: pre-wrap; }\n"
"</style></head><body style=\" font-family:'Arial'; font-size:10pt; font-weight:400; font-style:normal;\">\n"
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">\346\200\273\345\212\237\350\200\227</p></body></html>", 0, QApplication::UnicodeUTF8));
        labl_35->setText(QApplication::translate("ControlPanelClass", "mW", 0, QApplication::UnicodeUTF8));
        labl_2->setText(QApplication::translate("ControlPanelClass", "Parameters", 0, QApplication::UnicodeUTF8));
        Q_UNUSED(ControlPanelClass);
    } // retranslateUi

};

namespace Ui {
    class ControlPanelClass: public Ui_ControlPanelClass {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_CONTROLPANEL_H

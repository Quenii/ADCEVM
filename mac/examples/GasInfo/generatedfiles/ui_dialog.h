/********************************************************************************
** Form generated from reading UI file 'dialog.ui'
**
** Created: Sun Mar 18 22:26:58 2012
**      by: Qt User Interface Compiler version 4.7.3
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DIALOG_H
#define UI_DIALOG_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QComboBox>
#include <QtGui/QDialog>
#include <QtGui/QGridLayout>
#include <QtGui/QGroupBox>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QLineEdit>
#include <QtGui/QPushButton>
#include <QtGui/QTabWidget>
#include <QtGui/QWidget>
#include "hled.h"

QT_BEGIN_NAMESPACE

class Ui_Dialog
{
public:
    QGroupBox *groupBox;
    QGridLayout *gridLayout_2;
    QLineEdit *lineEditDevice;
    QPushButton *pushButtonChangeSettings;
    QLabel *label;
    QPushButton *pushButtonOpen;
    HLed *led;
    QGroupBox *groupBox_2;
    QGridLayout *gridLayout_3;
    QTabWidget *tabWidgetStation;
    QWidget *tab;
    QWidget *tab_2;
    QGroupBox *groupBox_3;
    QGridLayout *gridLayout_4;
    QLabel *label_2;
    QPushButton *pushButtonOpenGps;
    HLed *ledGps;
    QComboBox *comboBoxGps;

    void setupUi(QDialog *Dialog)
    {
        if (Dialog->objectName().isEmpty())
            Dialog->setObjectName(QString::fromUtf8("Dialog"));
        Dialog->resize(645, 540);
        QSizePolicy sizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(Dialog->sizePolicy().hasHeightForWidth());
        Dialog->setSizePolicy(sizePolicy);
        groupBox = new QGroupBox(Dialog);
        groupBox->setObjectName(QString::fromUtf8("groupBox"));
        groupBox->setGeometry(QRect(30, 20, 591, 81));
        QSizePolicy sizePolicy1(QSizePolicy::Expanding, QSizePolicy::Preferred);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(groupBox->sizePolicy().hasHeightForWidth());
        groupBox->setSizePolicy(sizePolicy1);
        gridLayout_2 = new QGridLayout(groupBox);
        gridLayout_2->setSpacing(6);
        gridLayout_2->setContentsMargins(11, 11, 11, 11);
        gridLayout_2->setObjectName(QString::fromUtf8("gridLayout_2"));
        lineEditDevice = new QLineEdit(groupBox);
        lineEditDevice->setObjectName(QString::fromUtf8("lineEditDevice"));
        lineEditDevice->setEnabled(false);

        gridLayout_2->addWidget(lineEditDevice, 0, 1, 1, 1);

        pushButtonChangeSettings = new QPushButton(groupBox);
        pushButtonChangeSettings->setObjectName(QString::fromUtf8("pushButtonChangeSettings"));

        gridLayout_2->addWidget(pushButtonChangeSettings, 0, 4, 1, 1);

        label = new QLabel(groupBox);
        label->setObjectName(QString::fromUtf8("label"));

        gridLayout_2->addWidget(label, 0, 0, 1, 1);

        pushButtonOpen = new QPushButton(groupBox);
        pushButtonOpen->setObjectName(QString::fromUtf8("pushButtonOpen"));
        QSizePolicy sizePolicy2(QSizePolicy::Minimum, QSizePolicy::Fixed);
        sizePolicy2.setHorizontalStretch(0);
        sizePolicy2.setVerticalStretch(0);
        sizePolicy2.setHeightForWidth(pushButtonOpen->sizePolicy().hasHeightForWidth());
        pushButtonOpen->setSizePolicy(sizePolicy2);

        gridLayout_2->addWidget(pushButtonOpen, 0, 3, 1, 1);

        led = new HLed(groupBox);
        led->setObjectName(QString::fromUtf8("led"));
        QSizePolicy sizePolicy3(QSizePolicy::Fixed, QSizePolicy::Fixed);
        sizePolicy3.setHorizontalStretch(0);
        sizePolicy3.setVerticalStretch(0);
        sizePolicy3.setHeightForWidth(led->sizePolicy().hasHeightForWidth());
        led->setSizePolicy(sizePolicy3);
        led->setMinimumSize(QSize(20, 20));
        led->setMaximumSize(QSize(25, 25));

        gridLayout_2->addWidget(led, 0, 2, 1, 1);

        groupBox_2 = new QGroupBox(Dialog);
        groupBox_2->setObjectName(QString::fromUtf8("groupBox_2"));
        groupBox_2->setGeometry(QRect(30, 180, 591, 341));
        sizePolicy.setHeightForWidth(groupBox_2->sizePolicy().hasHeightForWidth());
        groupBox_2->setSizePolicy(sizePolicy);
        gridLayout_3 = new QGridLayout(groupBox_2);
        gridLayout_3->setSpacing(6);
        gridLayout_3->setContentsMargins(11, 11, 11, 11);
        gridLayout_3->setObjectName(QString::fromUtf8("gridLayout_3"));
        tabWidgetStation = new QTabWidget(groupBox_2);
        tabWidgetStation->setObjectName(QString::fromUtf8("tabWidgetStation"));
        tab = new QWidget();
        tab->setObjectName(QString::fromUtf8("tab"));
        tabWidgetStation->addTab(tab, QString());
        tab_2 = new QWidget();
        tab_2->setObjectName(QString::fromUtf8("tab_2"));
        tabWidgetStation->addTab(tab_2, QString());

        gridLayout_3->addWidget(tabWidgetStation, 0, 0, 1, 1);

        groupBox_3 = new QGroupBox(Dialog);
        groupBox_3->setObjectName(QString::fromUtf8("groupBox_3"));
        groupBox_3->setGeometry(QRect(30, 100, 591, 81));
        sizePolicy.setHeightForWidth(groupBox_3->sizePolicy().hasHeightForWidth());
        groupBox_3->setSizePolicy(sizePolicy);
        gridLayout_4 = new QGridLayout(groupBox_3);
        gridLayout_4->setSpacing(6);
        gridLayout_4->setContentsMargins(11, 11, 11, 11);
        gridLayout_4->setObjectName(QString::fromUtf8("gridLayout_4"));
        label_2 = new QLabel(groupBox_3);
        label_2->setObjectName(QString::fromUtf8("label_2"));

        gridLayout_4->addWidget(label_2, 0, 0, 1, 1);

        pushButtonOpenGps = new QPushButton(groupBox_3);
        pushButtonOpenGps->setObjectName(QString::fromUtf8("pushButtonOpenGps"));
        sizePolicy2.setHeightForWidth(pushButtonOpenGps->sizePolicy().hasHeightForWidth());
        pushButtonOpenGps->setSizePolicy(sizePolicy2);

        gridLayout_4->addWidget(pushButtonOpenGps, 0, 3, 1, 1);

        ledGps = new HLed(groupBox_3);
        ledGps->setObjectName(QString::fromUtf8("ledGps"));
        sizePolicy3.setHeightForWidth(ledGps->sizePolicy().hasHeightForWidth());
        ledGps->setSizePolicy(sizePolicy3);
        ledGps->setMinimumSize(QSize(20, 20));
        ledGps->setMaximumSize(QSize(25, 25));

        gridLayout_4->addWidget(ledGps, 0, 2, 1, 1);

        comboBoxGps = new QComboBox(groupBox_3);
        comboBoxGps->setObjectName(QString::fromUtf8("comboBoxGps"));
        QSizePolicy sizePolicy4(QSizePolicy::Expanding, QSizePolicy::Fixed);
        sizePolicy4.setHorizontalStretch(0);
        sizePolicy4.setVerticalStretch(0);
        sizePolicy4.setHeightForWidth(comboBoxGps->sizePolicy().hasHeightForWidth());
        comboBoxGps->setSizePolicy(sizePolicy4);

        gridLayout_4->addWidget(comboBoxGps, 0, 1, 1, 1);


        retranslateUi(Dialog);

        QMetaObject::connectSlotsByName(Dialog);
    } // setupUi

    void retranslateUi(QDialog *Dialog)
    {
        Dialog->setWindowTitle(QApplication::translate("Dialog", "Dialog", 0, QApplication::UnicodeUTF8));
        groupBox->setTitle(QApplication::translate("Dialog", "Zigbee Setting", 0, QApplication::UnicodeUTF8));
        pushButtonChangeSettings->setText(QApplication::translate("Dialog", "Change Settings", 0, QApplication::UnicodeUTF8));
        label->setText(QApplication::translate("Dialog", "Current Port:  ", 0, QApplication::UnicodeUTF8));
        pushButtonOpen->setText(QApplication::translate("Dialog", "Start", 0, QApplication::UnicodeUTF8));
        groupBox_2->setTitle(QApplication::translate("Dialog", "Station Info", 0, QApplication::UnicodeUTF8));
        tabWidgetStation->setTabText(tabWidgetStation->indexOf(tab), QApplication::translate("Dialog", "Tab 1", 0, QApplication::UnicodeUTF8));
        tabWidgetStation->setTabText(tabWidgetStation->indexOf(tab_2), QApplication::translate("Dialog", "Tab 2", 0, QApplication::UnicodeUTF8));
        groupBox_3->setTitle(QApplication::translate("Dialog", "Gps Setting", 0, QApplication::UnicodeUTF8));
        label_2->setText(QApplication::translate("Dialog", "Current Port:  ", 0, QApplication::UnicodeUTF8));
        pushButtonOpenGps->setText(QApplication::translate("Dialog", "Start", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class Dialog: public Ui_Dialog {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DIALOG_H

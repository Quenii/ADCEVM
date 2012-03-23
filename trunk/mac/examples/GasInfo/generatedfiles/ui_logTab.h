/********************************************************************************
** Form generated from reading UI file 'logTab.ui'
**
** Created: Sun Mar 18 22:28:25 2012
**      by: Qt User Interface Compiler version 4.7.3
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_LOGTAB_H
#define UI_LOGTAB_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QGroupBox>
#include <QtGui/QHeaderView>
#include <QtGui/QPlainTextEdit>
#include <QtGui/QWidget>

QT_BEGIN_NAMESPACE

class Ui_LogTab
{
public:
    QGroupBox *groupBox;
    QPlainTextEdit *plainTextEditZigbee;
    QGroupBox *groupBox_2;
    QPlainTextEdit *plainTextEditGps;

    void setupUi(QWidget *LogTab)
    {
        if (LogTab->objectName().isEmpty())
            LogTab->setObjectName(QString::fromUtf8("LogTab"));
        LogTab->resize(550, 243);
        groupBox = new QGroupBox(LogTab);
        groupBox->setObjectName(QString::fromUtf8("groupBox"));
        groupBox->setGeometry(QRect(10, 20, 251, 211));
        plainTextEditZigbee = new QPlainTextEdit(groupBox);
        plainTextEditZigbee->setObjectName(QString::fromUtf8("plainTextEditZigbee"));
        plainTextEditZigbee->setGeometry(QRect(10, 30, 231, 171));
        groupBox_2 = new QGroupBox(LogTab);
        groupBox_2->setObjectName(QString::fromUtf8("groupBox_2"));
        groupBox_2->setGeometry(QRect(280, 20, 251, 211));
        plainTextEditGps = new QPlainTextEdit(groupBox_2);
        plainTextEditGps->setObjectName(QString::fromUtf8("plainTextEditGps"));
        plainTextEditGps->setGeometry(QRect(10, 30, 231, 171));

        retranslateUi(LogTab);

        QMetaObject::connectSlotsByName(LogTab);
    } // setupUi

    void retranslateUi(QWidget *LogTab)
    {
        LogTab->setWindowTitle(QApplication::translate("LogTab", "Form", 0, QApplication::UnicodeUTF8));
        groupBox->setTitle(QApplication::translate("LogTab", "Zigbee Log", 0, QApplication::UnicodeUTF8));
        groupBox_2->setTitle(QApplication::translate("LogTab", "Gps Log", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class LogTab: public Ui_LogTab {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_LOGTAB_H

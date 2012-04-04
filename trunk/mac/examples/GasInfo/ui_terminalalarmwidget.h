/********************************************************************************
** Form generated from reading UI file 'terminalalarmwidget.ui'
**
** Created: Wed 4. Apr 23:18:02 2012
**      by: Qt User Interface Compiler version 4.7.4
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_TERMINALALARMWIDGET_H
#define UI_TERMINALALARMWIDGET_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QPushButton>
#include <QtGui/QSpacerItem>
#include <QtGui/QVBoxLayout>
#include <QtGui/QWidget>

QT_BEGIN_NAMESPACE

class Ui_TerminalAlarmWidget
{
public:
    QVBoxLayout *verticalLayout;
    QSpacerItem *verticalSpacer_2;
    QLabel *label;
    QSpacerItem *verticalSpacer;
    QHBoxLayout *horizontalLayout;
    QSpacerItem *horizontalSpacer;
    QPushButton *pushButtonYes;
    QPushButton *pushButtonNo;
    QSpacerItem *horizontalSpacer_2;

    void setupUi(QWidget *TerminalAlarmWidget)
    {
        if (TerminalAlarmWidget->objectName().isEmpty())
            TerminalAlarmWidget->setObjectName(QString::fromUtf8("TerminalAlarmWidget"));
        TerminalAlarmWidget->resize(458, 111);
        verticalLayout = new QVBoxLayout(TerminalAlarmWidget);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        verticalSpacer_2 = new QSpacerItem(153, 16, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout->addItem(verticalSpacer_2);

        label = new QLabel(TerminalAlarmWidget);
        label->setObjectName(QString::fromUtf8("label"));
        label->setWordWrap(true);

        verticalLayout->addWidget(label);

        verticalSpacer = new QSpacerItem(153, 15, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout->addItem(verticalSpacer);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        horizontalSpacer = new QSpacerItem(117, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer);

        pushButtonYes = new QPushButton(TerminalAlarmWidget);
        pushButtonYes->setObjectName(QString::fromUtf8("pushButtonYes"));

        horizontalLayout->addWidget(pushButtonYes);

        pushButtonNo = new QPushButton(TerminalAlarmWidget);
        pushButtonNo->setObjectName(QString::fromUtf8("pushButtonNo"));

        horizontalLayout->addWidget(pushButtonNo);

        horizontalSpacer_2 = new QSpacerItem(117, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer_2);


        verticalLayout->addLayout(horizontalLayout);


        retranslateUi(TerminalAlarmWidget);

        QMetaObject::connectSlotsByName(TerminalAlarmWidget);
    } // setupUi

    void retranslateUi(QWidget *TerminalAlarmWidget)
    {
        TerminalAlarmWidget->setWindowTitle(QApplication::translate("TerminalAlarmWidget", "Terminal Alerm", 0, QApplication::UnicodeUTF8));
        label->setText(QString());
        pushButtonYes->setText(QApplication::translate("TerminalAlarmWidget", "Yes", 0, QApplication::UnicodeUTF8));
        pushButtonNo->setText(QApplication::translate("TerminalAlarmWidget", "No", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class TerminalAlarmWidget: public Ui_TerminalAlarmWidget {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_TERMINALALARMWIDGET_H

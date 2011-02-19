/********************************************************************************
** Form generated from reading ui file 'SignalSettingsWidget.ui'
**
** Created: Sat Feb 19 10:25:25 2011
**      by: Qt User Interface Compiler version 4.5.3
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
********************************************************************************/

#ifndef UI_SIGNALSETTINGSWIDGET_H
#define UI_SIGNALSETTINGSWIDGET_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QGridLayout>
#include <QtGui/QGroupBox>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QLineEdit>
#include <QtGui/QPushButton>
#include <QtGui/QSpacerItem>
#include <QtGui/QWidget>

QT_BEGIN_NAMESPACE

class Ui_SignalSettingsWidgetClass
{
public:
    QGridLayout *gridLayout;
    QGroupBox *groupBox_2;
    QGridLayout *gridLayout_3;
    QGridLayout *gridLayout_4;
    QLabel *labl_14;
    QLineEdit *clockFreqMHzLineEdit;
    QLabel *labl_15;
    QLabel *labl_17;
    QLabel *labl_18;
    QLabel *labl_25;
    QLineEdit *signalFreqLineEdit;
    QLabel *labl_26;
    QLineEdit *signalPowerLineEdit;
    QPushButton *pushButtonChangeSettings;
    QSpacerItem *horizontalSpacer;
    QSpacerItem *horizontalSpacer_2;

    void setupUi(QWidget *SignalSettingsWidgetClass)
    {
        if (SignalSettingsWidgetClass->objectName().isEmpty())
            SignalSettingsWidgetClass->setObjectName(QString::fromUtf8("SignalSettingsWidgetClass"));
        SignalSettingsWidgetClass->resize(302, 123);
        gridLayout = new QGridLayout(SignalSettingsWidgetClass);
        gridLayout->setMargin(0);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        groupBox_2 = new QGroupBox(SignalSettingsWidgetClass);
        groupBox_2->setObjectName(QString::fromUtf8("groupBox_2"));
        groupBox_2->setMaximumSize(QSize(16777215, 123));
        groupBox_2->setAlignment(Qt::AlignCenter);
        gridLayout_3 = new QGridLayout(groupBox_2);
        gridLayout_3->setObjectName(QString::fromUtf8("gridLayout_3"));
        gridLayout_4 = new QGridLayout();
        gridLayout_4->setObjectName(QString::fromUtf8("gridLayout_4"));
        labl_14 = new QLabel(groupBox_2);
        labl_14->setObjectName(QString::fromUtf8("labl_14"));
        labl_14->setMinimumSize(QSize(75, 0));
        labl_14->setMaximumSize(QSize(75, 16777215));
        QFont font;
        font.setFamily(QString::fromUtf8("Arial"));
        font.setPointSize(10);
        labl_14->setFont(font);
        labl_14->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_4->addWidget(labl_14, 0, 0, 1, 1);

        clockFreqMHzLineEdit = new QLineEdit(groupBox_2);
        clockFreqMHzLineEdit->setObjectName(QString::fromUtf8("clockFreqMHzLineEdit"));
        clockFreqMHzLineEdit->setEnabled(true);
        QSizePolicy sizePolicy(QSizePolicy::Preferred, QSizePolicy::Fixed);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(clockFreqMHzLineEdit->sizePolicy().hasHeightForWidth());
        clockFreqMHzLineEdit->setSizePolicy(sizePolicy);
        clockFreqMHzLineEdit->setReadOnly(true);

        gridLayout_4->addWidget(clockFreqMHzLineEdit, 0, 1, 1, 1);

        labl_15 = new QLabel(groupBox_2);
        labl_15->setObjectName(QString::fromUtf8("labl_15"));
        labl_15->setFont(font);
        labl_15->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_4->addWidget(labl_15, 1, 0, 1, 1);

        labl_17 = new QLabel(groupBox_2);
        labl_17->setObjectName(QString::fromUtf8("labl_17"));
        labl_17->setFont(font);
        labl_17->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_4->addWidget(labl_17, 2, 0, 1, 1);

        labl_18 = new QLabel(groupBox_2);
        labl_18->setObjectName(QString::fromUtf8("labl_18"));
        QSizePolicy sizePolicy1(QSizePolicy::Minimum, QSizePolicy::Preferred);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(labl_18->sizePolicy().hasHeightForWidth());
        labl_18->setSizePolicy(sizePolicy1);
        labl_18->setFont(font);

        gridLayout_4->addWidget(labl_18, 2, 2, 1, 1);

        labl_25 = new QLabel(groupBox_2);
        labl_25->setObjectName(QString::fromUtf8("labl_25"));
        sizePolicy1.setHeightForWidth(labl_25->sizePolicy().hasHeightForWidth());
        labl_25->setSizePolicy(sizePolicy1);
        labl_25->setFont(font);

        gridLayout_4->addWidget(labl_25, 0, 2, 1, 1);

        signalFreqLineEdit = new QLineEdit(groupBox_2);
        signalFreqLineEdit->setObjectName(QString::fromUtf8("signalFreqLineEdit"));
        signalFreqLineEdit->setEnabled(true);
        sizePolicy.setHeightForWidth(signalFreqLineEdit->sizePolicy().hasHeightForWidth());
        signalFreqLineEdit->setSizePolicy(sizePolicy);
        signalFreqLineEdit->setReadOnly(true);

        gridLayout_4->addWidget(signalFreqLineEdit, 1, 1, 1, 1);

        labl_26 = new QLabel(groupBox_2);
        labl_26->setObjectName(QString::fromUtf8("labl_26"));
        sizePolicy1.setHeightForWidth(labl_26->sizePolicy().hasHeightForWidth());
        labl_26->setSizePolicy(sizePolicy1);
        labl_26->setFont(font);

        gridLayout_4->addWidget(labl_26, 1, 2, 1, 1);

        signalPowerLineEdit = new QLineEdit(groupBox_2);
        signalPowerLineEdit->setObjectName(QString::fromUtf8("signalPowerLineEdit"));
        signalPowerLineEdit->setEnabled(true);
        sizePolicy.setHeightForWidth(signalPowerLineEdit->sizePolicy().hasHeightForWidth());
        signalPowerLineEdit->setSizePolicy(sizePolicy);
        signalPowerLineEdit->setReadOnly(true);

        gridLayout_4->addWidget(signalPowerLineEdit, 2, 1, 1, 1);


        gridLayout_3->addLayout(gridLayout_4, 1, 0, 1, 3);

        pushButtonChangeSettings = new QPushButton(groupBox_2);
        pushButtonChangeSettings->setObjectName(QString::fromUtf8("pushButtonChangeSettings"));

        gridLayout_3->addWidget(pushButtonChangeSettings, 0, 1, 1, 1);

        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        gridLayout_3->addItem(horizontalSpacer, 0, 0, 1, 1);

        horizontalSpacer_2 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        gridLayout_3->addItem(horizontalSpacer_2, 0, 2, 1, 1);


        gridLayout->addWidget(groupBox_2, 0, 0, 1, 1);


        retranslateUi(SignalSettingsWidgetClass);

        QMetaObject::connectSlotsByName(SignalSettingsWidgetClass);
    } // setupUi

    void retranslateUi(QWidget *SignalSettingsWidgetClass)
    {
        SignalSettingsWidgetClass->setWindowTitle(QApplication::translate("SignalSettingsWidgetClass", "\346\227\266\351\222\237\344\277\241\345\217\267\350\256\276\347\275\256", 0, QApplication::UnicodeUTF8));
        groupBox_2->setTitle(QString());
        labl_14->setText(QApplication::translate("SignalSettingsWidgetClass", "\346\227\266\351\222\237\351\242\221\347\216\207", 0, QApplication::UnicodeUTF8));
        labl_15->setText(QApplication::translate("SignalSettingsWidgetClass", "\344\277\241\345\217\267\351\242\221\347\216\207", 0, QApplication::UnicodeUTF8));
        labl_17->setText(QApplication::translate("SignalSettingsWidgetClass", "\344\277\241\345\217\267\345\274\272\345\272\246", 0, QApplication::UnicodeUTF8));
        labl_18->setText(QApplication::translate("SignalSettingsWidgetClass", "dBm", 0, QApplication::UnicodeUTF8));
        labl_25->setText(QApplication::translate("SignalSettingsWidgetClass", "MHz", 0, QApplication::UnicodeUTF8));
        labl_26->setText(QApplication::translate("SignalSettingsWidgetClass", "Hz", 0, QApplication::UnicodeUTF8));
        pushButtonChangeSettings->setText(QApplication::translate("SignalSettingsWidgetClass", "\346\227\266\351\222\237\344\277\241\345\217\267\350\256\276\347\275\256", 0, QApplication::UnicodeUTF8));
        Q_UNUSED(SignalSettingsWidgetClass);
    } // retranslateUi

};

namespace Ui {
    class SignalSettingsWidgetClass: public Ui_SignalSettingsWidgetClass {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_SIGNALSETTINGSWIDGET_H

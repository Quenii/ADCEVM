/********************************************************************************
** Form generated from reading ui file 'SignalSettingsDialog.ui'
**
** Created: Tue Feb 15 21:09:45 2011
**      by: Qt User Interface Compiler version 4.5.3
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
********************************************************************************/

#ifndef UI_SIGNALSETTINGSDIALOG_H
#define UI_SIGNALSETTINGSDIALOG_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QDialog>
#include <QtGui/QDialogButtonBox>
#include <QtGui/QGridLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QLineEdit>

QT_BEGIN_NAMESPACE

class Ui_SignalSettingsDialogClass
{
public:
    QGridLayout *gridLayout_2;
    QGridLayout *gridLayout;
    QLabel *labl_14;
    QLineEdit *clockFreqMHzLineEdit;
    QLabel *labl_25;
    QLabel *labl_15;
    QLineEdit *signalFreqLineEdit;
    QLabel *labl_26;
    QLabel *labl_17;
    QLineEdit *signalPowerLineEdit;
    QLabel *labl_18;
    QDialogButtonBox *buttonBox;

    void setupUi(QDialog *SignalSettingsDialogClass)
    {
        if (SignalSettingsDialogClass->objectName().isEmpty())
            SignalSettingsDialogClass->setObjectName(QString::fromUtf8("SignalSettingsDialogClass"));
        SignalSettingsDialogClass->resize(282, 121);
        gridLayout_2 = new QGridLayout(SignalSettingsDialogClass);
        gridLayout_2->setObjectName(QString::fromUtf8("gridLayout_2"));
        gridLayout = new QGridLayout();
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        labl_14 = new QLabel(SignalSettingsDialogClass);
        labl_14->setObjectName(QString::fromUtf8("labl_14"));
        labl_14->setMinimumSize(QSize(75, 0));
        labl_14->setMaximumSize(QSize(75, 16777215));
        QFont font;
        font.setFamily(QString::fromUtf8("Arial"));
        font.setPointSize(10);
        labl_14->setFont(font);
        labl_14->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout->addWidget(labl_14, 0, 0, 1, 1);

        clockFreqMHzLineEdit = new QLineEdit(SignalSettingsDialogClass);
        clockFreqMHzLineEdit->setObjectName(QString::fromUtf8("clockFreqMHzLineEdit"));
        QSizePolicy sizePolicy(QSizePolicy::Preferred, QSizePolicy::Fixed);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(clockFreqMHzLineEdit->sizePolicy().hasHeightForWidth());
        clockFreqMHzLineEdit->setSizePolicy(sizePolicy);

        gridLayout->addWidget(clockFreqMHzLineEdit, 0, 1, 1, 1);

        labl_25 = new QLabel(SignalSettingsDialogClass);
        labl_25->setObjectName(QString::fromUtf8("labl_25"));
        QSizePolicy sizePolicy1(QSizePolicy::Minimum, QSizePolicy::Preferred);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(labl_25->sizePolicy().hasHeightForWidth());
        labl_25->setSizePolicy(sizePolicy1);
        labl_25->setFont(font);

        gridLayout->addWidget(labl_25, 0, 2, 1, 1);

        labl_15 = new QLabel(SignalSettingsDialogClass);
        labl_15->setObjectName(QString::fromUtf8("labl_15"));
        labl_15->setFont(font);
        labl_15->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout->addWidget(labl_15, 1, 0, 1, 1);

        signalFreqLineEdit = new QLineEdit(SignalSettingsDialogClass);
        signalFreqLineEdit->setObjectName(QString::fromUtf8("signalFreqLineEdit"));
        sizePolicy.setHeightForWidth(signalFreqLineEdit->sizePolicy().hasHeightForWidth());
        signalFreqLineEdit->setSizePolicy(sizePolicy);

        gridLayout->addWidget(signalFreqLineEdit, 1, 1, 1, 1);

        labl_26 = new QLabel(SignalSettingsDialogClass);
        labl_26->setObjectName(QString::fromUtf8("labl_26"));
        sizePolicy1.setHeightForWidth(labl_26->sizePolicy().hasHeightForWidth());
        labl_26->setSizePolicy(sizePolicy1);
        labl_26->setFont(font);

        gridLayout->addWidget(labl_26, 1, 2, 1, 1);

        labl_17 = new QLabel(SignalSettingsDialogClass);
        labl_17->setObjectName(QString::fromUtf8("labl_17"));
        labl_17->setFont(font);
        labl_17->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout->addWidget(labl_17, 2, 0, 1, 1);

        signalPowerLineEdit = new QLineEdit(SignalSettingsDialogClass);
        signalPowerLineEdit->setObjectName(QString::fromUtf8("signalPowerLineEdit"));
        sizePolicy.setHeightForWidth(signalPowerLineEdit->sizePolicy().hasHeightForWidth());
        signalPowerLineEdit->setSizePolicy(sizePolicy);

        gridLayout->addWidget(signalPowerLineEdit, 2, 1, 1, 1);

        labl_18 = new QLabel(SignalSettingsDialogClass);
        labl_18->setObjectName(QString::fromUtf8("labl_18"));
        sizePolicy1.setHeightForWidth(labl_18->sizePolicy().hasHeightForWidth());
        labl_18->setSizePolicy(sizePolicy1);
        labl_18->setFont(font);

        gridLayout->addWidget(labl_18, 2, 2, 1, 1);


        gridLayout_2->addLayout(gridLayout, 0, 0, 1, 1);

        buttonBox = new QDialogButtonBox(SignalSettingsDialogClass);
        buttonBox->setObjectName(QString::fromUtf8("buttonBox"));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);

        gridLayout_2->addWidget(buttonBox, 1, 0, 1, 1);


        retranslateUi(SignalSettingsDialogClass);
        QObject::connect(buttonBox, SIGNAL(accepted()), SignalSettingsDialogClass, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), SignalSettingsDialogClass, SLOT(reject()));

        QMetaObject::connectSlotsByName(SignalSettingsDialogClass);
    } // setupUi

    void retranslateUi(QDialog *SignalSettingsDialogClass)
    {
        SignalSettingsDialogClass->setWindowTitle(QApplication::translate("SignalSettingsDialogClass", "\346\227\266\351\222\237\344\277\241\345\217\267\350\256\276\347\275\256", 0, QApplication::UnicodeUTF8));
        labl_14->setText(QApplication::translate("SignalSettingsDialogClass", "\346\227\266\351\222\237\351\242\221\347\216\207", 0, QApplication::UnicodeUTF8));
        labl_25->setText(QApplication::translate("SignalSettingsDialogClass", "MHz", 0, QApplication::UnicodeUTF8));
        labl_15->setText(QApplication::translate("SignalSettingsDialogClass", "\344\277\241\345\217\267\351\242\221\347\216\207", 0, QApplication::UnicodeUTF8));
        labl_26->setText(QApplication::translate("SignalSettingsDialogClass", "Hz", 0, QApplication::UnicodeUTF8));
        labl_17->setText(QApplication::translate("SignalSettingsDialogClass", "\344\277\241\345\217\267\345\274\272\345\272\246", 0, QApplication::UnicodeUTF8));
        labl_18->setText(QApplication::translate("SignalSettingsDialogClass", "dBm", 0, QApplication::UnicodeUTF8));
        Q_UNUSED(SignalSettingsDialogClass);
    } // retranslateUi

};

namespace Ui {
    class SignalSettingsDialogClass: public Ui_SignalSettingsDialogClass {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_SIGNALSETTINGSDIALOG_H

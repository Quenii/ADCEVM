/********************************************************************************
** Form generated from reading ui file 'AdcSettingsDialog.ui'
**
** Created: Sat Feb 19 10:25:26 2011
**      by: Qt User Interface Compiler version 4.5.3
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
********************************************************************************/

#ifndef UI_ADCSETTINGSDIALOG_H
#define UI_ADCSETTINGSDIALOG_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QComboBox>
#include <QtGui/QDialog>
#include <QtGui/QDialogButtonBox>
#include <QtGui/QDoubleSpinBox>
#include <QtGui/QGridLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QLineEdit>
#include <QtGui/QSpinBox>

QT_BEGIN_NAMESPACE

class Ui_AdcSettingsDialogClass
{
public:
    QGridLayout *gridLayout_2;
    QGridLayout *gridLayout;
    QLabel *labl_3;
    QLineEdit *adcTypeLineEdit;
    QLabel *labl_4;
    QDoubleSpinBox *vaDoubleSpinBox;
    QLabel *labl_10;
    QLabel *labl_5;
    QDoubleSpinBox *vdDoubleSpinBox;
    QLabel *labl_11;
    QLabel *labl_6;
    QSpinBox *bitCountSpinBox;
    QLabel *labl_12;
    QLabel *labl_7;
    QLineEdit *vppLineEdit;
    QLabel *labl_13;
    QLabel *labl_8;
    QLabel *labl_9;
    QLineEdit *phaseLineEdit;
    QComboBox *codingComboBox;
    QDialogButtonBox *buttonBox;

    void setupUi(QDialog *AdcSettingsDialogClass)
    {
        if (AdcSettingsDialogClass->objectName().isEmpty())
            AdcSettingsDialogClass->setObjectName(QString::fromUtf8("AdcSettingsDialogClass"));
        AdcSettingsDialogClass->resize(281, 227);
        gridLayout_2 = new QGridLayout(AdcSettingsDialogClass);
        gridLayout_2->setSpacing(6);
        gridLayout_2->setMargin(11);
        gridLayout_2->setObjectName(QString::fromUtf8("gridLayout_2"));
        gridLayout = new QGridLayout();
        gridLayout->setSpacing(6);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        labl_3 = new QLabel(AdcSettingsDialogClass);
        labl_3->setObjectName(QString::fromUtf8("labl_3"));
        QFont font;
        font.setFamily(QString::fromUtf8("Arial"));
        font.setPointSize(10);
        labl_3->setFont(font);
        labl_3->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout->addWidget(labl_3, 0, 0, 1, 1);

        adcTypeLineEdit = new QLineEdit(AdcSettingsDialogClass);
        adcTypeLineEdit->setObjectName(QString::fromUtf8("adcTypeLineEdit"));
        QSizePolicy sizePolicy(QSizePolicy::Preferred, QSizePolicy::Fixed);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(adcTypeLineEdit->sizePolicy().hasHeightForWidth());
        adcTypeLineEdit->setSizePolicy(sizePolicy);

        gridLayout->addWidget(adcTypeLineEdit, 0, 1, 1, 1);

        labl_4 = new QLabel(AdcSettingsDialogClass);
        labl_4->setObjectName(QString::fromUtf8("labl_4"));
        labl_4->setFont(font);
        labl_4->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout->addWidget(labl_4, 1, 0, 1, 1);

        vaDoubleSpinBox = new QDoubleSpinBox(AdcSettingsDialogClass);
        vaDoubleSpinBox->setObjectName(QString::fromUtf8("vaDoubleSpinBox"));
        sizePolicy.setHeightForWidth(vaDoubleSpinBox->sizePolicy().hasHeightForWidth());
        vaDoubleSpinBox->setSizePolicy(sizePolicy);

        gridLayout->addWidget(vaDoubleSpinBox, 1, 1, 1, 1);

        labl_10 = new QLabel(AdcSettingsDialogClass);
        labl_10->setObjectName(QString::fromUtf8("labl_10"));
        labl_10->setMinimumSize(QSize(20, 0));
        labl_10->setMaximumSize(QSize(20, 16777215));
        labl_10->setFont(font);

        gridLayout->addWidget(labl_10, 1, 2, 1, 1);

        labl_5 = new QLabel(AdcSettingsDialogClass);
        labl_5->setObjectName(QString::fromUtf8("labl_5"));
        labl_5->setFont(font);
        labl_5->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout->addWidget(labl_5, 2, 0, 1, 1);

        vdDoubleSpinBox = new QDoubleSpinBox(AdcSettingsDialogClass);
        vdDoubleSpinBox->setObjectName(QString::fromUtf8("vdDoubleSpinBox"));
        sizePolicy.setHeightForWidth(vdDoubleSpinBox->sizePolicy().hasHeightForWidth());
        vdDoubleSpinBox->setSizePolicy(sizePolicy);

        gridLayout->addWidget(vdDoubleSpinBox, 2, 1, 1, 1);

        labl_11 = new QLabel(AdcSettingsDialogClass);
        labl_11->setObjectName(QString::fromUtf8("labl_11"));
        labl_11->setFont(font);

        gridLayout->addWidget(labl_11, 2, 2, 1, 1);

        labl_6 = new QLabel(AdcSettingsDialogClass);
        labl_6->setObjectName(QString::fromUtf8("labl_6"));
        labl_6->setFont(font);
        labl_6->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout->addWidget(labl_6, 3, 0, 1, 1);

        bitCountSpinBox = new QSpinBox(AdcSettingsDialogClass);
        bitCountSpinBox->setObjectName(QString::fromUtf8("bitCountSpinBox"));
        sizePolicy.setHeightForWidth(bitCountSpinBox->sizePolicy().hasHeightForWidth());
        bitCountSpinBox->setSizePolicy(sizePolicy);

        gridLayout->addWidget(bitCountSpinBox, 3, 1, 1, 1);

        labl_12 = new QLabel(AdcSettingsDialogClass);
        labl_12->setObjectName(QString::fromUtf8("labl_12"));
        labl_12->setFont(font);

        gridLayout->addWidget(labl_12, 3, 2, 1, 1);

        labl_7 = new QLabel(AdcSettingsDialogClass);
        labl_7->setObjectName(QString::fromUtf8("labl_7"));
        labl_7->setFont(font);
        labl_7->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout->addWidget(labl_7, 4, 0, 1, 1);

        vppLineEdit = new QLineEdit(AdcSettingsDialogClass);
        vppLineEdit->setObjectName(QString::fromUtf8("vppLineEdit"));
        sizePolicy.setHeightForWidth(vppLineEdit->sizePolicy().hasHeightForWidth());
        vppLineEdit->setSizePolicy(sizePolicy);

        gridLayout->addWidget(vppLineEdit, 4, 1, 1, 1);

        labl_13 = new QLabel(AdcSettingsDialogClass);
        labl_13->setObjectName(QString::fromUtf8("labl_13"));
        labl_13->setFont(font);

        gridLayout->addWidget(labl_13, 4, 2, 1, 1);

        labl_8 = new QLabel(AdcSettingsDialogClass);
        labl_8->setObjectName(QString::fromUtf8("labl_8"));
        labl_8->setFont(font);
        labl_8->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout->addWidget(labl_8, 5, 0, 1, 1);

        labl_9 = new QLabel(AdcSettingsDialogClass);
        labl_9->setObjectName(QString::fromUtf8("labl_9"));
        labl_9->setMinimumSize(QSize(75, 0));
        labl_9->setMaximumSize(QSize(75, 16777215));
        labl_9->setFont(font);
        labl_9->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout->addWidget(labl_9, 6, 0, 1, 1);

        phaseLineEdit = new QLineEdit(AdcSettingsDialogClass);
        phaseLineEdit->setObjectName(QString::fromUtf8("phaseLineEdit"));
        sizePolicy.setHeightForWidth(phaseLineEdit->sizePolicy().hasHeightForWidth());
        phaseLineEdit->setSizePolicy(sizePolicy);

        gridLayout->addWidget(phaseLineEdit, 6, 1, 1, 1);

        codingComboBox = new QComboBox(AdcSettingsDialogClass);
        codingComboBox->setObjectName(QString::fromUtf8("codingComboBox"));

        gridLayout->addWidget(codingComboBox, 5, 1, 1, 1);


        gridLayout_2->addLayout(gridLayout, 0, 0, 1, 1);

        buttonBox = new QDialogButtonBox(AdcSettingsDialogClass);
        buttonBox->setObjectName(QString::fromUtf8("buttonBox"));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);

        gridLayout_2->addWidget(buttonBox, 1, 0, 1, 1);


        retranslateUi(AdcSettingsDialogClass);
        QObject::connect(buttonBox, SIGNAL(accepted()), AdcSettingsDialogClass, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), AdcSettingsDialogClass, SLOT(reject()));

        QMetaObject::connectSlotsByName(AdcSettingsDialogClass);
    } // setupUi

    void retranslateUi(QDialog *AdcSettingsDialogClass)
    {
        AdcSettingsDialogClass->setWindowTitle(QApplication::translate("AdcSettingsDialogClass", "ADC\350\256\276\347\275\256", 0, QApplication::UnicodeUTF8));
        labl_3->setText(QApplication::translate("AdcSettingsDialogClass", "ADC\345\236\213\345\217\267", 0, QApplication::UnicodeUTF8));
        labl_4->setText(QApplication::translate("AdcSettingsDialogClass", "V<sub>A</sub>(\350\256\276\347\275\256)", 0, QApplication::UnicodeUTF8));
        labl_10->setText(QApplication::translate("AdcSettingsDialogClass", "V", 0, QApplication::UnicodeUTF8));
        labl_5->setText(QApplication::translate("AdcSettingsDialogClass", "V<sub>D</sub>(\350\256\276\347\275\256)", 0, QApplication::UnicodeUTF8));
        labl_11->setText(QApplication::translate("AdcSettingsDialogClass", "V", 0, QApplication::UnicodeUTF8));
        labl_6->setText(QApplication::translate("AdcSettingsDialogClass", "\344\275\215      \346\225\260", 0, QApplication::UnicodeUTF8));
        labl_12->setText(QApplication::translate("AdcSettingsDialogClass", "bit", 0, QApplication::UnicodeUTF8));
        labl_7->setText(QApplication::translate("AdcSettingsDialogClass", "\346\273\241\345\271\205\350\214\203\345\233\264", 0, QApplication::UnicodeUTF8));
        labl_13->setText(QApplication::translate("AdcSettingsDialogClass", "V<sub>pp</sub>", 0, QApplication::UnicodeUTF8));
        labl_8->setText(QApplication::translate("AdcSettingsDialogClass", "\347\274\226\347\240\201\346\226\271\345\274\217", 0, QApplication::UnicodeUTF8));
        labl_9->setText(QApplication::translate("AdcSettingsDialogClass", "\347\233\270\344\275\215\350\256\276\347\275\256", 0, QApplication::UnicodeUTF8));
        Q_UNUSED(AdcSettingsDialogClass);
    } // retranslateUi

};

namespace Ui {
    class AdcSettingsDialogClass: public Ui_AdcSettingsDialogClass {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_ADCSETTINGSDIALOG_H

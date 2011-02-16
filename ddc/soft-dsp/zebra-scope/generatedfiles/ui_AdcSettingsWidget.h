/********************************************************************************
** Form generated from reading ui file 'AdcSettingsWidget.ui'
**
** Created: Tue Feb 15 21:09:46 2011
**      by: Qt User Interface Compiler version 4.5.3
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
********************************************************************************/

#ifndef UI_ADCSETTINGSWIDGET_H
#define UI_ADCSETTINGSWIDGET_H

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

class Ui_AdcSettingsWidgetClass
{
public:
    QGridLayout *gridLayout_3;
    QGroupBox *groupBox;
    QGridLayout *gridLayout_2;
    QSpacerItem *horizontalSpacer;
    QPushButton *pushButtonChangeSettings;
    QSpacerItem *horizontalSpacer_2;
    QGridLayout *gridLayout;
    QLabel *labl_3;
    QLineEdit *adcTypeLineEdit;
    QLabel *labl_4;
    QLabel *labl_10;
    QLabel *labl_5;
    QLabel *labl_11;
    QLabel *labl_6;
    QLabel *labl_12;
    QLabel *labl_7;
    QLineEdit *vppLineEdit;
    QLabel *labl_13;
    QLabel *labl_8;
    QLabel *labl_9;
    QLineEdit *phaseLineEdit;
    QLineEdit *vaDoubleLineEdit;
    QLineEdit *vdDoubleLineEdit;
    QLineEdit *bitCountLineEdit;
    QLineEdit *codingLineEdit;

    void setupUi(QWidget *AdcSettingsWidgetClass)
    {
        if (AdcSettingsWidgetClass->objectName().isEmpty())
            AdcSettingsWidgetClass->setObjectName(QString::fromUtf8("AdcSettingsWidgetClass"));
        AdcSettingsWidgetClass->resize(303, 227);
        gridLayout_3 = new QGridLayout(AdcSettingsWidgetClass);
        gridLayout_3->setSpacing(6);
        gridLayout_3->setMargin(0);
        gridLayout_3->setObjectName(QString::fromUtf8("gridLayout_3"));
        groupBox = new QGroupBox(AdcSettingsWidgetClass);
        groupBox->setObjectName(QString::fromUtf8("groupBox"));
        groupBox->setMaximumSize(QSize(16777215, 227));
        groupBox->setAlignment(Qt::AlignCenter);
        gridLayout_2 = new QGridLayout(groupBox);
        gridLayout_2->setSpacing(6);
        gridLayout_2->setMargin(11);
        gridLayout_2->setObjectName(QString::fromUtf8("gridLayout_2"));
        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        gridLayout_2->addItem(horizontalSpacer, 0, 0, 1, 1);

        pushButtonChangeSettings = new QPushButton(groupBox);
        pushButtonChangeSettings->setObjectName(QString::fromUtf8("pushButtonChangeSettings"));

        gridLayout_2->addWidget(pushButtonChangeSettings, 0, 1, 1, 1);

        horizontalSpacer_2 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        gridLayout_2->addItem(horizontalSpacer_2, 0, 2, 1, 1);

        gridLayout = new QGridLayout();
        gridLayout->setSpacing(6);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        labl_3 = new QLabel(groupBox);
        labl_3->setObjectName(QString::fromUtf8("labl_3"));
        QFont font;
        font.setFamily(QString::fromUtf8("Arial"));
        font.setPointSize(10);
        labl_3->setFont(font);
        labl_3->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout->addWidget(labl_3, 0, 0, 1, 1);

        adcTypeLineEdit = new QLineEdit(groupBox);
        adcTypeLineEdit->setObjectName(QString::fromUtf8("adcTypeLineEdit"));
        QSizePolicy sizePolicy(QSizePolicy::Preferred, QSizePolicy::Fixed);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(adcTypeLineEdit->sizePolicy().hasHeightForWidth());
        adcTypeLineEdit->setSizePolicy(sizePolicy);
        adcTypeLineEdit->setReadOnly(true);

        gridLayout->addWidget(adcTypeLineEdit, 0, 1, 1, 1);

        labl_4 = new QLabel(groupBox);
        labl_4->setObjectName(QString::fromUtf8("labl_4"));
        labl_4->setFont(font);
        labl_4->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout->addWidget(labl_4, 1, 0, 1, 1);

        labl_10 = new QLabel(groupBox);
        labl_10->setObjectName(QString::fromUtf8("labl_10"));
        labl_10->setMinimumSize(QSize(20, 0));
        labl_10->setMaximumSize(QSize(20, 16777215));
        labl_10->setFont(font);

        gridLayout->addWidget(labl_10, 1, 2, 1, 1);

        labl_5 = new QLabel(groupBox);
        labl_5->setObjectName(QString::fromUtf8("labl_5"));
        labl_5->setFont(font);
        labl_5->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout->addWidget(labl_5, 2, 0, 1, 1);

        labl_11 = new QLabel(groupBox);
        labl_11->setObjectName(QString::fromUtf8("labl_11"));
        labl_11->setFont(font);

        gridLayout->addWidget(labl_11, 2, 2, 1, 1);

        labl_6 = new QLabel(groupBox);
        labl_6->setObjectName(QString::fromUtf8("labl_6"));
        labl_6->setFont(font);
        labl_6->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout->addWidget(labl_6, 3, 0, 1, 1);

        labl_12 = new QLabel(groupBox);
        labl_12->setObjectName(QString::fromUtf8("labl_12"));
        labl_12->setFont(font);

        gridLayout->addWidget(labl_12, 3, 2, 1, 1);

        labl_7 = new QLabel(groupBox);
        labl_7->setObjectName(QString::fromUtf8("labl_7"));
        labl_7->setFont(font);
        labl_7->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout->addWidget(labl_7, 4, 0, 1, 1);

        vppLineEdit = new QLineEdit(groupBox);
        vppLineEdit->setObjectName(QString::fromUtf8("vppLineEdit"));
        sizePolicy.setHeightForWidth(vppLineEdit->sizePolicy().hasHeightForWidth());
        vppLineEdit->setSizePolicy(sizePolicy);
        vppLineEdit->setReadOnly(true);

        gridLayout->addWidget(vppLineEdit, 4, 1, 1, 1);

        labl_13 = new QLabel(groupBox);
        labl_13->setObjectName(QString::fromUtf8("labl_13"));
        labl_13->setFont(font);

        gridLayout->addWidget(labl_13, 4, 2, 1, 1);

        labl_8 = new QLabel(groupBox);
        labl_8->setObjectName(QString::fromUtf8("labl_8"));
        labl_8->setFont(font);
        labl_8->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout->addWidget(labl_8, 5, 0, 1, 1);

        labl_9 = new QLabel(groupBox);
        labl_9->setObjectName(QString::fromUtf8("labl_9"));
        labl_9->setMinimumSize(QSize(75, 0));
        labl_9->setMaximumSize(QSize(75, 16777215));
        labl_9->setFont(font);
        labl_9->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout->addWidget(labl_9, 6, 0, 1, 1);

        phaseLineEdit = new QLineEdit(groupBox);
        phaseLineEdit->setObjectName(QString::fromUtf8("phaseLineEdit"));
        sizePolicy.setHeightForWidth(phaseLineEdit->sizePolicy().hasHeightForWidth());
        phaseLineEdit->setSizePolicy(sizePolicy);
        phaseLineEdit->setReadOnly(true);

        gridLayout->addWidget(phaseLineEdit, 6, 1, 1, 1);

        vaDoubleLineEdit = new QLineEdit(groupBox);
        vaDoubleLineEdit->setObjectName(QString::fromUtf8("vaDoubleLineEdit"));
        sizePolicy.setHeightForWidth(vaDoubleLineEdit->sizePolicy().hasHeightForWidth());
        vaDoubleLineEdit->setSizePolicy(sizePolicy);
        vaDoubleLineEdit->setReadOnly(true);

        gridLayout->addWidget(vaDoubleLineEdit, 1, 1, 1, 1);

        vdDoubleLineEdit = new QLineEdit(groupBox);
        vdDoubleLineEdit->setObjectName(QString::fromUtf8("vdDoubleLineEdit"));
        sizePolicy.setHeightForWidth(vdDoubleLineEdit->sizePolicy().hasHeightForWidth());
        vdDoubleLineEdit->setSizePolicy(sizePolicy);
        vdDoubleLineEdit->setReadOnly(true);

        gridLayout->addWidget(vdDoubleLineEdit, 2, 1, 1, 1);

        bitCountLineEdit = new QLineEdit(groupBox);
        bitCountLineEdit->setObjectName(QString::fromUtf8("bitCountLineEdit"));
        sizePolicy.setHeightForWidth(bitCountLineEdit->sizePolicy().hasHeightForWidth());
        bitCountLineEdit->setSizePolicy(sizePolicy);
        bitCountLineEdit->setReadOnly(true);

        gridLayout->addWidget(bitCountLineEdit, 3, 1, 1, 1);

        codingLineEdit = new QLineEdit(groupBox);
        codingLineEdit->setObjectName(QString::fromUtf8("codingLineEdit"));
        sizePolicy.setHeightForWidth(codingLineEdit->sizePolicy().hasHeightForWidth());
        codingLineEdit->setSizePolicy(sizePolicy);
        codingLineEdit->setReadOnly(true);

        gridLayout->addWidget(codingLineEdit, 5, 1, 1, 1);


        gridLayout_2->addLayout(gridLayout, 1, 0, 1, 3);


        gridLayout_3->addWidget(groupBox, 0, 0, 1, 1);


        retranslateUi(AdcSettingsWidgetClass);

        QMetaObject::connectSlotsByName(AdcSettingsWidgetClass);
    } // setupUi

    void retranslateUi(QWidget *AdcSettingsWidgetClass)
    {
        AdcSettingsWidgetClass->setWindowTitle(QApplication::translate("AdcSettingsWidgetClass", "ADC\350\256\276\347\275\256", 0, QApplication::UnicodeUTF8));
        groupBox->setTitle(QString());
        pushButtonChangeSettings->setText(QApplication::translate("AdcSettingsWidgetClass", "ADC\350\256\276\347\275\256", 0, QApplication::UnicodeUTF8));
        labl_3->setText(QApplication::translate("AdcSettingsWidgetClass", "ADC\345\236\213\345\217\267", 0, QApplication::UnicodeUTF8));
        labl_4->setText(QApplication::translate("AdcSettingsWidgetClass", "V<sub>A</sub>(\350\256\276\347\275\256)", 0, QApplication::UnicodeUTF8));
        labl_10->setText(QApplication::translate("AdcSettingsWidgetClass", "V", 0, QApplication::UnicodeUTF8));
        labl_5->setText(QApplication::translate("AdcSettingsWidgetClass", "V<sub>D</sub>(\350\256\276\347\275\256)", 0, QApplication::UnicodeUTF8));
        labl_11->setText(QApplication::translate("AdcSettingsWidgetClass", "V", 0, QApplication::UnicodeUTF8));
        labl_6->setText(QApplication::translate("AdcSettingsWidgetClass", "\344\275\215      \346\225\260", 0, QApplication::UnicodeUTF8));
        labl_12->setText(QApplication::translate("AdcSettingsWidgetClass", "bit", 0, QApplication::UnicodeUTF8));
        labl_7->setText(QApplication::translate("AdcSettingsWidgetClass", "\346\273\241\345\271\205\350\214\203\345\233\264", 0, QApplication::UnicodeUTF8));
        labl_13->setText(QApplication::translate("AdcSettingsWidgetClass", "V<sub>pp</sub>", 0, QApplication::UnicodeUTF8));
        labl_8->setText(QApplication::translate("AdcSettingsWidgetClass", "\347\274\226\347\240\201\346\226\271\345\274\217", 0, QApplication::UnicodeUTF8));
        labl_9->setText(QApplication::translate("AdcSettingsWidgetClass", "\347\233\270\344\275\215\350\256\276\347\275\256", 0, QApplication::UnicodeUTF8));
        Q_UNUSED(AdcSettingsWidgetClass);
    } // retranslateUi

};

namespace Ui {
    class AdcSettingsWidgetClass: public Ui_AdcSettingsWidgetClass {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_ADCSETTINGSWIDGET_H

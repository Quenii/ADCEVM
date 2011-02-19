/********************************************************************************
** Form generated from reading ui file 'RegAccess.ui'
**
** Created: Sat Feb 19 10:25:26 2011
**      by: Qt User Interface Compiler version 4.5.3
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
********************************************************************************/

#ifndef UI_REGACCESS_H
#define UI_REGACCESS_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QComboBox>
#include <QtGui/QGridLayout>
#include <QtGui/QGroupBox>
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QPushButton>
#include <QtGui/QRadioButton>
#include <QtGui/QSpacerItem>
#include <QtGui/QSpinBox>
#include <QtGui/QWidget>

QT_BEGIN_NAMESPACE

class Ui_FormRegAccess
{
public:
    QHBoxLayout *horizontalLayout;
    QWidget *widget_3;
    QGridLayout *gridLayout_2;
    QPushButton *pushButtonResetCircuit;
    QPushButton *pushButtonOpenScan;
    QSpacerItem *horizontalSpacer;
    QSpacerItem *horizontalSpacer_2;
    QGroupBox *groupBox_2;
    QGridLayout *gridLayout_4;
    QLabel *label_3;
    QLabel *label_7;
    QLabel *label_9;
    QRadioButton *radioButton;
    QRadioButton *radioButton_2;
    QSpacerItem *verticalSpacer;
    QRadioButton *radioButton_5;
    QRadioButton *radioButton_6;
    QLabel *label_10;
    QLabel *label_11;
    QLabel *label_12;
    QLabel *label_13;
    QLabel *label_14;
    QLabel *label_15;
    QLabel *label_16;
    QLabel *label_17;
    QRadioButton *radioButton_8;
    QRadioButton *radioButton_9;
    QLabel *label_18;
    QRadioButton *radioButton_3;
    QRadioButton *radioButton_4;
    QRadioButton *radioButton_10;
    QRadioButton *radioButton_11;
    QLabel *label_19;
    QLabel *label_20;
    QLabel *label_21;
    QLabel *label_22;
    QRadioButton *radioButton_7;
    QRadioButton *radioButton_12;
    QGroupBox *groupBox;
    QGridLayout *gridLayout;
    QSpinBox *sbResetTime;
    QComboBox *cbSPIWidth;
    QLabel *label_4;
    QLabel *label;
    QLabel *label_2;
    QSpinBox *sbResetDelay;
    QLabel *label_5;
    QLabel *label_6;
    QLabel *label_8;
    QComboBox *cbResetLevel;
    QWidget *widget;
    QGridLayout *gridLayout_3;
    QPushButton *pushButtonSaveSettings;
    QPushButton *pushButtonReadSettings;
    QPushButton *pushButtonBack2Top;
    QPushButton *pushButtonStep;
    QPushButton *pushButtonAutoExec;
    QGroupBox *groupBoxRegAcessItems;
    QButtonGroup *buttonGroup;
    QButtonGroup *buttonGroup_2;
    QButtonGroup *buttonGroup_3;
    QButtonGroup *buttonGroup_4;

    void setupUi(QWidget *FormRegAccess)
    {
        if (FormRegAccess->objectName().isEmpty())
            FormRegAccess->setObjectName(QString::fromUtf8("FormRegAccess"));
        FormRegAccess->resize(674, 520);
        horizontalLayout = new QHBoxLayout(FormRegAccess);
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        widget_3 = new QWidget(FormRegAccess);
        widget_3->setObjectName(QString::fromUtf8("widget_3"));
        gridLayout_2 = new QGridLayout(widget_3);
        gridLayout_2->setObjectName(QString::fromUtf8("gridLayout_2"));
        pushButtonResetCircuit = new QPushButton(widget_3);
        pushButtonResetCircuit->setObjectName(QString::fromUtf8("pushButtonResetCircuit"));

        gridLayout_2->addWidget(pushButtonResetCircuit, 2, 1, 1, 1);

        pushButtonOpenScan = new QPushButton(widget_3);
        pushButtonOpenScan->setObjectName(QString::fromUtf8("pushButtonOpenScan"));

        gridLayout_2->addWidget(pushButtonOpenScan, 2, 2, 1, 1);

        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        gridLayout_2->addItem(horizontalSpacer, 2, 0, 1, 1);

        horizontalSpacer_2 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        gridLayout_2->addItem(horizontalSpacer_2, 2, 3, 1, 1);

        groupBox_2 = new QGroupBox(widget_3);
        groupBox_2->setObjectName(QString::fromUtf8("groupBox_2"));
        QFont font;
        font.setFamily(QString::fromUtf8("Arial"));
        font.setPointSize(10);
        groupBox_2->setFont(font);
        gridLayout_4 = new QGridLayout(groupBox_2);
        gridLayout_4->setObjectName(QString::fromUtf8("gridLayout_4"));
        label_3 = new QLabel(groupBox_2);
        label_3->setObjectName(QString::fromUtf8("label_3"));

        gridLayout_4->addWidget(label_3, 0, 0, 1, 1);

        label_7 = new QLabel(groupBox_2);
        label_7->setObjectName(QString::fromUtf8("label_7"));

        gridLayout_4->addWidget(label_7, 0, 1, 1, 3);

        label_9 = new QLabel(groupBox_2);
        label_9->setObjectName(QString::fromUtf8("label_9"));

        gridLayout_4->addWidget(label_9, 1, 0, 1, 1);

        radioButton = new QRadioButton(groupBox_2);
        buttonGroup = new QButtonGroup(FormRegAccess);
        buttonGroup->setObjectName(QString::fromUtf8("buttonGroup"));
        buttonGroup->addButton(radioButton);
        radioButton->setObjectName(QString::fromUtf8("radioButton"));

        gridLayout_4->addWidget(radioButton, 1, 1, 1, 1);

        radioButton_2 = new QRadioButton(groupBox_2);
        buttonGroup->addButton(radioButton_2);
        radioButton_2->setObjectName(QString::fromUtf8("radioButton_2"));

        gridLayout_4->addWidget(radioButton_2, 1, 2, 1, 1);

        verticalSpacer = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        gridLayout_4->addItem(verticalSpacer, 11, 0, 1, 1);

        radioButton_5 = new QRadioButton(groupBox_2);
        buttonGroup_2 = new QButtonGroup(FormRegAccess);
        buttonGroup_2->setObjectName(QString::fromUtf8("buttonGroup_2"));
        buttonGroup_2->addButton(radioButton_5);
        radioButton_5->setObjectName(QString::fromUtf8("radioButton_5"));

        gridLayout_4->addWidget(radioButton_5, 2, 1, 1, 1);

        radioButton_6 = new QRadioButton(groupBox_2);
        buttonGroup_2->addButton(radioButton_6);
        radioButton_6->setObjectName(QString::fromUtf8("radioButton_6"));

        gridLayout_4->addWidget(radioButton_6, 2, 2, 1, 1);

        label_10 = new QLabel(groupBox_2);
        label_10->setObjectName(QString::fromUtf8("label_10"));

        gridLayout_4->addWidget(label_10, 2, 0, 1, 1);

        label_11 = new QLabel(groupBox_2);
        label_11->setObjectName(QString::fromUtf8("label_11"));

        gridLayout_4->addWidget(label_11, 3, 0, 1, 1);

        label_12 = new QLabel(groupBox_2);
        label_12->setObjectName(QString::fromUtf8("label_12"));

        gridLayout_4->addWidget(label_12, 5, 0, 1, 1);

        label_13 = new QLabel(groupBox_2);
        label_13->setObjectName(QString::fromUtf8("label_13"));

        gridLayout_4->addWidget(label_13, 6, 0, 1, 1);

        label_14 = new QLabel(groupBox_2);
        label_14->setObjectName(QString::fromUtf8("label_14"));

        gridLayout_4->addWidget(label_14, 7, 0, 1, 1);

        label_15 = new QLabel(groupBox_2);
        label_15->setObjectName(QString::fromUtf8("label_15"));

        gridLayout_4->addWidget(label_15, 8, 0, 1, 1);

        label_16 = new QLabel(groupBox_2);
        label_16->setObjectName(QString::fromUtf8("label_16"));

        gridLayout_4->addWidget(label_16, 9, 0, 1, 1);

        label_17 = new QLabel(groupBox_2);
        label_17->setObjectName(QString::fromUtf8("label_17"));

        gridLayout_4->addWidget(label_17, 10, 0, 1, 1);

        radioButton_8 = new QRadioButton(groupBox_2);
        buttonGroup_3 = new QButtonGroup(FormRegAccess);
        buttonGroup_3->setObjectName(QString::fromUtf8("buttonGroup_3"));
        buttonGroup_3->addButton(radioButton_8);
        radioButton_8->setObjectName(QString::fromUtf8("radioButton_8"));

        gridLayout_4->addWidget(radioButton_8, 3, 2, 1, 1);

        radioButton_9 = new QRadioButton(groupBox_2);
        buttonGroup_3->addButton(radioButton_9);
        radioButton_9->setObjectName(QString::fromUtf8("radioButton_9"));

        gridLayout_4->addWidget(radioButton_9, 3, 1, 1, 1);

        label_18 = new QLabel(groupBox_2);
        label_18->setObjectName(QString::fromUtf8("label_18"));

        gridLayout_4->addWidget(label_18, 5, 1, 1, 3);

        radioButton_3 = new QRadioButton(groupBox_2);
        buttonGroup->addButton(radioButton_3);
        radioButton_3->setObjectName(QString::fromUtf8("radioButton_3"));
        radioButton_3->setChecked(true);

        gridLayout_4->addWidget(radioButton_3, 1, 3, 1, 1);

        radioButton_4 = new QRadioButton(groupBox_2);
        buttonGroup_2->addButton(radioButton_4);
        radioButton_4->setObjectName(QString::fromUtf8("radioButton_4"));
        radioButton_4->setChecked(true);

        gridLayout_4->addWidget(radioButton_4, 2, 3, 1, 1);

        radioButton_10 = new QRadioButton(groupBox_2);
        buttonGroup_4 = new QButtonGroup(FormRegAccess);
        buttonGroup_4->setObjectName(QString::fromUtf8("buttonGroup_4"));
        buttonGroup_4->addButton(radioButton_10);
        radioButton_10->setObjectName(QString::fromUtf8("radioButton_10"));

        gridLayout_4->addWidget(radioButton_10, 6, 1, 1, 1);

        radioButton_11 = new QRadioButton(groupBox_2);
        buttonGroup_4->addButton(radioButton_11);
        radioButton_11->setObjectName(QString::fromUtf8("radioButton_11"));

        gridLayout_4->addWidget(radioButton_11, 6, 2, 1, 1);

        label_19 = new QLabel(groupBox_2);
        label_19->setObjectName(QString::fromUtf8("label_19"));

        gridLayout_4->addWidget(label_19, 7, 1, 1, 3);

        label_20 = new QLabel(groupBox_2);
        label_20->setObjectName(QString::fromUtf8("label_20"));

        gridLayout_4->addWidget(label_20, 8, 1, 1, 3);

        label_21 = new QLabel(groupBox_2);
        label_21->setObjectName(QString::fromUtf8("label_21"));

        gridLayout_4->addWidget(label_21, 9, 1, 1, 3);

        label_22 = new QLabel(groupBox_2);
        label_22->setObjectName(QString::fromUtf8("label_22"));

        gridLayout_4->addWidget(label_22, 10, 1, 1, 3);

        radioButton_7 = new QRadioButton(groupBox_2);
        buttonGroup_3->addButton(radioButton_7);
        radioButton_7->setObjectName(QString::fromUtf8("radioButton_7"));
        radioButton_7->setChecked(true);

        gridLayout_4->addWidget(radioButton_7, 3, 3, 1, 1);

        radioButton_12 = new QRadioButton(groupBox_2);
        buttonGroup_4->addButton(radioButton_12);
        radioButton_12->setObjectName(QString::fromUtf8("radioButton_12"));
        radioButton_12->setChecked(true);

        gridLayout_4->addWidget(radioButton_12, 6, 3, 1, 1);


        gridLayout_2->addWidget(groupBox_2, 1, 0, 1, 4);

        groupBox = new QGroupBox(widget_3);
        groupBox->setObjectName(QString::fromUtf8("groupBox"));
        groupBox->setFont(font);
        gridLayout = new QGridLayout(groupBox);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        sbResetTime = new QSpinBox(groupBox);
        sbResetTime->setObjectName(QString::fromUtf8("sbResetTime"));
        sbResetTime->setMaximum(255);
        sbResetTime->setValue(3);

        gridLayout->addWidget(sbResetTime, 1, 1, 1, 1);

        cbSPIWidth = new QComboBox(groupBox);
        cbSPIWidth->setObjectName(QString::fromUtf8("cbSPIWidth"));

        gridLayout->addWidget(cbSPIWidth, 3, 1, 1, 1);

        label_4 = new QLabel(groupBox);
        label_4->setObjectName(QString::fromUtf8("label_4"));
        QSizePolicy sizePolicy(QSizePolicy::Minimum, QSizePolicy::Preferred);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(label_4->sizePolicy().hasHeightForWidth());
        label_4->setSizePolicy(sizePolicy);

        gridLayout->addWidget(label_4, 1, 2, 1, 1);

        label = new QLabel(groupBox);
        label->setObjectName(QString::fromUtf8("label"));

        gridLayout->addWidget(label, 0, 0, 1, 1);

        label_2 = new QLabel(groupBox);
        label_2->setObjectName(QString::fromUtf8("label_2"));

        gridLayout->addWidget(label_2, 1, 0, 1, 1);

        sbResetDelay = new QSpinBox(groupBox);
        sbResetDelay->setObjectName(QString::fromUtf8("sbResetDelay"));
        sbResetDelay->setMaximum(2000);
        sbResetDelay->setValue(600);

        gridLayout->addWidget(sbResetDelay, 2, 1, 1, 1);

        label_5 = new QLabel(groupBox);
        label_5->setObjectName(QString::fromUtf8("label_5"));
        sizePolicy.setHeightForWidth(label_5->sizePolicy().hasHeightForWidth());
        label_5->setSizePolicy(sizePolicy);

        gridLayout->addWidget(label_5, 2, 2, 1, 1);

        label_6 = new QLabel(groupBox);
        label_6->setObjectName(QString::fromUtf8("label_6"));

        gridLayout->addWidget(label_6, 2, 0, 1, 1);

        label_8 = new QLabel(groupBox);
        label_8->setObjectName(QString::fromUtf8("label_8"));

        gridLayout->addWidget(label_8, 3, 0, 1, 1);

        cbResetLevel = new QComboBox(groupBox);
        cbResetLevel->setObjectName(QString::fromUtf8("cbResetLevel"));

        gridLayout->addWidget(cbResetLevel, 0, 1, 1, 1);


        gridLayout_2->addWidget(groupBox, 0, 0, 1, 4);


        horizontalLayout->addWidget(widget_3);

        widget = new QWidget(FormRegAccess);
        widget->setObjectName(QString::fromUtf8("widget"));
        gridLayout_3 = new QGridLayout(widget);
        gridLayout_3->setObjectName(QString::fromUtf8("gridLayout_3"));
        pushButtonSaveSettings = new QPushButton(widget);
        pushButtonSaveSettings->setObjectName(QString::fromUtf8("pushButtonSaveSettings"));

        gridLayout_3->addWidget(pushButtonSaveSettings, 1, 0, 1, 1);

        pushButtonReadSettings = new QPushButton(widget);
        pushButtonReadSettings->setObjectName(QString::fromUtf8("pushButtonReadSettings"));

        gridLayout_3->addWidget(pushButtonReadSettings, 1, 1, 1, 1);

        pushButtonBack2Top = new QPushButton(widget);
        pushButtonBack2Top->setObjectName(QString::fromUtf8("pushButtonBack2Top"));

        gridLayout_3->addWidget(pushButtonBack2Top, 1, 2, 1, 1);

        pushButtonStep = new QPushButton(widget);
        pushButtonStep->setObjectName(QString::fromUtf8("pushButtonStep"));

        gridLayout_3->addWidget(pushButtonStep, 1, 3, 1, 1);

        pushButtonAutoExec = new QPushButton(widget);
        pushButtonAutoExec->setObjectName(QString::fromUtf8("pushButtonAutoExec"));

        gridLayout_3->addWidget(pushButtonAutoExec, 1, 4, 1, 1);

        groupBoxRegAcessItems = new QGroupBox(widget);
        groupBoxRegAcessItems->setObjectName(QString::fromUtf8("groupBoxRegAcessItems"));

        gridLayout_3->addWidget(groupBoxRegAcessItems, 0, 0, 1, 5);


        horizontalLayout->addWidget(widget);


        retranslateUi(FormRegAccess);

        QMetaObject::connectSlotsByName(FormRegAccess);
    } // setupUi

    void retranslateUi(QWidget *FormRegAccess)
    {
        FormRegAccess->setWindowTitle(QApplication::translate("FormRegAccess", "SPI\346\216\247\345\210\266", 0, QApplication::UnicodeUTF8));
        pushButtonResetCircuit->setText(QApplication::translate("FormRegAccess", "\345\244\215\344\275\215\347\224\265\350\267\257", 0, QApplication::UnicodeUTF8));
        pushButtonOpenScan->setText(QApplication::translate("FormRegAccess", "\346\211\223\345\274\200\346\211\253\346\217\217\351\223\276", 0, QApplication::UnicodeUTF8));
        groupBox_2->setTitle(QApplication::translate("FormRegAccess", "\345\274\225\350\204\232\350\257\264\346\230\216", 0, QApplication::UnicodeUTF8));
        label_3->setText(QApplication::translate("FormRegAccess", "GPIO0: ", 0, QApplication::UnicodeUTF8));
        label_7->setText(QApplication::translate("FormRegAccess", "RESET", 0, QApplication::UnicodeUTF8));
        label_9->setText(QApplication::translate("FormRegAccess", "GPIO1: ", 0, QApplication::UnicodeUTF8));
        radioButton->setText(QApplication::translate("FormRegAccess", "0", 0, QApplication::UnicodeUTF8));
        radioButton_2->setText(QApplication::translate("FormRegAccess", "1", 0, QApplication::UnicodeUTF8));
        radioButton_5->setText(QApplication::translate("FormRegAccess", "0", 0, QApplication::UnicodeUTF8));
        radioButton_6->setText(QApplication::translate("FormRegAccess", "1", 0, QApplication::UnicodeUTF8));
        label_10->setText(QApplication::translate("FormRegAccess", "GPIO2: ", 0, QApplication::UnicodeUTF8));
        label_11->setText(QApplication::translate("FormRegAccess", "GPIO3: ", 0, QApplication::UnicodeUTF8));
        label_12->setText(QApplication::translate("FormRegAccess", "GPIO4: ", 0, QApplication::UnicodeUTF8));
        label_13->setText(QApplication::translate("FormRegAccess", "GPIO5: ", 0, QApplication::UnicodeUTF8));
        label_14->setText(QApplication::translate("FormRegAccess", "GPIO6: ", 0, QApplication::UnicodeUTF8));
        label_15->setText(QApplication::translate("FormRegAccess", "GPIO7: ", 0, QApplication::UnicodeUTF8));
        label_16->setText(QApplication::translate("FormRegAccess", "GPIO8: ", 0, QApplication::UnicodeUTF8));
        label_17->setText(QApplication::translate("FormRegAccess", "GPIO9: ", 0, QApplication::UnicodeUTF8));
        radioButton_8->setText(QApplication::translate("FormRegAccess", "1", 0, QApplication::UnicodeUTF8));
        radioButton_9->setText(QApplication::translate("FormRegAccess", "0", 0, QApplication::UnicodeUTF8));
        label_18->setText(QApplication::translate("FormRegAccess", "CSB(SPI)", 0, QApplication::UnicodeUTF8));
        radioButton_3->setText(QApplication::translate("FormRegAccess", "Z", 0, QApplication::UnicodeUTF8));
        radioButton_4->setText(QApplication::translate("FormRegAccess", "Z", 0, QApplication::UnicodeUTF8));
        radioButton_10->setText(QApplication::translate("FormRegAccess", "0", 0, QApplication::UnicodeUTF8));
        radioButton_11->setText(QApplication::translate("FormRegAccess", "1", 0, QApplication::UnicodeUTF8));
        label_19->setText(QApplication::translate("FormRegAccess", "SCLK(SPI)", 0, QApplication::UnicodeUTF8));
        label_20->setText(QApplication::translate("FormRegAccess", "SDA(I2C)", 0, QApplication::UnicodeUTF8));
        label_21->setText(QApplication::translate("FormRegAccess", "SDIO(SPI)", 0, QApplication::UnicodeUTF8));
        label_22->setText(QApplication::translate("FormRegAccess", "TM(QFN72-18IN)", 0, QApplication::UnicodeUTF8));
        radioButton_7->setText(QApplication::translate("FormRegAccess", "Z", 0, QApplication::UnicodeUTF8));
        radioButton_12->setText(QApplication::translate("FormRegAccess", "Z", 0, QApplication::UnicodeUTF8));
        groupBox->setTitle(QApplication::translate("FormRegAccess", "\347\233\270\345\205\263\350\256\276\347\275\256", 0, QApplication::UnicodeUTF8));
        cbSPIWidth->clear();
        cbSPIWidth->insertItems(0, QStringList()
         << QApplication::translate("FormRegAccess", "8 bit", 0, QApplication::UnicodeUTF8)
         << QApplication::translate("FormRegAccess", "16 bit", 0, QApplication::UnicodeUTF8)
        );
        label_4->setText(QApplication::translate("FormRegAccess", "ms", 0, QApplication::UnicodeUTF8));
        label->setText(QApplication::translate("FormRegAccess", "\345\244\215\344\275\215\347\224\265\345\271\263", 0, QApplication::UnicodeUTF8));
        label_2->setText(QApplication::translate("FormRegAccess", "\345\244\215\344\275\215\346\227\266\351\227\264", 0, QApplication::UnicodeUTF8));
        label_5->setText(QApplication::translate("FormRegAccess", "ms", 0, QApplication::UnicodeUTF8));
        label_6->setText(QApplication::translate("FormRegAccess", "\345\244\215\344\275\215\345\220\216\344\277\235\346\214\201\346\227\266\351\227\264", 0, QApplication::UnicodeUTF8));
        label_8->setText(QApplication::translate("FormRegAccess", "SPI\345\234\260\345\235\200\344\275\215\345\256\275", 0, QApplication::UnicodeUTF8));
        cbResetLevel->clear();
        cbResetLevel->insertItems(0, QStringList()
         << QApplication::translate("FormRegAccess", "\351\253\230\347\224\265\345\271\263", 0, QApplication::UnicodeUTF8)
         << QApplication::translate("FormRegAccess", "\344\275\216\347\224\265\345\271\263", 0, QApplication::UnicodeUTF8)
        );
        pushButtonSaveSettings->setText(QApplication::translate("FormRegAccess", "\344\277\235\345\255\230\350\256\276\347\275\256", 0, QApplication::UnicodeUTF8));
        pushButtonReadSettings->setText(QApplication::translate("FormRegAccess", "\350\257\273\345\205\245\350\256\276\347\275\256", 0, QApplication::UnicodeUTF8));
        pushButtonBack2Top->setText(QApplication::translate("FormRegAccess", "\350\207\263\351\246\226\350\241\214", 0, QApplication::UnicodeUTF8));
        pushButtonStep->setText(QApplication::translate("FormRegAccess", "\345\215\225\346\255\245\346\211\247\350\241\214", 0, QApplication::UnicodeUTF8));
        pushButtonAutoExec->setText(QApplication::translate("FormRegAccess", "\350\207\252\345\212\250\346\211\247\350\241\214", 0, QApplication::UnicodeUTF8));
        groupBoxRegAcessItems->setTitle(QString());
        Q_UNUSED(FormRegAccess);
    } // retranslateUi

};

namespace Ui {
    class FormRegAccess: public Ui_FormRegAccess {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_REGACCESS_H

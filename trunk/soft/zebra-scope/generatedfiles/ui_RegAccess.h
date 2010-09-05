/********************************************************************************
** Form generated from reading UI file 'RegAccess.ui'
**
** Created: Sun Sep 5 10:12:26 2010
**      by: Qt User Interface Compiler version 4.6.3
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
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
    QLabel *label_9;
    QSpinBox *sbSampleRate;
    QLabel *label_7;
    QWidget *widget;
    QGridLayout *gridLayout_3;
    QPushButton *pushButton_3;
    QPushButton *pushButton_4;
    QPushButton *pushButton_5;
    QPushButton *pushButton_6;
    QPushButton *pushButtonAutoExec;
    QGroupBox *groupBoxRegAcessItems;

    void setupUi(QWidget *FormRegAccess)
    {
        if (FormRegAccess->objectName().isEmpty())
            FormRegAccess->setObjectName(QString::fromUtf8("FormRegAccess"));
        FormRegAccess->resize(666, 459);
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

        gridLayout->addWidget(cbSPIWidth, 4, 1, 1, 1);

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

        gridLayout->addWidget(label_8, 4, 0, 1, 1);

        cbResetLevel = new QComboBox(groupBox);
        cbResetLevel->setObjectName(QString::fromUtf8("cbResetLevel"));

        gridLayout->addWidget(cbResetLevel, 0, 1, 1, 1);

        label_9 = new QLabel(groupBox);
        label_9->setObjectName(QString::fromUtf8("label_9"));

        gridLayout->addWidget(label_9, 3, 0, 1, 1);

        sbSampleRate = new QSpinBox(groupBox);
        sbSampleRate->setObjectName(QString::fromUtf8("sbSampleRate"));
        sbSampleRate->setMinimum(1);
        sbSampleRate->setMaximum(300);
        sbSampleRate->setSingleStep(10);
        sbSampleRate->setValue(200);

        gridLayout->addWidget(sbSampleRate, 3, 1, 1, 1);

        label_7 = new QLabel(groupBox);
        label_7->setObjectName(QString::fromUtf8("label_7"));
        sizePolicy.setHeightForWidth(label_7->sizePolicy().hasHeightForWidth());
        label_7->setSizePolicy(sizePolicy);

        gridLayout->addWidget(label_7, 3, 2, 1, 1);


        gridLayout_2->addWidget(groupBox, 0, 0, 1, 4);


        horizontalLayout->addWidget(widget_3);

        widget = new QWidget(FormRegAccess);
        widget->setObjectName(QString::fromUtf8("widget"));
        gridLayout_3 = new QGridLayout(widget);
        gridLayout_3->setObjectName(QString::fromUtf8("gridLayout_3"));
        pushButton_3 = new QPushButton(widget);
        pushButton_3->setObjectName(QString::fromUtf8("pushButton_3"));

        gridLayout_3->addWidget(pushButton_3, 1, 0, 1, 1);

        pushButton_4 = new QPushButton(widget);
        pushButton_4->setObjectName(QString::fromUtf8("pushButton_4"));

        gridLayout_3->addWidget(pushButton_4, 1, 1, 1, 1);

        pushButton_5 = new QPushButton(widget);
        pushButton_5->setObjectName(QString::fromUtf8("pushButton_5"));

        gridLayout_3->addWidget(pushButton_5, 1, 2, 1, 1);

        pushButton_6 = new QPushButton(widget);
        pushButton_6->setObjectName(QString::fromUtf8("pushButton_6"));

        gridLayout_3->addWidget(pushButton_6, 1, 3, 1, 1);

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
        FormRegAccess->setWindowTitle(QApplication::translate("FormRegAccess", "Form", 0, QApplication::UnicodeUTF8));
        pushButtonResetCircuit->setText(QApplication::translate("FormRegAccess", "\345\244\215\344\275\215\347\224\265\350\267\257", 0, QApplication::UnicodeUTF8));
        pushButtonOpenScan->setText(QApplication::translate("FormRegAccess", "\346\211\223\345\274\200\346\211\253\346\217\217\351\223\276", 0, QApplication::UnicodeUTF8));
        groupBox_2->setTitle(QApplication::translate("FormRegAccess", "\345\274\225\350\204\232\350\257\264\346\230\216", 0, QApplication::UnicodeUTF8));
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
        label_9->setText(QApplication::translate("FormRegAccess", "\351\207\207\346\240\267\347\216\207", 0, QApplication::UnicodeUTF8));
        label_7->setText(QApplication::translate("FormRegAccess", "MHz", 0, QApplication::UnicodeUTF8));
        pushButton_3->setText(QApplication::translate("FormRegAccess", "\344\277\235\345\255\230\350\256\276\347\275\256", 0, QApplication::UnicodeUTF8));
        pushButton_4->setText(QApplication::translate("FormRegAccess", "\350\257\273\345\205\245\350\256\276\347\275\256", 0, QApplication::UnicodeUTF8));
        pushButton_5->setText(QApplication::translate("FormRegAccess", "\350\207\263\351\246\226\350\241\214", 0, QApplication::UnicodeUTF8));
        pushButton_6->setText(QApplication::translate("FormRegAccess", "\345\215\225\346\255\245\346\211\247\350\241\214", 0, QApplication::UnicodeUTF8));
        pushButtonAutoExec->setText(QApplication::translate("FormRegAccess", "\350\207\252\345\212\250\346\211\247\350\241\214", 0, QApplication::UnicodeUTF8));
        groupBoxRegAcessItems->setTitle(QString());
    } // retranslateUi

};

namespace Ui {
    class FormRegAccess: public Ui_FormRegAccess {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_REGACCESS_H

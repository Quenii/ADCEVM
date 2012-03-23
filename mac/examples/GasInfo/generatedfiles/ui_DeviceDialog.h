/********************************************************************************
** Form generated from reading UI file 'DeviceDialog.ui'
**
** Created: Sat Mar 17 17:46:36 2012
**      by: Qt User Interface Compiler version 4.7.3
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DEVICEDIALOG_H
#define UI_DEVICEDIALOG_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QComboBox>
#include <QtGui/QDialog>
#include <QtGui/QDialogButtonBox>
#include <QtGui/QGridLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QSpacerItem>
#include <QtGui/QSpinBox>
#include <QtGui/QVBoxLayout>
#include <QtGui/QWidget>

QT_BEGIN_NAMESPACE

class Ui_QDeviceDialogClass
{
public:
    QWidget *layoutWidget;
    QVBoxLayout *verticalLayout;
    QGridLayout *gridLayout;
    QLabel *label;
    QComboBox *portBox;
    QLabel *label_2;
    QComboBox *baudRateBox;
    QLabel *label_3;
    QComboBox *dataBitsBox;
    QLabel *label_4;
    QComboBox *parityBox;
    QLabel *label_5;
    QComboBox *stopBitsBox;
    QLabel *label_7;
    QSpinBox *timeoutBox;
    QLabel *label_6;
    QComboBox *queryModeBox;
    QDialogButtonBox *buttonBox;
    QSpacerItem *verticalSpacer;

    void setupUi(QDialog *QDeviceDialogClass)
    {
        if (QDeviceDialogClass->objectName().isEmpty())
            QDeviceDialogClass->setObjectName(QString::fromUtf8("QDeviceDialogClass"));
        QDeviceDialogClass->resize(327, 286);
        layoutWidget = new QWidget(QDeviceDialogClass);
        layoutWidget->setObjectName(QString::fromUtf8("layoutWidget"));
        layoutWidget->setGeometry(QRect(10, 10, 295, 267));
        verticalLayout = new QVBoxLayout(layoutWidget);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        verticalLayout->setContentsMargins(0, 0, 0, 0);
        gridLayout = new QGridLayout();
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        label = new QLabel(layoutWidget);
        label->setObjectName(QString::fromUtf8("label"));

        gridLayout->addWidget(label, 0, 0, 1, 1);

        portBox = new QComboBox(layoutWidget);
        portBox->setObjectName(QString::fromUtf8("portBox"));
        QSizePolicy sizePolicy(QSizePolicy::Minimum, QSizePolicy::Fixed);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(portBox->sizePolicy().hasHeightForWidth());
        portBox->setSizePolicy(sizePolicy);
        portBox->setMinimumSize(QSize(200, 0));

        gridLayout->addWidget(portBox, 0, 1, 1, 1);

        label_2 = new QLabel(layoutWidget);
        label_2->setObjectName(QString::fromUtf8("label_2"));

        gridLayout->addWidget(label_2, 1, 0, 1, 1);

        baudRateBox = new QComboBox(layoutWidget);
        baudRateBox->setObjectName(QString::fromUtf8("baudRateBox"));

        gridLayout->addWidget(baudRateBox, 1, 1, 1, 1);

        label_3 = new QLabel(layoutWidget);
        label_3->setObjectName(QString::fromUtf8("label_3"));

        gridLayout->addWidget(label_3, 2, 0, 1, 1);

        dataBitsBox = new QComboBox(layoutWidget);
        dataBitsBox->setObjectName(QString::fromUtf8("dataBitsBox"));

        gridLayout->addWidget(dataBitsBox, 2, 1, 1, 1);

        label_4 = new QLabel(layoutWidget);
        label_4->setObjectName(QString::fromUtf8("label_4"));

        gridLayout->addWidget(label_4, 3, 0, 1, 1);

        parityBox = new QComboBox(layoutWidget);
        parityBox->setObjectName(QString::fromUtf8("parityBox"));

        gridLayout->addWidget(parityBox, 3, 1, 1, 1);

        label_5 = new QLabel(layoutWidget);
        label_5->setObjectName(QString::fromUtf8("label_5"));

        gridLayout->addWidget(label_5, 4, 0, 1, 1);

        stopBitsBox = new QComboBox(layoutWidget);
        stopBitsBox->setObjectName(QString::fromUtf8("stopBitsBox"));

        gridLayout->addWidget(stopBitsBox, 4, 1, 1, 1);

        label_7 = new QLabel(layoutWidget);
        label_7->setObjectName(QString::fromUtf8("label_7"));

        gridLayout->addWidget(label_7, 5, 0, 1, 1);

        timeoutBox = new QSpinBox(layoutWidget);
        timeoutBox->setObjectName(QString::fromUtf8("timeoutBox"));
        timeoutBox->setMinimum(-1);
        timeoutBox->setMaximum(10000);
        timeoutBox->setSingleStep(10);
        timeoutBox->setValue(10);

        gridLayout->addWidget(timeoutBox, 5, 1, 1, 1);

        label_6 = new QLabel(layoutWidget);
        label_6->setObjectName(QString::fromUtf8("label_6"));

        gridLayout->addWidget(label_6, 6, 0, 1, 1);

        queryModeBox = new QComboBox(layoutWidget);
        queryModeBox->setObjectName(QString::fromUtf8("queryModeBox"));

        gridLayout->addWidget(queryModeBox, 6, 1, 1, 1);


        verticalLayout->addLayout(gridLayout);

        buttonBox = new QDialogButtonBox(layoutWidget);
        buttonBox->setObjectName(QString::fromUtf8("buttonBox"));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Ok);
        buttonBox->setCenterButtons(true);

        verticalLayout->addWidget(buttonBox);

        verticalSpacer = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout->addItem(verticalSpacer);


        retranslateUi(QDeviceDialogClass);
        QObject::connect(buttonBox, SIGNAL(accepted()), QDeviceDialogClass, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), QDeviceDialogClass, SLOT(reject()));

        QMetaObject::connectSlotsByName(QDeviceDialogClass);
    } // setupUi

    void retranslateUi(QDialog *QDeviceDialogClass)
    {
        QDeviceDialogClass->setWindowTitle(QApplication::translate("QDeviceDialogClass", "Zigbee Devices Setting", 0, QApplication::UnicodeUTF8));
        label->setText(QApplication::translate("QDeviceDialogClass", "Port:", 0, QApplication::UnicodeUTF8));
        label_2->setText(QApplication::translate("QDeviceDialogClass", "BaudRate:", 0, QApplication::UnicodeUTF8));
        label_3->setText(QApplication::translate("QDeviceDialogClass", "DataBits:", 0, QApplication::UnicodeUTF8));
        label_4->setText(QApplication::translate("QDeviceDialogClass", "Parity:", 0, QApplication::UnicodeUTF8));
        label_5->setText(QApplication::translate("QDeviceDialogClass", "StopBits:", 0, QApplication::UnicodeUTF8));
        label_7->setText(QApplication::translate("QDeviceDialogClass", "Timeout:", 0, QApplication::UnicodeUTF8));
        timeoutBox->setSuffix(QApplication::translate("QDeviceDialogClass", " ms", 0, QApplication::UnicodeUTF8));
        label_6->setText(QApplication::translate("QDeviceDialogClass", "QueryMode:", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class QDeviceDialogClass: public Ui_QDeviceDialogClass {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DEVICEDIALOG_H

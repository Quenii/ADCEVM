/********************************************************************************
** Form generated from reading UI file 'StatitonInfo.ui'
**
** Created: Sun Mar 18 22:26:58 2012
**      by: Qt User Interface Compiler version 4.7.3
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_STATITONINFO_H
#define UI_STATITONINFO_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QGridLayout>
#include <QtGui/QGroupBox>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QLineEdit>
#include <QtGui/QWidget>

QT_BEGIN_NAMESPACE

class Ui_StationInfo
{
public:
    QGroupBox *groupBox;
    QWidget *layoutWidget;
    QGridLayout *gridLayout;
    QLabel *label_4;
    QLabel *label_5;
    QLabel *label;
    QLineEdit *lineEditH2S;
    QLineEdit *lineEditH2SPeak;
    QLabel *label_6;
    QLabel *label_2;
    QLineEdit *lineEditSO2;
    QLineEdit *lineEditSO2Peak;
    QLabel *label_7;
    QLabel *label_3;
    QLineEdit *lineEditFEL;
    QLineEdit *lineEditFELPeak;
    QLabel *label_8;
    QGroupBox *groupBox_2;
    QWidget *layoutWidget1;
    QGridLayout *gridLayout_2;
    QLabel *label_11;
    QLineEdit *lineEditLatitude;
    QLabel *label_12;
    QLineEdit *lineEditLongitude;
    QLabel *label_15;
    QLineEdit *lineEditDistance;

    void setupUi(QWidget *StationInfo)
    {
        if (StationInfo->objectName().isEmpty())
            StationInfo->setObjectName(QString::fromUtf8("StationInfo"));
        StationInfo->resize(540, 243);
        groupBox = new QGroupBox(StationInfo);
        groupBox->setObjectName(QString::fromUtf8("groupBox"));
        groupBox->setGeometry(QRect(10, 20, 251, 211));
        layoutWidget = new QWidget(groupBox);
        layoutWidget->setObjectName(QString::fromUtf8("layoutWidget"));
        layoutWidget->setGeometry(QRect(10, 30, 231, 114));
        gridLayout = new QGridLayout(layoutWidget);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        gridLayout->setContentsMargins(0, 0, 0, 0);
        label_4 = new QLabel(layoutWidget);
        label_4->setObjectName(QString::fromUtf8("label_4"));

        gridLayout->addWidget(label_4, 0, 1, 1, 1);

        label_5 = new QLabel(layoutWidget);
        label_5->setObjectName(QString::fromUtf8("label_5"));

        gridLayout->addWidget(label_5, 0, 2, 1, 1);

        label = new QLabel(layoutWidget);
        label->setObjectName(QString::fromUtf8("label"));

        gridLayout->addWidget(label, 1, 0, 1, 1);

        lineEditH2S = new QLineEdit(layoutWidget);
        lineEditH2S->setObjectName(QString::fromUtf8("lineEditH2S"));
        lineEditH2S->setEnabled(false);

        gridLayout->addWidget(lineEditH2S, 1, 1, 1, 1);

        lineEditH2SPeak = new QLineEdit(layoutWidget);
        lineEditH2SPeak->setObjectName(QString::fromUtf8("lineEditH2SPeak"));
        lineEditH2SPeak->setEnabled(false);

        gridLayout->addWidget(lineEditH2SPeak, 1, 2, 1, 1);

        label_6 = new QLabel(layoutWidget);
        label_6->setObjectName(QString::fromUtf8("label_6"));

        gridLayout->addWidget(label_6, 1, 3, 1, 1);

        label_2 = new QLabel(layoutWidget);
        label_2->setObjectName(QString::fromUtf8("label_2"));

        gridLayout->addWidget(label_2, 2, 0, 1, 1);

        lineEditSO2 = new QLineEdit(layoutWidget);
        lineEditSO2->setObjectName(QString::fromUtf8("lineEditSO2"));
        lineEditSO2->setEnabled(false);

        gridLayout->addWidget(lineEditSO2, 2, 1, 1, 1);

        lineEditSO2Peak = new QLineEdit(layoutWidget);
        lineEditSO2Peak->setObjectName(QString::fromUtf8("lineEditSO2Peak"));
        lineEditSO2Peak->setEnabled(false);

        gridLayout->addWidget(lineEditSO2Peak, 2, 2, 1, 1);

        label_7 = new QLabel(layoutWidget);
        label_7->setObjectName(QString::fromUtf8("label_7"));

        gridLayout->addWidget(label_7, 2, 3, 1, 1);

        label_3 = new QLabel(layoutWidget);
        label_3->setObjectName(QString::fromUtf8("label_3"));

        gridLayout->addWidget(label_3, 3, 0, 1, 1);

        lineEditFEL = new QLineEdit(layoutWidget);
        lineEditFEL->setObjectName(QString::fromUtf8("lineEditFEL"));
        lineEditFEL->setEnabled(false);

        gridLayout->addWidget(lineEditFEL, 3, 1, 1, 1);

        lineEditFELPeak = new QLineEdit(layoutWidget);
        lineEditFELPeak->setObjectName(QString::fromUtf8("lineEditFELPeak"));
        lineEditFELPeak->setEnabled(false);

        gridLayout->addWidget(lineEditFELPeak, 3, 2, 1, 1);

        label_8 = new QLabel(layoutWidget);
        label_8->setObjectName(QString::fromUtf8("label_8"));

        gridLayout->addWidget(label_8, 3, 3, 1, 1);

        groupBox_2 = new QGroupBox(StationInfo);
        groupBox_2->setObjectName(QString::fromUtf8("groupBox_2"));
        groupBox_2->setGeometry(QRect(290, 20, 221, 211));
        layoutWidget1 = new QWidget(groupBox_2);
        layoutWidget1->setObjectName(QString::fromUtf8("layoutWidget1"));
        layoutWidget1->setGeometry(QRect(10, 30, 191, 88));
        gridLayout_2 = new QGridLayout(layoutWidget1);
        gridLayout_2->setObjectName(QString::fromUtf8("gridLayout_2"));
        gridLayout_2->setContentsMargins(0, 0, 0, 0);
        label_11 = new QLabel(layoutWidget1);
        label_11->setObjectName(QString::fromUtf8("label_11"));

        gridLayout_2->addWidget(label_11, 0, 0, 1, 1);

        lineEditLatitude = new QLineEdit(layoutWidget1);
        lineEditLatitude->setObjectName(QString::fromUtf8("lineEditLatitude"));
        lineEditLatitude->setEnabled(false);

        gridLayout_2->addWidget(lineEditLatitude, 0, 1, 1, 1);

        label_12 = new QLabel(layoutWidget1);
        label_12->setObjectName(QString::fromUtf8("label_12"));

        gridLayout_2->addWidget(label_12, 1, 0, 1, 1);

        lineEditLongitude = new QLineEdit(layoutWidget1);
        lineEditLongitude->setObjectName(QString::fromUtf8("lineEditLongitude"));
        lineEditLongitude->setEnabled(false);

        gridLayout_2->addWidget(lineEditLongitude, 1, 1, 1, 1);

        label_15 = new QLabel(layoutWidget1);
        label_15->setObjectName(QString::fromUtf8("label_15"));

        gridLayout_2->addWidget(label_15, 2, 0, 1, 1);

        lineEditDistance = new QLineEdit(layoutWidget1);
        lineEditDistance->setObjectName(QString::fromUtf8("lineEditDistance"));
        lineEditDistance->setEnabled(false);

        gridLayout_2->addWidget(lineEditDistance, 2, 1, 1, 1);


        retranslateUi(StationInfo);

        QMetaObject::connectSlotsByName(StationInfo);
    } // setupUi

    void retranslateUi(QWidget *StationInfo)
    {
        StationInfo->setWindowTitle(QApplication::translate("StationInfo", "Form", 0, QApplication::UnicodeUTF8));
        groupBox->setTitle(QApplication::translate("StationInfo", "Gas Status", 0, QApplication::UnicodeUTF8));
        label_4->setText(QApplication::translate("StationInfo", "Current", 0, QApplication::UnicodeUTF8));
        label_5->setText(QApplication::translate("StationInfo", "Peak", 0, QApplication::UnicodeUTF8));
        label->setText(QApplication::translate("StationInfo", "H2S", 0, QApplication::UnicodeUTF8));
        label_6->setText(QApplication::translate("StationInfo", "ppm", 0, QApplication::UnicodeUTF8));
        label_2->setText(QApplication::translate("StationInfo", "SO2", 0, QApplication::UnicodeUTF8));
        label_7->setText(QApplication::translate("StationInfo", "ppm", 0, QApplication::UnicodeUTF8));
        label_3->setText(QApplication::translate("StationInfo", "FEL", 0, QApplication::UnicodeUTF8));
        label_8->setText(QApplication::translate("StationInfo", "%", 0, QApplication::UnicodeUTF8));
        groupBox_2->setTitle(QApplication::translate("StationInfo", "Station Location", 0, QApplication::UnicodeUTF8));
        label_11->setText(QApplication::translate("StationInfo", "Latitude", 0, QApplication::UnicodeUTF8));
        label_12->setText(QApplication::translate("StationInfo", "Longitude", 0, QApplication::UnicodeUTF8));
        label_15->setText(QApplication::translate("StationInfo", "Distance", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class StationInfo: public Ui_StationInfo {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_STATITONINFO_H

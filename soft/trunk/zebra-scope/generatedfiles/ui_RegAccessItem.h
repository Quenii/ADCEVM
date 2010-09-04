/********************************************************************************
** Form generated from reading ui file 'RegAccessItem.ui'
**
** Created: Sat Sep 4 20:42:21 2010
**      by: Qt User Interface Compiler version 4.5.3
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
********************************************************************************/

#ifndef UI_REGACCESSITEM_H
#define UI_REGACCESSITEM_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QCheckBox>
#include <QtGui/QComboBox>
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QLineEdit>
#include <QtGui/QWidget>

QT_BEGIN_NAMESPACE

class Ui_RegAccessItemClass
{
public:
    QHBoxLayout *horizontalLayout;
    QCheckBox *checkBox;
    QLabel *labelNo;
    QComboBox *cbOperation;
    QLabel *label_7;
    QLineEdit *lineEditAddr;
    QLabel *label_9;
    QLineEdit *lineEditValue;

    void setupUi(QWidget *RegAccessItemClass)
    {
        if (RegAccessItemClass->objectName().isEmpty())
            RegAccessItemClass->setObjectName(QString::fromUtf8("RegAccessItemClass"));
        RegAccessItemClass->resize(442, 20);
        horizontalLayout = new QHBoxLayout(RegAccessItemClass);
        horizontalLayout->setMargin(0);
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        checkBox = new QCheckBox(RegAccessItemClass);
        checkBox->setObjectName(QString::fromUtf8("checkBox"));

        horizontalLayout->addWidget(checkBox);

        labelNo = new QLabel(RegAccessItemClass);
        labelNo->setObjectName(QString::fromUtf8("labelNo"));
        labelNo->setMinimumSize(QSize(20, 0));
        labelNo->setMaximumSize(QSize(20, 16777215));
        labelNo->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        horizontalLayout->addWidget(labelNo);

        cbOperation = new QComboBox(RegAccessItemClass);
        cbOperation->setObjectName(QString::fromUtf8("cbOperation"));
        cbOperation->setMinimumSize(QSize(60, 0));
        cbOperation->setMaximumSize(QSize(60, 16777215));

        horizontalLayout->addWidget(cbOperation);

        label_7 = new QLabel(RegAccessItemClass);
        label_7->setObjectName(QString::fromUtf8("label_7"));
        label_7->setMinimumSize(QSize(50, 0));
        label_7->setMaximumSize(QSize(50, 16777215));
        QFont font;
        font.setFamily(QString::fromUtf8("Arial"));
        font.setPointSize(10);
        label_7->setFont(font);
        label_7->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        horizontalLayout->addWidget(label_7);

        lineEditAddr = new QLineEdit(RegAccessItemClass);
        lineEditAddr->setObjectName(QString::fromUtf8("lineEditAddr"));
        lineEditAddr->setMinimumSize(QSize(100, 0));
        lineEditAddr->setMaximumSize(QSize(100, 16777215));

        horizontalLayout->addWidget(lineEditAddr);

        label_9 = new QLabel(RegAccessItemClass);
        label_9->setObjectName(QString::fromUtf8("label_9"));
        label_9->setMinimumSize(QSize(50, 0));
        label_9->setMaximumSize(QSize(50, 16777215));
        label_9->setFont(font);
        label_9->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        horizontalLayout->addWidget(label_9);

        lineEditValue = new QLineEdit(RegAccessItemClass);
        lineEditValue->setObjectName(QString::fromUtf8("lineEditValue"));
        lineEditValue->setMinimumSize(QSize(100, 0));
        lineEditValue->setMaximumSize(QSize(100, 16777215));

        horizontalLayout->addWidget(lineEditValue);


        retranslateUi(RegAccessItemClass);

        QMetaObject::connectSlotsByName(RegAccessItemClass);
    } // setupUi

    void retranslateUi(QWidget *RegAccessItemClass)
    {
        RegAccessItemClass->setWindowTitle(QApplication::translate("RegAccessItemClass", "Form", 0, QApplication::UnicodeUTF8));
        checkBox->setText(QString());
        labelNo->setText(QApplication::translate("RegAccessItemClass", "1", 0, QApplication::UnicodeUTF8));
        cbOperation->clear();
        cbOperation->insertItems(0, QStringList()
         << QApplication::translate("RegAccessItemClass", "\344\270\215\346\223\215\344\275\234", 0, QApplication::UnicodeUTF8)
         << QApplication::translate("RegAccessItemClass", "\350\257\273", 0, QApplication::UnicodeUTF8)
         << QApplication::translate("RegAccessItemClass", "\345\206\231", 0, QApplication::UnicodeUTF8)
        );
        label_7->setText(QApplication::translate("RegAccessItemClass", "\345\234\260\345\235\200 0x", 0, QApplication::UnicodeUTF8));
        label_9->setText(QApplication::translate("RegAccessItemClass", "\345\200\274 0x", 0, QApplication::UnicodeUTF8));
        Q_UNUSED(RegAccessItemClass);
    } // retranslateUi

};

namespace Ui {
    class RegAccessItemClass: public Ui_RegAccessItemClass {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_REGACCESSITEM_H

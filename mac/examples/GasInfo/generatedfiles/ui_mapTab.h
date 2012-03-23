/********************************************************************************
** Form generated from reading UI file 'mapTab.ui'
**
** Created: Sun Mar 18 22:28:25 2012
**      by: Qt User Interface Compiler version 4.7.3
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAPTAB_H
#define UI_MAPTAB_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QHeaderView>
#include <QtGui/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MapTab
{
public:

    void setupUi(QWidget *MapTab)
    {
        if (MapTab->objectName().isEmpty())
            MapTab->setObjectName(QString::fromUtf8("MapTab"));
        MapTab->resize(539, 318);
        QSizePolicy sizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(MapTab->sizePolicy().hasHeightForWidth());
        MapTab->setSizePolicy(sizePolicy);

        retranslateUi(MapTab);

        QMetaObject::connectSlotsByName(MapTab);
    } // setupUi

    void retranslateUi(QWidget *MapTab)
    {
        MapTab->setWindowTitle(QApplication::translate("MapTab", "Form", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class MapTab: public Ui_MapTab {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAPTAB_H

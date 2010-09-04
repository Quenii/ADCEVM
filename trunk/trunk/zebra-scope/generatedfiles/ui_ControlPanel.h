/********************************************************************************
** Form generated from reading ui file 'ControlPanel.ui'
**
** Created: Sat Sep 4 20:42:22 2010
**      by: Qt User Interface Compiler version 4.5.3
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
********************************************************************************/

#ifndef UI_CONTROLPANEL_H
#define UI_CONTROLPANEL_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QComboBox>
#include <QtGui/QDoubleSpinBox>
#include <QtGui/QGridLayout>
#include <QtGui/QGroupBox>
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QLineEdit>
#include <QtGui/QPushButton>
#include <QtGui/QSpacerItem>
#include <QtGui/QSpinBox>
#include <QtGui/QTreeView>
#include <QtGui/QVBoxLayout>
#include <QtGui/QWidget>

QT_BEGIN_NAMESPACE

class Ui_ControlPanel
{
public:
    QVBoxLayout *verticalLayout_3;
    QGroupBox *groupBox_DeviceList;
    QVBoxLayout *verticalLayout;
    QHBoxLayout *horizontalLayout;
    QLabel *labl;
    QSpacerItem *horizontalSpacer;
    QTreeView *devicesView;
    QGroupBox *groupBox;
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
    QSpacerItem *horizontalSpacer_9;
    QSpacerItem *horizontalSpacer_6;
    QPushButton *pushButtonApplyAdcSettings;
    QComboBox *codingComboBox;
    QGroupBox *groupBox_2;
    QGridLayout *gridLayout_3;
    QGridLayout *gridLayout_4;
    QLabel *labl_14;
    QLineEdit *clockFreqLineEdit;
    QLabel *labl_15;
    QLabel *labl_17;
    QLabel *labl_18;
    QLabel *labl_25;
    QLineEdit *signalFreqLineEdit;
    QLabel *labl_26;
    QLineEdit *signalPowerLineEdit;
    QSpacerItem *horizontalSpacer_10;
    QPushButton *pushButtonSignalSettings;
    QSpacerItem *horizontalSpacer_8;
    QGroupBox *groupBox_3;
    QVBoxLayout *verticalLayout_2;
    QWidget *dynamicTestButtons;
    QHBoxLayout *horizontalLayout_2;
    QPushButton *pushButtonStartDynamicTest;
    QPushButton *pushButtonStopDynamicTest;
    QWidget *staticTestButtons;
    QHBoxLayout *horizontalLayout_4;
    QPushButton *pushButtonStartStaticTest;
    QPushButton *pushButtonStopStaticTest;
    QGroupBox *groupBox_4;
    QGridLayout *gridLayout_8;
    QGridLayout *gridLayout_9;
    QLabel *labl_22;
    QLineEdit *vaLineEdit;
    QLabel *labl_23;
    QLabel *labl_24;
    QLabel *labl_29;
    QLabel *labl_30;
    QLineEdit *vdLineEdit;
    QLabel *labl_31;
    QLineEdit *iaLineEdit;
    QSpacerItem *horizontalSpacer_13;
    QSpacerItem *horizontalSpacer_14;
    QLabel *labl_32;
    QLineEdit *idLineEdit;
    QLabel *labl_33;
    QLabel *labl_34;
    QLabel *labl_35;
    QLineEdit *powerLineEdit;
    QHBoxLayout *horizontalLayout_3;
    QSpacerItem *horizontalSpacer_3;
    QPushButton *pushButtonAccessToRegs;
    QSpacerItem *horizontalSpacer_4;
    QHBoxLayout *horizontalLayout_5;
    QLabel *labl_2;
    QSpacerItem *horizontalSpacer_2;
    QTreeView *treeViewTdReport;

    void setupUi(QWidget *ControlPanel)
    {
        if (ControlPanel->objectName().isEmpty())
            ControlPanel->setObjectName(QString::fromUtf8("ControlPanel"));
        ControlPanel->resize(282, 1060);
        verticalLayout_3 = new QVBoxLayout(ControlPanel);
        verticalLayout_3->setObjectName(QString::fromUtf8("verticalLayout_3"));
        groupBox_DeviceList = new QGroupBox(ControlPanel);
        groupBox_DeviceList->setObjectName(QString::fromUtf8("groupBox_DeviceList"));
        groupBox_DeviceList->setAlignment(Qt::AlignCenter);
        verticalLayout = new QVBoxLayout(groupBox_DeviceList);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        labl = new QLabel(groupBox_DeviceList);
        labl->setObjectName(QString::fromUtf8("labl"));
        QFont font;
        font.setFamily(QString::fromUtf8("Arial"));
        font.setPointSize(10);
        labl->setFont(font);

        horizontalLayout->addWidget(labl);

        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer);


        verticalLayout->addLayout(horizontalLayout);

        devicesView = new QTreeView(groupBox_DeviceList);
        devicesView->setObjectName(QString::fromUtf8("devicesView"));
        QSizePolicy sizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(devicesView->sizePolicy().hasHeightForWidth());
        devicesView->setSizePolicy(sizePolicy);
        devicesView->setMaximumSize(QSize(16777215, 80));
        QFont font1;
        font1.setFamily(QString::fromUtf8("Arial"));
        font1.setPointSize(8);
        devicesView->setFont(font1);

        verticalLayout->addWidget(devicesView);


        verticalLayout_3->addWidget(groupBox_DeviceList);

        groupBox = new QGroupBox(ControlPanel);
        groupBox->setObjectName(QString::fromUtf8("groupBox"));
        groupBox->setAlignment(Qt::AlignCenter);
        gridLayout_2 = new QGridLayout(groupBox);
        gridLayout_2->setObjectName(QString::fromUtf8("gridLayout_2"));
        gridLayout = new QGridLayout();
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        labl_3 = new QLabel(groupBox);
        labl_3->setObjectName(QString::fromUtf8("labl_3"));
        labl_3->setFont(font);
        labl_3->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout->addWidget(labl_3, 0, 0, 1, 1);

        adcTypeLineEdit = new QLineEdit(groupBox);
        adcTypeLineEdit->setObjectName(QString::fromUtf8("adcTypeLineEdit"));
        QSizePolicy sizePolicy1(QSizePolicy::Preferred, QSizePolicy::Fixed);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(adcTypeLineEdit->sizePolicy().hasHeightForWidth());
        adcTypeLineEdit->setSizePolicy(sizePolicy1);

        gridLayout->addWidget(adcTypeLineEdit, 0, 1, 1, 1);

        labl_4 = new QLabel(groupBox);
        labl_4->setObjectName(QString::fromUtf8("labl_4"));
        labl_4->setFont(font);
        labl_4->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout->addWidget(labl_4, 1, 0, 1, 1);

        vaDoubleSpinBox = new QDoubleSpinBox(groupBox);
        vaDoubleSpinBox->setObjectName(QString::fromUtf8("vaDoubleSpinBox"));
        sizePolicy1.setHeightForWidth(vaDoubleSpinBox->sizePolicy().hasHeightForWidth());
        vaDoubleSpinBox->setSizePolicy(sizePolicy1);

        gridLayout->addWidget(vaDoubleSpinBox, 1, 1, 1, 1);

        labl_10 = new QLabel(groupBox);
        labl_10->setObjectName(QString::fromUtf8("labl_10"));
        labl_10->setFont(font);

        gridLayout->addWidget(labl_10, 1, 2, 1, 1);

        labl_5 = new QLabel(groupBox);
        labl_5->setObjectName(QString::fromUtf8("labl_5"));
        labl_5->setFont(font);
        labl_5->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout->addWidget(labl_5, 2, 0, 1, 1);

        vdDoubleSpinBox = new QDoubleSpinBox(groupBox);
        vdDoubleSpinBox->setObjectName(QString::fromUtf8("vdDoubleSpinBox"));
        sizePolicy1.setHeightForWidth(vdDoubleSpinBox->sizePolicy().hasHeightForWidth());
        vdDoubleSpinBox->setSizePolicy(sizePolicy1);

        gridLayout->addWidget(vdDoubleSpinBox, 2, 1, 1, 1);

        labl_11 = new QLabel(groupBox);
        labl_11->setObjectName(QString::fromUtf8("labl_11"));
        labl_11->setFont(font);

        gridLayout->addWidget(labl_11, 2, 2, 1, 1);

        labl_6 = new QLabel(groupBox);
        labl_6->setObjectName(QString::fromUtf8("labl_6"));
        labl_6->setFont(font);
        labl_6->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout->addWidget(labl_6, 3, 0, 1, 1);

        bitCountSpinBox = new QSpinBox(groupBox);
        bitCountSpinBox->setObjectName(QString::fromUtf8("bitCountSpinBox"));
        sizePolicy1.setHeightForWidth(bitCountSpinBox->sizePolicy().hasHeightForWidth());
        bitCountSpinBox->setSizePolicy(sizePolicy1);

        gridLayout->addWidget(bitCountSpinBox, 3, 1, 1, 1);

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
        sizePolicy1.setHeightForWidth(vppLineEdit->sizePolicy().hasHeightForWidth());
        vppLineEdit->setSizePolicy(sizePolicy1);

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
        labl_9->setFont(font);
        labl_9->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout->addWidget(labl_9, 6, 0, 1, 1);

        phaseLineEdit = new QLineEdit(groupBox);
        phaseLineEdit->setObjectName(QString::fromUtf8("phaseLineEdit"));
        sizePolicy1.setHeightForWidth(phaseLineEdit->sizePolicy().hasHeightForWidth());
        phaseLineEdit->setSizePolicy(sizePolicy1);

        gridLayout->addWidget(phaseLineEdit, 6, 1, 1, 1);

        horizontalSpacer_9 = new QSpacerItem(75, 0, QSizePolicy::Fixed, QSizePolicy::Minimum);

        gridLayout->addItem(horizontalSpacer_9, 7, 0, 1, 1);

        horizontalSpacer_6 = new QSpacerItem(20, 20, QSizePolicy::Fixed, QSizePolicy::Minimum);

        gridLayout->addItem(horizontalSpacer_6, 7, 2, 1, 1);

        pushButtonApplyAdcSettings = new QPushButton(groupBox);
        pushButtonApplyAdcSettings->setObjectName(QString::fromUtf8("pushButtonApplyAdcSettings"));
        sizePolicy1.setHeightForWidth(pushButtonApplyAdcSettings->sizePolicy().hasHeightForWidth());
        pushButtonApplyAdcSettings->setSizePolicy(sizePolicy1);
        pushButtonApplyAdcSettings->setFont(font);

        gridLayout->addWidget(pushButtonApplyAdcSettings, 7, 1, 1, 1);

        codingComboBox = new QComboBox(groupBox);
        codingComboBox->setObjectName(QString::fromUtf8("codingComboBox"));

        gridLayout->addWidget(codingComboBox, 5, 1, 1, 1);


        gridLayout_2->addLayout(gridLayout, 0, 0, 1, 1);


        verticalLayout_3->addWidget(groupBox);

        groupBox_2 = new QGroupBox(ControlPanel);
        groupBox_2->setObjectName(QString::fromUtf8("groupBox_2"));
        groupBox_2->setAlignment(Qt::AlignCenter);
        gridLayout_3 = new QGridLayout(groupBox_2);
        gridLayout_3->setObjectName(QString::fromUtf8("gridLayout_3"));
        gridLayout_4 = new QGridLayout();
        gridLayout_4->setObjectName(QString::fromUtf8("gridLayout_4"));
        labl_14 = new QLabel(groupBox_2);
        labl_14->setObjectName(QString::fromUtf8("labl_14"));
        labl_14->setFont(font);
        labl_14->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_4->addWidget(labl_14, 0, 0, 1, 1);

        clockFreqLineEdit = new QLineEdit(groupBox_2);
        clockFreqLineEdit->setObjectName(QString::fromUtf8("clockFreqLineEdit"));
        sizePolicy1.setHeightForWidth(clockFreqLineEdit->sizePolicy().hasHeightForWidth());
        clockFreqLineEdit->setSizePolicy(sizePolicy1);

        gridLayout_4->addWidget(clockFreqLineEdit, 0, 1, 1, 1);

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
        labl_18->setFont(font);

        gridLayout_4->addWidget(labl_18, 2, 2, 1, 1);

        labl_25 = new QLabel(groupBox_2);
        labl_25->setObjectName(QString::fromUtf8("labl_25"));
        labl_25->setFont(font);

        gridLayout_4->addWidget(labl_25, 0, 2, 1, 1);

        signalFreqLineEdit = new QLineEdit(groupBox_2);
        signalFreqLineEdit->setObjectName(QString::fromUtf8("signalFreqLineEdit"));
        sizePolicy1.setHeightForWidth(signalFreqLineEdit->sizePolicy().hasHeightForWidth());
        signalFreqLineEdit->setSizePolicy(sizePolicy1);

        gridLayout_4->addWidget(signalFreqLineEdit, 1, 1, 1, 1);

        labl_26 = new QLabel(groupBox_2);
        labl_26->setObjectName(QString::fromUtf8("labl_26"));
        labl_26->setFont(font);

        gridLayout_4->addWidget(labl_26, 1, 2, 1, 1);

        signalPowerLineEdit = new QLineEdit(groupBox_2);
        signalPowerLineEdit->setObjectName(QString::fromUtf8("signalPowerLineEdit"));
        sizePolicy1.setHeightForWidth(signalPowerLineEdit->sizePolicy().hasHeightForWidth());
        signalPowerLineEdit->setSizePolicy(sizePolicy1);

        gridLayout_4->addWidget(signalPowerLineEdit, 2, 1, 1, 1);

        horizontalSpacer_10 = new QSpacerItem(75, 0, QSizePolicy::Fixed, QSizePolicy::Minimum);

        gridLayout_4->addItem(horizontalSpacer_10, 3, 0, 1, 1);

        pushButtonSignalSettings = new QPushButton(groupBox_2);
        pushButtonSignalSettings->setObjectName(QString::fromUtf8("pushButtonSignalSettings"));
        sizePolicy1.setHeightForWidth(pushButtonSignalSettings->sizePolicy().hasHeightForWidth());
        pushButtonSignalSettings->setSizePolicy(sizePolicy1);
        pushButtonSignalSettings->setFont(font);

        gridLayout_4->addWidget(pushButtonSignalSettings, 3, 1, 1, 1);

        horizontalSpacer_8 = new QSpacerItem(20, 20, QSizePolicy::Fixed, QSizePolicy::Minimum);

        gridLayout_4->addItem(horizontalSpacer_8, 3, 2, 1, 1);


        gridLayout_3->addLayout(gridLayout_4, 0, 0, 1, 1);


        verticalLayout_3->addWidget(groupBox_2);

        groupBox_3 = new QGroupBox(ControlPanel);
        groupBox_3->setObjectName(QString::fromUtf8("groupBox_3"));
        groupBox_3->setAlignment(Qt::AlignCenter);
        verticalLayout_2 = new QVBoxLayout(groupBox_3);
        verticalLayout_2->setObjectName(QString::fromUtf8("verticalLayout_2"));
        dynamicTestButtons = new QWidget(groupBox_3);
        dynamicTestButtons->setObjectName(QString::fromUtf8("dynamicTestButtons"));
        horizontalLayout_2 = new QHBoxLayout(dynamicTestButtons);
        horizontalLayout_2->setMargin(0);
        horizontalLayout_2->setObjectName(QString::fromUtf8("horizontalLayout_2"));
        pushButtonStartDynamicTest = new QPushButton(dynamicTestButtons);
        pushButtonStartDynamicTest->setObjectName(QString::fromUtf8("pushButtonStartDynamicTest"));

        horizontalLayout_2->addWidget(pushButtonStartDynamicTest);

        pushButtonStopDynamicTest = new QPushButton(dynamicTestButtons);
        pushButtonStopDynamicTest->setObjectName(QString::fromUtf8("pushButtonStopDynamicTest"));
        pushButtonStopDynamicTest->setEnabled(false);

        horizontalLayout_2->addWidget(pushButtonStopDynamicTest);


        verticalLayout_2->addWidget(dynamicTestButtons);

        staticTestButtons = new QWidget(groupBox_3);
        staticTestButtons->setObjectName(QString::fromUtf8("staticTestButtons"));
        horizontalLayout_4 = new QHBoxLayout(staticTestButtons);
        horizontalLayout_4->setMargin(0);
        horizontalLayout_4->setObjectName(QString::fromUtf8("horizontalLayout_4"));
        pushButtonStartStaticTest = new QPushButton(staticTestButtons);
        pushButtonStartStaticTest->setObjectName(QString::fromUtf8("pushButtonStartStaticTest"));

        horizontalLayout_4->addWidget(pushButtonStartStaticTest);

        pushButtonStopStaticTest = new QPushButton(staticTestButtons);
        pushButtonStopStaticTest->setObjectName(QString::fromUtf8("pushButtonStopStaticTest"));
        pushButtonStopStaticTest->setEnabled(false);

        horizontalLayout_4->addWidget(pushButtonStopStaticTest);


        verticalLayout_2->addWidget(staticTestButtons);


        verticalLayout_3->addWidget(groupBox_3);

        groupBox_4 = new QGroupBox(ControlPanel);
        groupBox_4->setObjectName(QString::fromUtf8("groupBox_4"));
        groupBox_4->setAlignment(Qt::AlignCenter);
        gridLayout_8 = new QGridLayout(groupBox_4);
        gridLayout_8->setObjectName(QString::fromUtf8("gridLayout_8"));
        gridLayout_9 = new QGridLayout();
        gridLayout_9->setObjectName(QString::fromUtf8("gridLayout_9"));
        labl_22 = new QLabel(groupBox_4);
        labl_22->setObjectName(QString::fromUtf8("labl_22"));
        labl_22->setFont(font);
        labl_22->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_9->addWidget(labl_22, 0, 0, 1, 1);

        vaLineEdit = new QLineEdit(groupBox_4);
        vaLineEdit->setObjectName(QString::fromUtf8("vaLineEdit"));
        vaLineEdit->setEnabled(true);
        QSizePolicy sizePolicy2(QSizePolicy::Expanding, QSizePolicy::Fixed);
        sizePolicy2.setHorizontalStretch(0);
        sizePolicy2.setVerticalStretch(0);
        sizePolicy2.setHeightForWidth(vaLineEdit->sizePolicy().hasHeightForWidth());
        vaLineEdit->setSizePolicy(sizePolicy2);

        gridLayout_9->addWidget(vaLineEdit, 0, 1, 1, 1);

        labl_23 = new QLabel(groupBox_4);
        labl_23->setObjectName(QString::fromUtf8("labl_23"));
        labl_23->setFont(font);
        labl_23->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_9->addWidget(labl_23, 1, 0, 1, 1);

        labl_24 = new QLabel(groupBox_4);
        labl_24->setObjectName(QString::fromUtf8("labl_24"));
        labl_24->setFont(font);
        labl_24->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_9->addWidget(labl_24, 2, 0, 1, 1);

        labl_29 = new QLabel(groupBox_4);
        labl_29->setObjectName(QString::fromUtf8("labl_29"));
        labl_29->setFont(font);

        gridLayout_9->addWidget(labl_29, 2, 2, 1, 1);

        labl_30 = new QLabel(groupBox_4);
        labl_30->setObjectName(QString::fromUtf8("labl_30"));
        labl_30->setFont(font);

        gridLayout_9->addWidget(labl_30, 0, 2, 1, 1);

        vdLineEdit = new QLineEdit(groupBox_4);
        vdLineEdit->setObjectName(QString::fromUtf8("vdLineEdit"));
        sizePolicy2.setHeightForWidth(vdLineEdit->sizePolicy().hasHeightForWidth());
        vdLineEdit->setSizePolicy(sizePolicy2);

        gridLayout_9->addWidget(vdLineEdit, 1, 1, 1, 1);

        labl_31 = new QLabel(groupBox_4);
        labl_31->setObjectName(QString::fromUtf8("labl_31"));
        labl_31->setFont(font);

        gridLayout_9->addWidget(labl_31, 1, 2, 1, 1);

        iaLineEdit = new QLineEdit(groupBox_4);
        iaLineEdit->setObjectName(QString::fromUtf8("iaLineEdit"));
        sizePolicy2.setHeightForWidth(iaLineEdit->sizePolicy().hasHeightForWidth());
        iaLineEdit->setSizePolicy(sizePolicy2);

        gridLayout_9->addWidget(iaLineEdit, 2, 1, 1, 1);

        horizontalSpacer_13 = new QSpacerItem(75, 0, QSizePolicy::Fixed, QSizePolicy::Minimum);

        gridLayout_9->addItem(horizontalSpacer_13, 5, 0, 1, 1);

        horizontalSpacer_14 = new QSpacerItem(20, 0, QSizePolicy::Fixed, QSizePolicy::Minimum);

        gridLayout_9->addItem(horizontalSpacer_14, 5, 2, 1, 1);

        labl_32 = new QLabel(groupBox_4);
        labl_32->setObjectName(QString::fromUtf8("labl_32"));
        labl_32->setFont(font);
        labl_32->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_9->addWidget(labl_32, 3, 0, 1, 1);

        idLineEdit = new QLineEdit(groupBox_4);
        idLineEdit->setObjectName(QString::fromUtf8("idLineEdit"));
        sizePolicy2.setHeightForWidth(idLineEdit->sizePolicy().hasHeightForWidth());
        idLineEdit->setSizePolicy(sizePolicy2);

        gridLayout_9->addWidget(idLineEdit, 3, 1, 1, 1);

        labl_33 = new QLabel(groupBox_4);
        labl_33->setObjectName(QString::fromUtf8("labl_33"));
        labl_33->setFont(font);

        gridLayout_9->addWidget(labl_33, 3, 2, 1, 1);

        labl_34 = new QLabel(groupBox_4);
        labl_34->setObjectName(QString::fromUtf8("labl_34"));
        labl_34->setFont(font);
        labl_34->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_9->addWidget(labl_34, 4, 0, 1, 1);

        labl_35 = new QLabel(groupBox_4);
        labl_35->setObjectName(QString::fromUtf8("labl_35"));
        labl_35->setFont(font);

        gridLayout_9->addWidget(labl_35, 4, 2, 1, 1);

        powerLineEdit = new QLineEdit(groupBox_4);
        powerLineEdit->setObjectName(QString::fromUtf8("powerLineEdit"));
        sizePolicy2.setHeightForWidth(powerLineEdit->sizePolicy().hasHeightForWidth());
        powerLineEdit->setSizePolicy(sizePolicy2);

        gridLayout_9->addWidget(powerLineEdit, 4, 1, 1, 1);


        gridLayout_8->addLayout(gridLayout_9, 0, 0, 1, 1);


        verticalLayout_3->addWidget(groupBox_4);

        horizontalLayout_3 = new QHBoxLayout();
        horizontalLayout_3->setObjectName(QString::fromUtf8("horizontalLayout_3"));
        horizontalSpacer_3 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_3->addItem(horizontalSpacer_3);

        pushButtonAccessToRegs = new QPushButton(ControlPanel);
        pushButtonAccessToRegs->setObjectName(QString::fromUtf8("pushButtonAccessToRegs"));
        pushButtonAccessToRegs->setFont(font);

        horizontalLayout_3->addWidget(pushButtonAccessToRegs);

        horizontalSpacer_4 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_3->addItem(horizontalSpacer_4);


        verticalLayout_3->addLayout(horizontalLayout_3);

        horizontalLayout_5 = new QHBoxLayout();
        horizontalLayout_5->setObjectName(QString::fromUtf8("horizontalLayout_5"));
        labl_2 = new QLabel(ControlPanel);
        labl_2->setObjectName(QString::fromUtf8("labl_2"));
        labl_2->setFont(font);

        horizontalLayout_5->addWidget(labl_2);

        horizontalSpacer_2 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_5->addItem(horizontalSpacer_2);


        verticalLayout_3->addLayout(horizontalLayout_5);

        treeViewTdReport = new QTreeView(ControlPanel);
        treeViewTdReport->setObjectName(QString::fromUtf8("treeViewTdReport"));
        treeViewTdReport->setFont(font1);

        verticalLayout_3->addWidget(treeViewTdReport);


        retranslateUi(ControlPanel);

        QMetaObject::connectSlotsByName(ControlPanel);
    } // setupUi

    void retranslateUi(QWidget *ControlPanel)
    {
        ControlPanel->setWindowTitle(QApplication::translate("ControlPanel", "Control Panel", 0, QApplication::UnicodeUTF8));
        groupBox_DeviceList->setTitle(QApplication::translate("ControlPanel", "\350\256\276\345\244\207\345\210\227\350\241\250", 0, QApplication::UnicodeUTF8));
        labl->setText(QApplication::translate("ControlPanel", "Select a Device", 0, QApplication::UnicodeUTF8));
        groupBox->setTitle(QApplication::translate("ControlPanel", "ADC\350\256\276\347\275\256", 0, QApplication::UnicodeUTF8));
        labl_3->setText(QApplication::translate("ControlPanel", "ADC\345\236\213\345\217\267", 0, QApplication::UnicodeUTF8));
        labl_4->setText(QApplication::translate("ControlPanel", "V<sub>A</sub>(\350\256\276\347\275\256)", 0, QApplication::UnicodeUTF8));
        labl_10->setText(QApplication::translate("ControlPanel", "V", 0, QApplication::UnicodeUTF8));
        labl_5->setText(QApplication::translate("ControlPanel", "V<sub>D</sub>(\350\256\276\347\275\256)", 0, QApplication::UnicodeUTF8));
        labl_11->setText(QApplication::translate("ControlPanel", "V", 0, QApplication::UnicodeUTF8));
        labl_6->setText(QApplication::translate("ControlPanel", "\344\275\215      \346\225\260", 0, QApplication::UnicodeUTF8));
        labl_12->setText(QApplication::translate("ControlPanel", "bit", 0, QApplication::UnicodeUTF8));
        labl_7->setText(QApplication::translate("ControlPanel", "\346\273\241\345\271\205\350\214\203\345\233\264", 0, QApplication::UnicodeUTF8));
        labl_13->setText(QApplication::translate("ControlPanel", "V", 0, QApplication::UnicodeUTF8));
        labl_8->setText(QApplication::translate("ControlPanel", "\347\274\226\347\240\201\346\226\271\345\274\217", 0, QApplication::UnicodeUTF8));
        labl_9->setText(QApplication::translate("ControlPanel", "\347\233\270\344\275\215\350\256\276\347\275\256", 0, QApplication::UnicodeUTF8));
        pushButtonApplyAdcSettings->setText(QApplication::translate("ControlPanel", "\350\256\276\347\275\256", 0, QApplication::UnicodeUTF8));
        groupBox_2->setTitle(QApplication::translate("ControlPanel", "\346\227\266\351\222\237\344\277\241\345\217\267\350\256\276\347\275\256", 0, QApplication::UnicodeUTF8));
        labl_14->setText(QApplication::translate("ControlPanel", "\346\227\266\351\222\237\351\242\221\347\216\207", 0, QApplication::UnicodeUTF8));
        labl_15->setText(QApplication::translate("ControlPanel", "\344\277\241\345\217\267\351\242\221\347\216\207", 0, QApplication::UnicodeUTF8));
        labl_17->setText(QApplication::translate("ControlPanel", "\344\277\241\345\217\267\345\274\272\345\272\246", 0, QApplication::UnicodeUTF8));
        labl_18->setText(QApplication::translate("ControlPanel", "dBm", 0, QApplication::UnicodeUTF8));
        labl_25->setText(QApplication::translate("ControlPanel", "Hz", 0, QApplication::UnicodeUTF8));
        labl_26->setText(QApplication::translate("ControlPanel", "Hz", 0, QApplication::UnicodeUTF8));
        pushButtonSignalSettings->setText(QApplication::translate("ControlPanel", "\350\256\276\347\275\256", 0, QApplication::UnicodeUTF8));
        groupBox_3->setTitle(QString());
        pushButtonStartDynamicTest->setText(QApplication::translate("ControlPanel", "\345\212\250\346\200\201\346\265\213\350\257\225", 0, QApplication::UnicodeUTF8));
        pushButtonStopDynamicTest->setText(QApplication::translate("ControlPanel", "\345\201\234\346\255\242", 0, QApplication::UnicodeUTF8));
        pushButtonStartStaticTest->setText(QApplication::translate("ControlPanel", "\351\235\231\346\200\201\346\265\213\350\257\225", 0, QApplication::UnicodeUTF8));
        pushButtonStopStaticTest->setText(QApplication::translate("ControlPanel", "\345\201\234\346\255\242", 0, QApplication::UnicodeUTF8));
        groupBox_4->setTitle(QApplication::translate("ControlPanel", "\347\224\265\346\272\220\347\233\221\346\216\247", 0, QApplication::UnicodeUTF8));
        labl_22->setText(QApplication::translate("ControlPanel", "V<sub>A</sub>\346\250\241\346\213\237\347\224\265\345\216\213", 0, QApplication::UnicodeUTF8));
        labl_23->setText(QApplication::translate("ControlPanel", "V<sub>D</sub>\346\225\260\345\255\227\347\224\265\345\216\213", 0, QApplication::UnicodeUTF8));
        labl_24->setText(QApplication::translate("ControlPanel", "I<sub>A</sub>\346\250\241\346\213\237\347\224\265\346\265\201", 0, QApplication::UnicodeUTF8));
        labl_29->setText(QApplication::translate("ControlPanel", "A", 0, QApplication::UnicodeUTF8));
        labl_30->setText(QApplication::translate("ControlPanel", "V", 0, QApplication::UnicodeUTF8));
        labl_31->setText(QApplication::translate("ControlPanel", "V", 0, QApplication::UnicodeUTF8));
        labl_32->setText(QApplication::translate("ControlPanel", "I<sub>D</sub>\346\225\260\345\255\227\347\224\265\346\265\201", 0, QApplication::UnicodeUTF8));
        labl_33->setText(QApplication::translate("ControlPanel", "A", 0, QApplication::UnicodeUTF8));
        labl_34->setText(QApplication::translate("ControlPanel", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
"p, li { white-space: pre-wrap; }\n"
"</style></head><body style=\" font-family:'Arial'; font-size:10pt; font-weight:400; font-style:normal;\">\n"
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">\346\200\273\345\212\237\350\200\227</p></body></html>", 0, QApplication::UnicodeUTF8));
        labl_35->setText(QApplication::translate("ControlPanel", "mW", 0, QApplication::UnicodeUTF8));
        pushButtonAccessToRegs->setText(QApplication::translate("ControlPanel", "\345\217\202\346\225\260\350\256\276\347\275\256", 0, QApplication::UnicodeUTF8));
        labl_2->setText(QApplication::translate("ControlPanel", "Parameters", 0, QApplication::UnicodeUTF8));
        Q_UNUSED(ControlPanel);
    } // retranslateUi

};

namespace Ui {
    class ControlPanel: public Ui_ControlPanel {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_CONTROLPANEL_H

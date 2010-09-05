/****************************************************************************
** Meta object code from reading C++ file 'ControlPanel.hpp'
**
** Created: Sun Sep 5 14:04:37 2010
**      by: The Qt Meta Object Compiler version 62 (Qt 4.6.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../ControlPanel.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'ControlPanel.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.6.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_ControlPanel[] = {

 // content:
       4,       // revision
       0,       // classname
       0,    0, // classinfo
      13,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: signature, parameters, type, tag, flags
      22,   14,   13,   13, 0x05,

 // slots: signature, parameters, type, tag, flags
      43,   39,   13,   13, 0x0a,
      79,   75,   13,   13, 0x0a,
     114,  108,   13,   13, 0x08,
     142,   13,   13,   13, 0x08,
     178,   13,   13,   13, 0x08,
     217,   13,   13,   13, 0x08,
     257,   13,   13,   13, 0x08,
     299,   13,   13,   13, 0x08,
     342,   13,   13,   13, 0x08,
     382,   13,   13,   13, 0x08,
     421,   13,   13,   13, 0x08,
     460,   13,   13,   13, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_ControlPanel[] = {
    "ControlPanel\0\0usbAddr\0devSelected(int)\0"
    "lst\0setDevList(QList<AdcBoardInfo>)\0"
    "rpt\0updateReport(AdcBoardReport)\0index\0"
    "devItemClicked(QModelIndex)\0"
    "on_pushButtonAccessToRegs_clicked()\0"
    "on_pushButtonEditAdcSettings_clicked()\0"
    "on_pushButtonApplyAdcSettings_clicked()\0"
    "on_pushButtonEditSignalSettings_clicked()\0"
    "on_pushButtonApplySignalSettings_clicked()\0"
    "on_pushButtonStartDynamicTest_clicked()\0"
    "on_pushButtonStopDynamicTest_clicked()\0"
    "on_pushButtonStartStaticTest_clicked()\0"
    "on_pushButtonStopStaticTest_clicked()\0"
};

const QMetaObject ControlPanel::staticMetaObject = {
    { &QWidget::staticMetaObject, qt_meta_stringdata_ControlPanel,
      qt_meta_data_ControlPanel, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ControlPanel::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ControlPanel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ControlPanel::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ControlPanel))
        return static_cast<void*>(const_cast< ControlPanel*>(this));
    return QWidget::qt_metacast(_clname);
}

int ControlPanel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QWidget::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: devSelected((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 1: setDevList((*reinterpret_cast< const QList<AdcBoardInfo>(*)>(_a[1]))); break;
        case 2: updateReport((*reinterpret_cast< const AdcBoardReport(*)>(_a[1]))); break;
        case 3: devItemClicked((*reinterpret_cast< const QModelIndex(*)>(_a[1]))); break;
        case 4: on_pushButtonAccessToRegs_clicked(); break;
        case 5: on_pushButtonEditAdcSettings_clicked(); break;
        case 6: on_pushButtonApplyAdcSettings_clicked(); break;
        case 7: on_pushButtonEditSignalSettings_clicked(); break;
        case 8: on_pushButtonApplySignalSettings_clicked(); break;
        case 9: on_pushButtonStartDynamicTest_clicked(); break;
        case 10: on_pushButtonStopDynamicTest_clicked(); break;
        case 11: on_pushButtonStartStaticTest_clicked(); break;
        case 12: on_pushButtonStopStaticTest_clicked(); break;
        default: ;
        }
        _id -= 13;
    }
    return _id;
}

// SIGNAL 0
void ControlPanel::devSelected(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_END_MOC_NAMESPACE

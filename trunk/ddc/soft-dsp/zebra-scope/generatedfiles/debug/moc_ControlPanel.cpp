/****************************************************************************
** Meta object code from reading C++ file 'ControlPanel.h'
**
** Created: Mon Jan 10 23:08:29 2011
**      by: The Qt Meta Object Compiler version 61 (Qt 4.5.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../ControlPanel.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'ControlPanel.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 61
#error "This file was generated using the moc from 4.5.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_ControlPanel[] = {

 // content:
       2,       // revision
       0,       // classname
       0,    0, // classinfo
      12,   12, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors

 // signals: signature, parameters, type, tag, flags
      22,   14,   13,   13, 0x05,
      44,   39,   13,   13, 0x05,
      72,   39,   13,   13, 0x05,

 // slots: signature, parameters, type, tag, flags
     107,  103,   13,   13, 0x0a,
     143,  139,   13,   13, 0x0a,
     178,  172,   13,   13, 0x08,
     206,   13,   13,   13, 0x08,
     245,   13,   13,   13, 0x08,
     287,   13,   13,   13, 0x08,
     327,   13,   13,   13, 0x08,
     366,   13,   13,   13, 0x08,
     405,   13,   13,   13, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_ControlPanel[] = {
    "ControlPanel\0\0usbAddr\0devSelected(int)\0"
    "data\0changeSettings(AdcSettings)\0"
    "changeSettings(SignalSettings)\0lst\0"
    "setDevList(QList<AdcBoardInfo>)\0rpt\0"
    "updateReport(AdcBoardReport)\0index\0"
    "devItemClicked(QModelIndex)\0"
    "on_adcSettingsWidget_settingsChanged()\0"
    "on_signalSettingsWidget_settingsChanged()\0"
    "on_pushButtonStartDynamicTest_clicked()\0"
    "on_pushButtonStopDynamicTest_clicked()\0"
    "on_pushButtonStartStaticTest_clicked()\0"
    "on_pushButtonStopStaticTest_clicked()\0"
};

const QMetaObject ControlPanel::staticMetaObject = {
    { &QWidget::staticMetaObject, qt_meta_stringdata_ControlPanel,
      qt_meta_data_ControlPanel, 0 }
};

const QMetaObject *ControlPanel::metaObject() const
{
    return &staticMetaObject;
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
        case 1: changeSettings((*reinterpret_cast< const AdcSettings(*)>(_a[1]))); break;
        case 2: changeSettings((*reinterpret_cast< const SignalSettings(*)>(_a[1]))); break;
        case 3: setDevList((*reinterpret_cast< const QList<AdcBoardInfo>(*)>(_a[1]))); break;
        case 4: updateReport((*reinterpret_cast< const AdcBoardReport(*)>(_a[1]))); break;
        case 5: devItemClicked((*reinterpret_cast< const QModelIndex(*)>(_a[1]))); break;
        case 6: on_adcSettingsWidget_settingsChanged(); break;
        case 7: on_signalSettingsWidget_settingsChanged(); break;
        case 8: on_pushButtonStartDynamicTest_clicked(); break;
        case 9: on_pushButtonStopDynamicTest_clicked(); break;
        case 10: on_pushButtonStartStaticTest_clicked(); break;
        case 11: on_pushButtonStopStaticTest_clicked(); break;
        default: ;
        }
        _id -= 12;
    }
    return _id;
}

// SIGNAL 0
void ControlPanel::devSelected(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void ControlPanel::changeSettings(const AdcSettings & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void ControlPanel::changeSettings(const SignalSettings & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}
QT_END_MOC_NAMESPACE

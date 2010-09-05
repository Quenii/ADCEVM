/****************************************************************************
** Meta object code from reading C++ file 'RegAccess.hpp'
**
** Created: Sun Sep 5 13:32:13 2010
**      by: The Qt Meta Object Compiler version 62 (Qt 4.6.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../RegAccess.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'RegAccess.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.6.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_RegAccess[] = {

 // content:
       4,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      16,   11,   10,   10, 0x0a,
      56,   10,   10,   10, 0x0a,
      92,   10,   10,   10, 0x0a,
     124,   10,   10,   10, 0x0a,
     156,   10,   10,   10, 0x0a,
     187,   10,   10,   10, 0x0a,
     215,   10,   10,   10, 0x0a,
     247,   10,   10,   10, 0x0a,
     283,   10,   10,   10, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_RegAccess[] = {
    "RegAccess\0\0item\0slotRegAccessItemStateChanged(QWidget*)\0"
    "on_pushButtonResetCircuit_clicked()\0"
    "on_pushButtonOpenScan_clicked()\0"
    "on_pushButtonAutoExec_clicked()\0"
    "on_sbSampleRate_valueChanged()\0"
    "on_pushButtonStep_clicked()\0"
    "on_pushButtonBack2Top_clicked()\0"
    "on_pushButtonSaveSettings_clicked()\0"
    "on_pushButtonReadSettings_clicked()\0"
};

const QMetaObject RegAccess::staticMetaObject = {
    { &QWidget::staticMetaObject, qt_meta_stringdata_RegAccess,
      qt_meta_data_RegAccess, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &RegAccess::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *RegAccess::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *RegAccess::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_RegAccess))
        return static_cast<void*>(const_cast< RegAccess*>(this));
    if (!strcmp(_clname, "Ui::FormRegAccess"))
        return static_cast< Ui::FormRegAccess*>(const_cast< RegAccess*>(this));
    return QWidget::qt_metacast(_clname);
}

int RegAccess::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QWidget::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: slotRegAccessItemStateChanged((*reinterpret_cast< QWidget*(*)>(_a[1]))); break;
        case 1: on_pushButtonResetCircuit_clicked(); break;
        case 2: on_pushButtonOpenScan_clicked(); break;
        case 3: on_pushButtonAutoExec_clicked(); break;
        case 4: on_sbSampleRate_valueChanged(); break;
        case 5: on_pushButtonStep_clicked(); break;
        case 6: on_pushButtonBack2Top_clicked(); break;
        case 7: on_pushButtonSaveSettings_clicked(); break;
        case 8: on_pushButtonReadSettings_clicked(); break;
        default: ;
        }
        _id -= 9;
    }
    return _id;
}
QT_END_MOC_NAMESPACE

/****************************************************************************
** Meta object code from reading C++ file 'qdevicedialog.h'
**
** Created: Sat Mar 17 17:46:37 2012
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../qdevicedialog.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'qdevicedialog.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_QDeviceDialog[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      20,   15,   14,   14, 0x08,
      51,   47,   14,   14, 0x08,
      74,   47,   14,   14, 0x08,
      95,   47,   14,   14, 0x08,
     118,   47,   14,   14, 0x08,
     141,   47,   14,   14, 0x08,
     169,  165,   14,   14, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_QDeviceDialog[] = {
    "QDeviceDialog\0\0name\0onPortNameChanged(QString)\0"
    "idx\0onBaudRateChanged(int)\0"
    "onParityChanged(int)\0onDataBitsChanged(int)\0"
    "onStopBitsChanged(int)\0onQueryModeChanged(int)\0"
    "val\0onTimeoutChanged(int)\0"
};

const QMetaObject QDeviceDialog::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_QDeviceDialog,
      qt_meta_data_QDeviceDialog, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &QDeviceDialog::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *QDeviceDialog::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *QDeviceDialog::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_QDeviceDialog))
        return static_cast<void*>(const_cast< QDeviceDialog*>(this));
    if (!strcmp(_clname, "QDeviceDialogClass"))
        return static_cast< QDeviceDialogClass*>(const_cast< QDeviceDialog*>(this));
    return QDialog::qt_metacast(_clname);
}

int QDeviceDialog::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: onPortNameChanged((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: onBaudRateChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 2: onParityChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 3: onDataBitsChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 4: onStopBitsChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 5: onQueryModeChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 6: onTimeoutChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
        _id -= 7;
    }
    return _id;
}
QT_END_MOC_NAMESPACE

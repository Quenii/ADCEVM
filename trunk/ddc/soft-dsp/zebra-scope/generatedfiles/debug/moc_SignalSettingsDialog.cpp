/****************************************************************************
** Meta object code from reading C++ file 'SignalSettingsDialog.h'
**
** Created: Mon Jan 10 23:08:24 2011
**      by: The Qt Meta Object Compiler version 61 (Qt 4.5.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../SignalSettingsDialog.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'SignalSettingsDialog.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 61
#error "This file was generated using the moc from 4.5.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_SignalSettingsDialog[] = {

 // content:
       2,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors

       0        // eod
};

static const char qt_meta_stringdata_SignalSettingsDialog[] = {
    "SignalSettingsDialog\0"
};

const QMetaObject SignalSettingsDialog::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_SignalSettingsDialog,
      qt_meta_data_SignalSettingsDialog, 0 }
};

const QMetaObject *SignalSettingsDialog::metaObject() const
{
    return &staticMetaObject;
}

void *SignalSettingsDialog::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_SignalSettingsDialog))
        return static_cast<void*>(const_cast< SignalSettingsDialog*>(this));
    if (!strcmp(_clname, "SignalSettingsDialogClass"))
        return static_cast< SignalSettingsDialogClass*>(const_cast< SignalSettingsDialog*>(this));
    return QDialog::qt_metacast(_clname);
}

int SignalSettingsDialog::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
QT_END_MOC_NAMESPACE

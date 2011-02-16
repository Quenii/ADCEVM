/****************************************************************************
** Meta object code from reading C++ file 'SignalSettingsWidget.h'
**
** Created: Tue Feb 15 21:09:45 2011
**      by: The Qt Meta Object Compiler version 61 (Qt 4.5.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../SignalSettingsWidget.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'SignalSettingsWidget.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 61
#error "This file was generated using the moc from 4.5.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_SignalSettingsWidget[] = {

 // content:
       2,       // revision
       0,       // classname
       0,    0, // classinfo
       3,   12, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors

 // signals: signature, parameters, type, tag, flags
      22,   21,   21,   21, 0x05,

 // slots: signature, parameters, type, tag, flags
      49,   40,   21,   21, 0x0a,
      77,   21,   21,   21, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_SignalSettingsWidget[] = {
    "SignalSettingsWidget\0\0settingsChanged()\0"
    "settings\0setSettings(SignalSettings)\0"
    "on_pushButtonChangeSettings_clicked()\0"
};

const QMetaObject SignalSettingsWidget::staticMetaObject = {
    { &QWidget::staticMetaObject, qt_meta_stringdata_SignalSettingsWidget,
      qt_meta_data_SignalSettingsWidget, 0 }
};

const QMetaObject *SignalSettingsWidget::metaObject() const
{
    return &staticMetaObject;
}

void *SignalSettingsWidget::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_SignalSettingsWidget))
        return static_cast<void*>(const_cast< SignalSettingsWidget*>(this));
    if (!strcmp(_clname, "SignalSettingsWidgetClass"))
        return static_cast< SignalSettingsWidgetClass*>(const_cast< SignalSettingsWidget*>(this));
    return QWidget::qt_metacast(_clname);
}

int SignalSettingsWidget::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QWidget::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: settingsChanged(); break;
        case 1: setSettings((*reinterpret_cast< const SignalSettings(*)>(_a[1]))); break;
        case 2: on_pushButtonChangeSettings_clicked(); break;
        default: ;
        }
        _id -= 3;
    }
    return _id;
}

// SIGNAL 0
void SignalSettingsWidget::settingsChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}
QT_END_MOC_NAMESPACE

/****************************************************************************
** Meta object code from reading C++ file 'AdcBoard.hpp'
**
** Created: Sun Sep 5 00:05:39 2010
**      by: The Qt Meta Object Compiler version 61 (Qt 4.5.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../AdcBoard.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'AdcBoard.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 61
#error "This file was generated using the moc from 4.5.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_AdcBoard[] = {

 // content:
       2,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   12, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors

 // signals: signature, parameters, type, tag, flags
      14,   10,    9,    9, 0x05,
      57,   50,    9,    9, 0x05,

 // slots: signature, parameters, type, tag, flags
      98,   90,   85,    9, 0x0a,
     108,    9,    9,    9, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_AdcBoard[] = {
    "AdcBoard\0\0lst\0devListChanged(QList<AdcBoardInfo>)\0"
    "report\0boardReport(AdcBoardReport)\0"
    "bool\0usbAddr\0open(int)\0devChanged()\0"
};

const QMetaObject AdcBoard::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_AdcBoard,
      qt_meta_data_AdcBoard, 0 }
};

const QMetaObject *AdcBoard::metaObject() const
{
    return &staticMetaObject;
}

void *AdcBoard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_AdcBoard))
        return static_cast<void*>(const_cast< AdcBoard*>(this));
    return QObject::qt_metacast(_clname);
}

int AdcBoard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: devListChanged((*reinterpret_cast< const QList<AdcBoardInfo>(*)>(_a[1]))); break;
        case 1: boardReport((*reinterpret_cast< const AdcBoardReport(*)>(_a[1]))); break;
        case 2: { bool _r = open((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 3: devChanged(); break;
        default: ;
        }
        _id -= 4;
    }
    return _id;
}

// SIGNAL 0
void AdcBoard::devListChanged(const QList<AdcBoardInfo> & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void AdcBoard::boardReport(const AdcBoardReport & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
static const uint qt_meta_data_DummyWidget[] = {

 // content:
       2,       // revision
       0,       // classname
       0,    0, // classinfo
       1,   12, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors

 // signals: signature, parameters, type, tag, flags
      13,   12,   12,   12, 0x05,

       0        // eod
};

static const char qt_meta_stringdata_DummyWidget[] = {
    "DummyWidget\0\0devChanged()\0"
};

const QMetaObject DummyWidget::staticMetaObject = {
    { &QWidget::staticMetaObject, qt_meta_stringdata_DummyWidget,
      qt_meta_data_DummyWidget, 0 }
};

const QMetaObject *DummyWidget::metaObject() const
{
    return &staticMetaObject;
}

void *DummyWidget::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_DummyWidget))
        return static_cast<void*>(const_cast< DummyWidget*>(this));
    return QWidget::qt_metacast(_clname);
}

int DummyWidget::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QWidget::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: devChanged(); break;
        default: ;
        }
        _id -= 1;
    }
    return _id;
}

// SIGNAL 0
void DummyWidget::devChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}
QT_END_MOC_NAMESPACE

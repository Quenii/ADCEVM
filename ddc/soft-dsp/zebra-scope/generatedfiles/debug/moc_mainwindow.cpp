/****************************************************************************
** Meta object code from reading C++ file 'mainwindow.h'
**
** Created: Sat Feb 19 10:25:24 2011
**      by: The Qt Meta Object Compiler version 61 (Qt 4.5.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../mainwindow.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'mainwindow.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 61
#error "This file was generated using the moc from 4.5.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_MainWindow[] = {

 // content:
       2,       // revision
       0,       // classname
       0,    0, // classinfo
      19,   12, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors

 // signals: signature, parameters, type, tag, flags
      17,   12,   11,   11, 0x05,
      45,   12,   11,   11, 0x05,
      76,   12,   11,   11, 0x05,

 // slots: signature, parameters, type, tag, flags
     120,  113,   11,   11, 0x08,
     162,  154,   11,   11, 0x08,
     196,   11,   11,   11, 0x28,
     226,  154,   11,   11, 0x08,
     260,   11,   11,   11, 0x28,
     290,  154,   11,   11, 0x08,
     323,   11,   11,   11, 0x28,
     352,  154,   11,   11, 0x08,
     384,   11,   11,   11, 0x28,
     412,  154,   11,   11, 0x08,
     441,   11,   11,   11, 0x28,
     466,   11,   11,   11, 0x08,
     484,   11,   11,   11, 0x08,
     501,   11,   11,   11, 0x08,
     524,   11,   11,   11, 0x08,
     547,  540,   11,   11, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_MainWindow[] = {
    "MainWindow\0\0data\0settingsLoaded(AdcSettings)\0"
    "settingsLoaded(SignalSettings)\0"
    "adcBoardReportLoaded(AdcBoardReport)\0"
    "action\0on_menuSettings_hovered(QAction*)\0"
    "checked\0on_actionLoadData_triggered(bool)\0"
    "on_actionLoadData_triggered()\0"
    "on_actionSaveData_triggered(bool)\0"
    "on_actionSaveData_triggered()\0"
    "on_actionSpiCtrl_triggered(bool)\0"
    "on_actionSpiCtrl_triggered()\0"
    "on_actionSpectrum_toggled(bool)\0"
    "on_actionSpectrum_toggled()\0"
    "on_actionLogic_toggled(bool)\0"
    "on_actionLogic_toggled()\0slotShowWaveWnd()\0"
    "slotShowFFtWnd()\0slotShowControlPanel()\0"
    "slotShowAbout()\0report\0"
    "slotShowBoardReport(AdcBoardReport)\0"
};

const QMetaObject MainWindow::staticMetaObject = {
    { &QMainWindow::staticMetaObject, qt_meta_stringdata_MainWindow,
      qt_meta_data_MainWindow, 0 }
};

const QMetaObject *MainWindow::metaObject() const
{
    return &staticMetaObject;
}

void *MainWindow::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_MainWindow))
        return static_cast<void*>(const_cast< MainWindow*>(this));
    return QMainWindow::qt_metacast(_clname);
}

int MainWindow::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMainWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: settingsLoaded((*reinterpret_cast< const AdcSettings(*)>(_a[1]))); break;
        case 1: settingsLoaded((*reinterpret_cast< const SignalSettings(*)>(_a[1]))); break;
        case 2: adcBoardReportLoaded((*reinterpret_cast< const AdcBoardReport(*)>(_a[1]))); break;
        case 3: on_menuSettings_hovered((*reinterpret_cast< QAction*(*)>(_a[1]))); break;
        case 4: on_actionLoadData_triggered((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 5: on_actionLoadData_triggered(); break;
        case 6: on_actionSaveData_triggered((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 7: on_actionSaveData_triggered(); break;
        case 8: on_actionSpiCtrl_triggered((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 9: on_actionSpiCtrl_triggered(); break;
        case 10: on_actionSpectrum_toggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 11: on_actionSpectrum_toggled(); break;
        case 12: on_actionLogic_toggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 13: on_actionLogic_toggled(); break;
        case 14: slotShowWaveWnd(); break;
        case 15: slotShowFFtWnd(); break;
        case 16: slotShowControlPanel(); break;
        case 17: slotShowAbout(); break;
        case 18: slotShowBoardReport((*reinterpret_cast< const AdcBoardReport(*)>(_a[1]))); break;
        default: ;
        }
        _id -= 19;
    }
    return _id;
}

// SIGNAL 0
void MainWindow::settingsLoaded(const AdcSettings & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void MainWindow::settingsLoaded(const SignalSettings & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void MainWindow::adcBoardReportLoaded(const AdcBoardReport & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}
QT_END_MOC_NAMESPACE

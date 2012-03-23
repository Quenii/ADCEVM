#include <QApplication>
#include "maindialog.h"
#include "SerialTypes.hpp"

#define REGISTER_METATYPE_HELPER( type ) \
    qRegisterMetaType<type>(); \
    qRegisterMetaType<type>(#type); \
    qRegisterMetaTypeStreamOperators<type>(#type)

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    REGISTER_METATYPE_HELPER(SerialPortInfo);

    MainDialog w;
    w.show();

    return a.exec();
}

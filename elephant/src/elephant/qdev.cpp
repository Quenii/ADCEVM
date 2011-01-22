#include "qdev.h"

#include "gkhy/PcieDab2/PcieDabEmulator.h"

using namespace gkhy::PcieDab2;

QDev::QDev(QObject* parent /* = 0 */)
: QObject(parent)
, m_pcieDab(new PcieDabEmulator)
, m_emulator(true)
{

}

QDev::~QDev()
{

}

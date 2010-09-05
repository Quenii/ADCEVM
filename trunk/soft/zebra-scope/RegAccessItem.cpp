#include "RegAccessItem.h"

RegAccessItem::RegAccessItem(QWidget *parent)
	: QWidget(parent),
	m_bShowArrow(false)
{
	setupUi(this);	

	showArrow(false);
	
}

RegAccessItem::~RegAccessItem()
{

}

void RegAccessItem::showArrow(bool on /*= true*/)
{
	pushButtonArrowOff->setVisible(!on);
	pushButtonArrowOn->setVisible(on);

	m_bShowArrow = on;
}

bool RegAccessItem::arrowShown()
{
	return m_bShowArrow;
}

void RegAccessItem::setUiData(const RegAccessItemData& data)
{
	checkBox->setChecked(data.checked);
	cbOperation->setCurrentIndex(data.operation);
	lineEditAddr->setText(QString("%1").arg(data.addr, 8, 16, QChar('0')));
	lineEditValue->setText(QString("%1").arg(data.value, 8, 16, QChar('0')));
}

void RegAccessItem::UiData(RegAccessItemData& data)
{
	data.checked = checkBox->isChecked();
	data.operation = cbOperation->currentIndex();
	data.addr = QString("0x%1").arg(lineEditAddr->text()).toUInt();
	data.value = QString("0x%1").arg(lineEditValue->text()).toUInt();
}
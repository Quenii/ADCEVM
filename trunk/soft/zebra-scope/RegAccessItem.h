#ifndef REGACCESSITEM_H
#define REGACCESSITEM_H

#include "ui_RegAccessItem.h"
#include <QWidget>


class RegAccessItem : public QWidget, public Ui::RegAccessItemClass
{
	Q_OBJECT

public:
	RegAccessItem(QWidget *parent);
	~RegAccessItem();

private:
	
};

#endif // REGACCESSITEM_H

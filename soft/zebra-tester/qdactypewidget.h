#ifndef QDACTYPEWIDGET_H
#define QDACTYPEWIDGET_H

#include <QWidget>
#include "ui_qdactypewidget.h"

class QDacTypeWidget : public QWidget
{
	Q_OBJECT

public:
	QDacTypeWidget(QWidget *parent = 0);
	~QDacTypeWidget();

private:
	Ui::QDacTypeWidgetClass ui;
};

#endif // QDACTYPEWIDGET_H

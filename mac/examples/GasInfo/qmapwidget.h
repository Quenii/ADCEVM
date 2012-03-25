#ifndef QMAPWIDGET_H
#define QMAPWIDGET_H

#include <QWidget>

namespace Ui {
    class QMapWidget;
}

class QMapWidget : public QWidget
{
    Q_OBJECT

public:
    explicit QMapWidget(QWidget *parent = 0);
    ~QMapWidget();

private:
    Ui::QMapWidget *ui;
};

#endif // QMAPWIDGET_H

#ifndef COMMWIDGET_H
#define COMMWIDGET_H

#include <QWidget>

namespace Ui {
    class CommWidget;
}

class CommWidget : public QWidget
{
    Q_OBJECT

public:
    explicit CommWidget(QWidget *parent = 0);
    ~CommWidget();

private:
    Ui::CommWidget *ui;
};

#endif // COMMWIDGET_H

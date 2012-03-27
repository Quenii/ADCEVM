#ifndef TERMINALWIDGET_H
#define TERMINALWIDGET_H

#include "centralmodel.h"

#include <QWidget>

namespace Ui {
class TerminalWidget;
}

class TerminalWidget : public QWidget
{
    Q_OBJECT
    
public:
    explicit TerminalWidget(QWidget *parent = 0);
    ~TerminalWidget();

public:
    void setModel(CentralModel* model);

private:
    Ui::TerminalWidget *ui;
};

#endif // TERMINALWIDGET_H

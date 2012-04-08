#ifndef TERMINALWIDGET_H
#define TERMINALWIDGET_H

#include "centralmodel.h"

#include <QWidget>

namespace Ui {
class TerminalWidget;
}

class QSortFilterProxyModel;

class TerminalWidget : public QWidget
{
    Q_OBJECT
    
public:
    explicit TerminalWidget(QWidget *parent = 0);
    ~TerminalWidget();

public:
    void setModel(CentralModel* model, int row);

private slots:
    void tableView_sortIndicatorChanged(int logicalIndex, Qt::SortOrder order);

private:
    Ui::TerminalWidget *ui;
    QSortFilterProxyModel* m_proxyModel;
};

#endif // TERMINALWIDGET_H

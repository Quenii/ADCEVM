#ifndef TERMINALALARMWIDGET_H
#define TERMINALALARMWIDGET_H

#include <QWidget>

namespace Ui {
class TerminalAlarmWidget;
}

class QAbstractButton;


class TerminalAlarmWidget : public QWidget
{
    Q_OBJECT
    
public:
    explicit TerminalAlarmWidget(const QString& title, const QString& msg, int id, QWidget *parent);
    ~TerminalAlarmWidget();

public:
    void setText(const QString& text);

private slots:
    void on_pushButtonYes_clicked();
    void on_pushButtonNo_clicked();

private:
    Ui::TerminalAlarmWidget *ui;
    int m_id;
};

#endif // TERMINALALARMWIDGET_H

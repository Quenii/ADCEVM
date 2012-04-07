#ifndef MARKERDIALOG_H
#define MARKERDIALOG_H

#include <QWidget>

namespace Ui {
class MarkerDialogWidget;
}

class QAbstractButton;


class MarkerDialogWidget : public QWidget
{
    Q_OBJECT
    
public:
    explicit MarkerDialogWidget(const QString& title, const QString& msg, int id, QWidget *parent);
    ~MarkerDialogWidget();

public:
    void setText(const QString& text);

private slots:
    void on_pushButtonYes_clicked();
    void on_pushButtonNo_clicked();

private:
    Ui::MarkerDialogWidget *ui;
    int m_id;
};

#endif // MARKERDIALOG_H

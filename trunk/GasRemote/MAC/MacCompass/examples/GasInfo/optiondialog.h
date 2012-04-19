#ifndef OPTIONDIALOG_H
#define OPTIONDIALOG_H

#include <QDialog>

namespace Ui {
class OptionDialog;
}

class QAbstractButton;

class OptionDialog : public QDialog
{
    Q_OBJECT
    
public:
    explicit OptionDialog(QWidget *parent = 0);
    ~OptionDialog();

private:
    void takeOptions();
    void giveOptions();

signals:
    void optionsApplied();

private slots:
    void opeitonsAccepted();
    void on_broswePushButton_clicked();
    void on_buttonBox_clicked(QAbstractButton * button);

private:
    Ui::OptionDialog *ui;
};

#endif // OPTIONDIALOG_H

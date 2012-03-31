#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QCloseEvent>


namespace Ui {
    class MainWindow;
}

class QModelIndex;
class CentralModel;

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

public:


protected:
    void closeEvent(QCloseEvent *event);
private:
    void saveSettings();
    void readSettings();

private slots:
    void openTerminalWidget(const QModelIndex& idx);


private:
    Ui::MainWindow *ui;
    CentralModel* m_centralModel;
};

#endif // MAINWINDOW_H

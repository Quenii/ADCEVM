#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QCloseEvent>
#include <QModelIndexList>


namespace Ui {
    class MainWindow;
}

class QModelIndex;
class CentralModel;
class QMdiSubWindow;

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
    QMdiSubWindow* terminalSubwindow(int terminalId);

private slots:  
    void openCloseTerminals(const QList<int>& idList, bool open);
    void deleteTerminals(const QList<int>& idList);

private:
    Ui::MainWindow *ui;
    CentralModel* m_centralModel;
};

#endif // MAINWINDOW_H

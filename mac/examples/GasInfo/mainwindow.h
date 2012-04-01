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

    void on_actionSave_triggered(bool checked = false);
    void on_actionSaveAs_triggered(bool checked = false);
    void on_actionLoad_triggered(bool checked = false);
    void on_actionOption_triggered(bool checked = false);

    //void on_actionExport_triggered(bool checked = false);
    void on_actionExit_triggered(bool checked = false);

private:
    Ui::MainWindow *ui;
    CentralModel* m_centralModel;
};

#endif // MAINWINDOW_H

#include "mainwindow.h"
#include "statictestwindow.h"
#include "dynamictestwindow.h"
#include "qmdisubwindowex.h"

#include <QPushButton>
#include <QList>

MainWindow::MainWindow(QWidget *parent)
	: QMainWindow(parent)
{
	ui.setupUi(this);

	addMdiWindow(new StaticTestWindow(this), 0);
	addMdiWindow(new DynamicTestWindow(this), 0);
}

MainWindow::~MainWindow()
{

}

void MainWindow::addMdiWindow(QWidget* widget, QPushButton* btn)
{
	QMdiSubWindowEx* subWindow = new QMdiSubWindowEx(this, Qt::MSWindowsFixedSizeDialogHint); 
	subWindow->setWidget(widget);
	ui.mdiArea->addSubWindow(subWindow);
	ui.menuWindow->addAction(subWindow->toggleViewAction());

	if (btn)
	{
		bool ok = connect(btn, SIGNAL(clicked()),
			subWindow->toggleViewAction(), SLOT(toggle()));
		Q_ASSERT(ok);
	}
}
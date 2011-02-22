#include "mainwindow.h"
#include "statictestwindow.h"
#include "dynamictestwindow.h"
#include "qmdisubwindowex.h"

#include <QPushButton>
#include <QList>
#include <QPointer>

class QActionUnckecker : public QObject
{
	Q_OBJECT

public:
	QActionUnckecker(QAction* action)
	{
		d_action = action;
	}
public slots:
	void uncheck(bool b)
	{
		if (d_action && b)
		{
			d_action->setChecked(!b);
		}
	}

private:
	QPointer<QAction> d_action;
};

#include "mainwindow.moc"

MainWindow::MainWindow(QWidget *parent)
	: QMainWindow(parent)
{
	ui.setupUi(this);

	QMdiSubWindowEx* a = addMdiWindow(new StaticTestWindow(0), 0);
	QMdiSubWindowEx* b = addMdiWindow(new DynamicTestWindow(0), 0);
	a->adjustSize();
	b->adjustSize();
	
	QActionUnckecker* _a = new QActionUnckecker(a->toggleViewAction());
	QActionUnckecker* _b = new QActionUnckecker(b->toggleViewAction());

	bool ok = connect(a->toggleViewAction(), SIGNAL(toggled(bool)), _b, SLOT(uncheck(bool)));
	Q_ASSERT(ok);

	ok = connect(b->toggleViewAction(), SIGNAL(toggled(bool)), _a, SLOT(uncheck(bool)));
	Q_ASSERT(ok);
}

MainWindow::~MainWindow()
{

}

QMdiSubWindowEx* MainWindow::addMdiWindow(QWidget* widget, QPushButton* btn)
{
	QMdiSubWindowEx* subWindow = new QMdiSubWindowEx(this, Qt::MSWindowsFixedSizeDialogHint); 
	subWindow->setWidget(widget);
	ui.mdiArea->addSubWindow(subWindow);
	ui.menuWindow->addAction(subWindow->toggleViewAction());
	ui.toolBar->addAction(subWindow->toggleViewAction());

	if (btn)
	{
		bool ok = connect(btn, SIGNAL(clicked()),
			subWindow->toggleViewAction(), SLOT(toggle()));
		Q_ASSERT(ok);
	}

	return subWindow;
}
#include "statictestwindow.h"

#pragma comment(lib, "qwt.lib")

StaticTestWindow::StaticTestWindow(QWidget *parent)
	: QWidget(parent)
{
	ui.setupUi(this);
}

StaticTestWindow::~StaticTestWindow()
{

}

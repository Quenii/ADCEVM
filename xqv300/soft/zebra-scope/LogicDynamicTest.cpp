#include "LogicDynamicTest.h"

#include <QFileDialog>

LogicDynamicTest::LogicDynamicTest(QWidget *parent)
	: QDialog(parent)
{
	setupUi(this);
	
//	codingComboBox->addItems(QStringList() << tr("Offset") << tr("Complement") << tr("Gray"));

}

LogicDynamicTest::~LogicDynamicTest()
{

}

void LogicDynamicTest::on_pushButton_clicked()
{
	QString fileName = QFileDialog::getOpenFileName(this, tr("Bit file"),
		"./",
		tr("Bit Stream (*.bit)"));
	bitFileName->setText(fileName);
}


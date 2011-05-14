#include "LogicPercentsTest.h"

#include <QFileDialog>

LogicPercentsTest::LogicPercentsTest(QWidget *parent)
	: QDialog(parent)
{
	setupUi(this);
	
//	codingComboBox->addItems(QStringList() << tr("Offset") << tr("Complement") << tr("Gray"));

}

LogicPercentsTest::~LogicPercentsTest()
{

}

void LogicPercentsTest::on_pushButton_1_clicked()
{
	QString fileName = QFileDialog::getOpenFileName(this, tr("Bit file"),
		"./",
		tr("Bit Stream (*.bit)"));
	bitFileName1->setText(fileName);
}

void LogicPercentsTest::on_pushButton_3_clicked()
{
	QString fileName = QFileDialog::getOpenFileName(this, tr("Bit file"),
		"./",
		tr("Bit Stream (*.bit)"));
	bitFileName3->setText(fileName);

}

void LogicPercentsTest::on_pushButton_5_clicked()
{
	QString fileName = QFileDialog::getOpenFileName(this, tr("Bit file"),
		"./",
		tr("Bit Stream (*.bit)"));
	bitFileName5->setText(fileName);

}

void LogicPercentsTest::on_pushButton_7_clicked()
{
	QString fileName = QFileDialog::getOpenFileName(this, tr("Bit file"),
		"./",
		tr("Bit Stream (*.bit)"));
	bitFileName7->setText(fileName);

}

void LogicPercentsTest::on_pushButton_9_clicked()
{
	QString fileName = QFileDialog::getOpenFileName(this, tr("Bit file"),
		"./",
		tr("Bit Stream (*.bit)"));
	bitFileName9->setText(fileName);

}

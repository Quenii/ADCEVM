#include "qdactypedialog.h"
#include "dacanalyzersettings.h"

QDacTypeDialog::QDacTypeDialog(QWidget *parent)
	: QDialog(parent)
{
	ui.setupUi(this);

	DacAnalyzerSettings settings;
	setSettings(settings.dacTypeSettings());
}

QDacTypeDialog::~QDacTypeDialog()
{

}

void QDacTypeDialog::accept()
{

}

void QDacTypeDialog::setSettings(const DacTypeSettings& val)
{

}

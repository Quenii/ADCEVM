#include "qdactypedialog.h"
#include "dacanalyzersettings.h"
bool DacTypeSettings::_inited = false;

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

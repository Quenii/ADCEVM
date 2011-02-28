#include "qdactypedialog.h"
#include "dacanalyzersettings.h"
#include "CustomTypeHandler.h"

static void registerMetaType()
{
	qRegisterMetaType<DacTypeSettings>();
	qRegisterMetaType<DacTypeSettings>("DacTypeSettings");
	qRegisterMetaTypeStreamOperators<DacTypeSettings>("DacTypeSettings");
}

static CustomTypeHandler _inst(registerMetaType);

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

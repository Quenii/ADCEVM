#include "optiondialog.h"
#include "ui_optiondialog.h"
#include "gasinfosettings.h"

#include <QFileDialog>

OptionDialog::OptionDialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::OptionDialog)
{
    GasInfoSettings settings;

    ui->setupUi(this);

    ui->dataFolderLineEdit->setText(settings.dataFolder());

    bool ok = connect(this, SIGNAL(accepted()), this, SLOT(on_accepted()));
    Q_ASSERT(ok);
}

OptionDialog::~OptionDialog()
{
    delete ui;
}

void OptionDialog::on_accepted()
{
    GasInfoSettings settings;

    settings.setdataFolder(ui->dataFolderLineEdit->text());
}

void OptionDialog::on_broswePushButton_clicked()
{
    QString fileName = QFileDialog::getExistingDirectory(
                this,
                tr("Select Data Folder"),
                ui->dataFolderLineEdit->text()
                );

    if (!fileName.isEmpty())
        ui->dataFolderLineEdit->setText(fileName);
}

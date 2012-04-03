#include "optiondialog.h"
#include "ui_optiondialog.h"
#include "gasinfosettings.h"

#include <QFileDialog>
#include <QDateTime>
#include <QTime>
#include <QtDebug>


OptionDialog::OptionDialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::OptionDialog)
{
    GasInfoSettings settings;

    ui->setupUi(this);

    ui->dataFolderLineEdit->setText(settings.dataFolder());

    int seconds = settings.archivePeriod();
    const int daySecs = 24 * 60 * 60;
    int days = seconds / daySecs;

    QTime time = QTime(0, 0, 0).addSecs(seconds % daySecs);
    qDebug() << " Seconds "<< seconds % daySecs;

    ui->daySpinBox->setValue(days);
    ui->hoursSpinBox->setValue(time.hour());
    ui->minutesSpinBox->setValue(time.minute());


    int interval = settings.activeInterval();
    ui->activeIntervalMinutesSpinBox->setValue(interval / 60);
    ui->activeIntervalSecondsSpinBox->setValue(interval % 60);

    QGeoCoordinate hostLocation = settings.defaultHostLocation();

    QString hostLatitudeStr = QString::number(hostLocation.latitude(),'f');
    QString hostLongitudeStr = QString::number(hostLocation.longitude(), 'f');

    ui->defaultHostLatitudeLineEdit->setText(hostLatitudeStr);
    ui->defaultHostLongitudeLineEdit->setText(hostLongitudeStr);


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

    int days = ui->daySpinBox->value();
    int hours = ui->hoursSpinBox->value();
    int minutes = ui->minutesSpinBox->value();

    int totalMinutes = (days * 24 + hours) * 60 + minutes;
    totalMinutes = qMax(totalMinutes, 1);

    settings.setArchivePeriod(totalMinutes * 60);

    int activeMinutes = ui->activeIntervalMinutesSpinBox->value();
    int activeSeconds = ui->activeIntervalSecondsSpinBox->value();
    int activeTotalSeconds = activeMinutes * 60 + activeSeconds;
    activeTotalSeconds = qMax(activeTotalSeconds, 1);
    settings.setActiveInternal(activeTotalSeconds);


    QString hostLatitudeStr = ui->defaultHostLatitudeLineEdit->text();
    QString hostLongitudeStr = ui->defaultHostLongitudeLineEdit->text();

    double hostLatitude = hostLatitudeStr.toDouble();
    double hostLongitude = hostLongitudeStr.toDouble();

    settings.setDefaultHostLocation(QGeoCoordinate(hostLatitude, hostLongitude));

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

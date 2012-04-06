#include "terminalalarmwidget.h"
#include "ui_terminalalarmwidget.h"
#include "gasinfosettings.h"

#include <QTimer>
#include <QTime>
#include <QtDebug>
#include <QAbstractButton>
#include <QApplication>
#include <QObject>


TerminalAlarmWidget::TerminalAlarmWidget(const QString& title, const QString& msg, int id, QWidget *parent):
    QWidget(parent),
    ui(new Ui::TerminalAlarmWidget),
    m_id(id)
{
    ui->setupUi(this);

    setWindowTitle(title);
    setText(msg);
    setAttribute(Qt::WA_DeleteOnClose, false);

    GasInfoSettings::setTerminalAlermWindowOpen(m_id, true);

    setWindowFlags(Qt::WindowStaysOnTopHint | Qt::X11BypassWindowManagerHint);
}

TerminalAlarmWidget::~TerminalAlarmWidget()
{
    delete ui;
    GasInfoSettings::setTerminalAlermWindowOpen(m_id, false);

    qDebug() << QString("TerminalAlarmWidget %1 deletes itself at %2.")
                .arg(m_id).arg(QTime::currentTime().toString());
}

void TerminalAlarmWidget::setText(const QString &text)
{
    ui->label->setText(text);
}

void TerminalAlarmWidget::on_pushButtonYes_clicked()
{
    int muteSec = GasInfoSettings::terminalAlarmMuteTimeF();
    QTimer::singleShot(muteSec * 1000, this, SLOT(deleteLater()));
    hide();

    qDebug() << QString("TerminalAlarmWidget %1 starts to mute for %2 seconds at %3.")
                .arg(m_id).arg(muteSec).arg(QTime::currentTime().toString());
}

void TerminalAlarmWidget::on_pushButtonNo_clicked()
{
    deleteLater();
}

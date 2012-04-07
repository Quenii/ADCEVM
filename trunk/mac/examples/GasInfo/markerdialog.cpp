#include "markerdialog.h"
#include "ui_markerdialog.h"
#include "gasinfosettings.h"
#include "qtermdatahandler.h"

#include <QTimer>
#include <QTime>
#include <QtDebug>
#include <QAbstractButton>
#include <QApplication>
#include <QObject>


MarkerDialogWidget::MarkerDialogWidget(const QString& title, const QString& msg, int id, QWidget *parent):
    QWidget(parent),
    ui(new Ui::MarkerDialogWidget),
    m_id(id)
{
    ui->setupUi(this);

    setWindowTitle(title);
    setText(msg);
    setAttribute(Qt::WA_DeleteOnClose, false);

    setWindowFlags(Qt::WindowStaysOnTopHint | Qt::X11BypassWindowManagerHint);
}

MarkerDialogWidget::~MarkerDialogWidget()
{
    qDebug("MarkerDialog() destructed");
    delete ui;
}

void MarkerDialogWidget::setText(const QString &text)
{
    ui->label->setText(text);
}

void MarkerDialogWidget::on_pushButtonYes_clicked()
{
    deleteLater();
}

void MarkerDialogWidget::on_pushButtonNo_clicked()
{
    deleteLater();
}

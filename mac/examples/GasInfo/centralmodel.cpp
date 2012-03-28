#include "centralmodel.h"


#include <QDateTime>
#include <QStandardItem>
#include <QList>
#include <QtDebug>

CentralModel::CentralModel(QObject *parent) :
    QStandardItemModel(parent)
{
    setHorizontalHeaderItem( 0, new QStandardItem( "Terminal" ));
    setHorizontalHeaderItem( 1, new QStandardItem( "Status"));
    setHorizontalHeaderItem( 2, new QStandardItem( "Date & Time"));
    setHorizontalHeaderItem( 3, new QStandardItem( "FEL"));
    setHorizontalHeaderItem( 4, new QStandardItem( "H2S"));
    setHorizontalHeaderItem( 5, new QStandardItem( "SO2"));

    for (int i = 0; i < 10; ++i)
    {
        GasInfoItem info;
        info.ch = i;
        info.fel = 10;
        info.h2s = 20;
        info.so2 = 30;
        addData(info);
    }

    removeTerminal(0);

}


QModelIndex CentralModel::terminal(int id, bool createNew)
{
    if (rowCount() > 0)
    {
        QModelIndexList indexes = match(index(0, 0), Qt::UserRole, id);
        if (indexes.count() > 0)
            return indexes.at(0);
    }

    if (createNew)
    {
        QList<QStandardItem*> lst;
        lst << new QStandardItem(QString("%1").arg(id))
            << new QStandardItem();
        insertRow(0, lst);

        QModelIndex idx = index(0, 0);
        setData(idx, id, Qt::UserRole);
        return idx;
    }

    return QModelIndex();
}

void CentralModel::removeTerminal(int id)
{
    QModelIndex idx = terminal(id, false);

    if (idx.isValid())
        removeRow(idx.row());
}

void CentralModel::addData(const GasInfoItem& item)
{
    QModelIndex idx = terminal(item.ch, true);
    QStandardItem* itm = itemFromIndex(idx);

    //    QStandardItem* child = new QStandardItem(1, 4);
    //    child->setChild(0, 0, new QStandardItem(QString("%1").arg(QDateTime::currentDateTime().toString())));
    //    child->setChild(0, 1, new QStandardItem(QString("%1").arg(item.fel)));
    //    child->setChild(0, 2, new QStandardItem(QString("%1").arg(item.h2s)));
    //    child->setChild(0, 3, new QStandardItem(QString("%1").arg(item.so2)));

    //    itm->insertRow(0, child);

    //    child->setChild(0, 0, new QStandardItem(QString("%1").arg(QDateTime::currentDateTime().toString())));
    //    child->setChild(0, 1, new QStandardItem(QString("%1").arg(item.fel)));
    //    child->setChild(0, 2, new QStandardItem(QString("%1").arg(item.h2s)));
    //    child->setChild(0, 3, new QStandardItem(QString("%1").arg(item.so2)));

    QList<QStandardItem*> lst;
    lst << new QStandardItem
        << new QStandardItem
        << new QStandardItem(QString("%1").arg(QDateTime::currentDateTime().toString()))
        << new QStandardItem(QString("%1").arg(item.fel))
        << new QStandardItem(QString("%1").arg(item.h2s))
        << new QStandardItem(QString("%1").arg(item.so2));

    itm->insertRow(0, lst);
}


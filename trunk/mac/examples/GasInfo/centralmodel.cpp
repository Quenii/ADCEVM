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
}

//int CentralModel::terminalId(const QModelIndex& idx)
//{
//    QStandardItem* item0 = item(idx.row(), 0);

//    return item0->data(Qt::UserRole).toInt();
//}

int CentralModel::terminalId(int row)
{

    QStandardItem* item0 = item(row, 0);
    if (item0)
        return item0->data(Qt::UserRole).toInt();
    else
        return 0;
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

    QList<QStandardItem*> lst;
    lst << 0
        << 0 // new QStandardItem
        << new QStandardItem(QString("%1").arg(QDateTime::currentDateTime().toString()))
        << new QStandardItem(QString("%1").arg(item.fel))
        << new QStandardItem(QString("%1").arg(item.h2s))
        << new QStandardItem(QString("%1").arg(item.so2));

    itm->insertRow(0, lst);
}


bool CentralModel::save(QString filePath)
{
    QFile file(filePath);
    bool ok = file.open(QIODevice::WriteOnly | QIODevice::Truncate );
    if (!ok)
        return false;

    QDataStream out(&file);   // we will serialize the data into the file
    out << int(rowCount())
        << int(columnCount());

    for (int i = 0; i < columnCount(); ++i)
    {
        QStandardItem* itm = horizontalHeaderItem(i);
        if (itm)
        {
            out << int(1);
            horizontalHeaderItem(i)->write(out);
        }
        else
            out << int(0);
    }

    for (int i = 0; i < rowCount(); ++i)
    {
        for (int j = 0; j < columnCount(); ++j)
        {
            QStandardItem* itm = item(i, j);
            if (itm)
            {
                out << int(1);
                itm->write(out);
            }
            else
            {
                out << int(0);
            }
        }
    }

    return true;
}

bool CentralModel::load(QString filePath)
{
    QFile file(filePath);
    bool ok = file.open(QIODevice::ReadOnly);
    if (!ok)
        return false;

    QDataStream in(&file);    // read the data serialized from the file

    clear();

    int row = 0;
    int col = 0;
    in >> row
       >> col;

    setRowCount(row);
    setColumnCount(col);

    for (int i = 0; i < columnCount(); ++i)
    {
        int exist = 0;
        in >> exist;
        if (exist)
        {
            QStandardItem* itm = new QStandardItem();
            itm->read(in);
            setHorizontalHeaderItem(i, itm);
        }
    }

    for (int i = 0; i < rowCount(); ++i)
    {
        for (int j = 0; j < columnCount(); ++j)
        {
            int exist = 0;
            in >> exist;
            if (exist)
            {
                QStandardItem* itm = new QStandardItem();
                itm->read(in);
                setItem(i,j, itm);
            }
        }
    }

    return true;
}

bool CentralModel::exportTerminal(QString filePath, int terminalId, const QList<int>& columns)
{
    QFile file(filePath);
    bool ok = file.open(QIODevice::WriteOnly | QIODevice::Truncate | QIODevice::Text );
    if (!ok)
        return false;

    QDataStream out(&file);   // we will serialize the data into the file

    QModelIndex index = terminal(terminalId, false);
    if (!index.isValid())
        return false;

    // export header
    QString str;
    foreach (int col, columns)
    {
        QStandardItem* itm = horizontalHeaderItem(col);
        str += (itm ? itm->text() : " ");
        str += ";";

    }
    out << str;

    // export data

    QStandardItem* root = itemFromIndex(index);
    if (root->hasChildren())
    {
        for (int row = 0; row < root->rowCount(); ++row)
        {
            QString str;
            foreach (int col, columns)
            {
                QStandardItem* itm = root->child(row, col);
                str += (itm ? itm->text() : " ");
                str += ";";
            }
            out << str;

            qDebug() << row << ": " << str;
        }
    }

    return true;
}


#include "centralmodel.h"

#include <QDateTime>
#include <QStandardItem>
#include <QList>
#include <QtDebug>
#include <QDir>
#include <QFileInfo>

static void writeItem(const QStandardItem* item, QDataStream& out)
{
    out << int(item != 0);

    if (item)
    {
        item->write(out);

        out << int(item->hasChildren());

        if (item->hasChildren())
        {
            out << int(item->rowCount()) << int(item->columnCount());
            for (int row = 0; row < item->rowCount(); ++row)
                for (int col = 0; col < item->columnCount(); ++col)
                {
                    QStandardItem* child = item->child(row, col);
                    out << int(child != 0);
                    if(child)
                    {
                        child->write(out);
                    }
                }
        }
    }
}

static QStandardItem* readItem(QDataStream& in)
{
    int itemExist = 0;
    in >> itemExist;

    if (!itemExist)
        return 0;

    QStandardItem* item = new QStandardItem();
    item->read(in);

    int hasChildren = 0;
    in >> hasChildren;

    if (hasChildren)
    {
        int rowCount = 0;
        int colCount = 0;
        in >> rowCount >> colCount;
        Q_ASSERT(rowCount);
        Q_ASSERT(colCount);
        item->setRowCount(rowCount);
        item->setColumnCount(colCount);

        for (int row = 0; row < rowCount; ++row)
            for (int col = 0; col < colCount; ++col)
            {
                int childExist = 0;
                in >> childExist;
                if(childExist)
                {
                    QStandardItem* child = new QStandardItem();
                    child->read(in);
                    item->setChild(row, col, child);
                }
            }
    }
    return item;
}

static void makeDir(QString filePath)
{
    QDir dir = QFileInfo(filePath).dir();
    if (!dir.exists())
        QDir().mkpath(dir.path());
}

CentralModel::CentralModel(QObject *parent) :
    QStandardItemModel(parent)
{

    setHorizontalHeaderItem( 0, new QStandardItem( "Terminal" ));
    setHorizontalHeaderItem( 1, new QStandardItem( "Status"));
    setHorizontalHeaderItem( 2, new QStandardItem( "Date & Time"));
    setHorizontalHeaderItem( 3, new QStandardItem( "FEL/ppm"));
    setHorizontalHeaderItem( 4, new QStandardItem( "H2S/ppm"));
    setHorizontalHeaderItem( 5, new QStandardItem( "SO2/%"));

    for (int i = 0; i < 10; ++i)
    {
        GasInfoItem info;
        info.ch = i;

        for (int j = 0; j < 10; ++j)
        {
            info.fel = j;
            info.h2s = 10 - j;
            info.so2 = i;
            addData(info);
         }
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

    QDateTime now = QDateTime::currentDateTime();
    QStandardItem* item3 = new QStandardItem(QString("%1").arg(now.toString()));
    item3->setData(now, Qt::UserRole);

    QStandardItem* item4 = new QStandardItem(QString("%1").arg(item.fel));
    item4->setData(item.fel, Qt::UserRole);

    QStandardItem* item5 = new QStandardItem(QString("%1").arg(item.h2s));
    item5->setData(item.h2s, Qt::UserRole);

    QStandardItem* item6 = new QStandardItem(QString("%1").arg(item.so2));
    item6->setData(item.so2, Qt::UserRole);

    QList<QStandardItem*> lst;
    lst << 0
        << 0 // new QStandardItem
        << item3
        << item4
        << item5
        << item6;

    itm->insertRow(0, lst);
}


bool CentralModel::save(QString filePath)
{
    makeDir(filePath);

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
        out << int(itm != 0);
        if (itm)
        {
            horizontalHeaderItem(i)->write(out);
        }
    }

    for (int i = 0; i < rowCount(); ++i)
    {
        for (int j = 0; j < columnCount(); ++j)
        {
            writeItem(item(i, j), out);
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
            QStandardItem* item = readItem(in);
            if (item)
            {
                setItem(i,j, item);
            }
        }
    }

    return true;
}

bool CentralModel::exportTerminal(QString filePath, int terminalId, const QList<int>& columns)
{
    makeDir(filePath);

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


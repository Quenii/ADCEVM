#include "centralmodel.h"
#include "gasinfosettings.h"

#include <QDateTime>
#include <QStandardItem>
#include <QList>
#include <QtDebug>
#include <QDir>
#include <QFileInfo>

class ReceiveSessionData : public QObject
{
public:
    ReceiveSessionData(QObject* parent) : QObject(parent)
    {
        started = false;
    }

    bool started;
    QDateTime startTime;
    QDateTime lastHit;
};

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
    QStandardItemModel(parent),
    m_receiveSessionData(new ReceiveSessionData(parent))
{
//    setHorizontalHeaderItem( 0, new QStandardItem( "Terminal" ));
//    setHorizontalHeaderItem( 1, new QStandardItem( "Status" ));
//    setHorizontalHeaderItem( 2, new QStandardItem( "Date/Time" ));
//    setHorizontalHeaderItem( 0, new QStandardItem( QString::fromLocal8Bit("终端") ));
//    setHorizontalHeaderItem( 1, new QStandardItem( QString::fromLocal8Bit("状态") ));
//    setHorizontalHeaderItem( 2, new QStandardItem( QString::fromLocal8Bit("日期 / 时间") ));
//    setHorizontalHeaderItem( 3, new QStandardItem( "FEL/%"));
//    setHorizontalHeaderItem( 4, new QStandardItem( "H2S/ppm"));
//    setHorizontalHeaderItem( 5, new QStandardItem( "SO2/ppm"));

}

void CentralModel::beginReceiveSession()
{
    m_timerId = startTimer(1000); // per second
    m_receiveSessionData->started = true;
    m_receiveSessionData->startTime = QDateTime::currentDateTime();
    m_receiveSessionData->lastHit = QDateTime::currentDateTime();
    clear();
}

void CentralModel::endReceiveSession(bool bSave, const QString& filePath)
{
    if (bSave)
        save(filePath);

    m_receiveSessionData->started = false;

    if (m_timerId)
    {
        killTimer(m_timerId);
        m_timerId = 0;
    }
}

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
    for (int i = 0; i < rowCount(); ++i)
    {
        if (item(i, 0)->data(Qt::UserRole).toInt() == id)
        {
           // qDebug() << "** terminal(): id = " << id << "  matchs: " << item(i, 0)->data(Qt::UserRole) << "**";

            return index(i, 0);
        }
    }

   /*
    if (rowCount() > 0)
    {
        QModelIndexList indexes = match(index(0, 0), Qt::UserRole, id);
        if (indexes.count() > 0)
        {
            qDebug() << "** terminal(): id = " << id << "  matchs: " << indexes.at(0).data(Qt::UserRole) << "**";

            return indexes.at(0);

        }
    }
    */

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
    if (! m_receiveSessionData->started)
        return;
    setHorizontalHeaderItem( 0, new QStandardItem( QString::fromLocal8Bit("终端") ));
    setHorizontalHeaderItem( 1, new QStandardItem( QString::fromLocal8Bit("状态") ));
    setHorizontalHeaderItem( 2, new QStandardItem( QString::fromLocal8Bit("日期/时间") ));
    setHorizontalHeaderItem( 3, new QStandardItem( "FEL/%"));
    setHorizontalHeaderItem( 4, new QStandardItem( "H2S/ppm"));
    setHorizontalHeaderItem( 5, new QStandardItem( "SO2/ppm"));
    setHorizontalHeaderItem( 6, new QStandardItem( QString::fromLocal8Bit("指尖脉搏")));
    setHorizontalHeaderItem( 7, new QStandardItem( QString::fromLocal8Bit("手腕脉搏")));
    setHorizontalHeaderItem( 8, new QStandardItem( QString::fromLocal8Bit("呼吸次数")));

    m_receiveSessionData->lastHit = QDateTime::currentDateTime();
    QModelIndex idx = terminal(item.ch, true);
    QStandardItem* itm = itemFromIndex(idx);
    qDebug() << QString("QModelIndex idx:%1 = terminal(item.ch:%2, true);").arg(idx.internalId()).arg(item.ch);

    QDateTime now = QDateTime::currentDateTime();
    QStandardItem* item3 = new QStandardItem(QString("%1").arg(now.toString()));
    item3->setData(now, Qt::UserRole);

    QStandardItem* item4 = new QStandardItem(QString("%1").arg(item.fel));
    QStandardItem* item5 = new QStandardItem(QString("%1").arg(item.h2s));
    QStandardItem* item6 = new QStandardItem(QString("%1").arg(item.so2));
    item4->setData(item.fel, Qt::UserRole);
    item5->setData(item.h2s, Qt::UserRole);
    item6->setData(item.so2, Qt::UserRole);
    QStandardItem* item7 = new QStandardItem(QString("%1").arg(item.fel));
    QStandardItem* item8 = new QStandardItem(QString("%1").arg(item.h2s));
    QStandardItem* item9 = new QStandardItem(QString("%1").arg(item.so2));
    item7->setData(item.fel, Qt::UserRole);
    item8->setData(item.h2s, Qt::UserRole);
    item9->setData(item.so2, Qt::UserRole);

    if (item.ch < LIFEBASE)
    {
        if (item.fel > GasInfoSettings::felAlarmThresF())
            item4->setBackground(QBrush(Qt::red));
        else
            item4->setBackground(QBrush(Qt::white));

        if (item.h2s > GasInfoSettings::h2sAlarmThresF())
            item5->setBackground(QBrush(Qt::red));
        else
            item5->setBackground(QBrush(Qt::white));

        if (item.so2 > GasInfoSettings::so2AlarmThresF())
            item6->setBackground(QBrush(Qt::red));
        else
            item6->setBackground(QBrush(Qt::white));
    }

    QList<QStandardItem*> lst;
    lst << 0
        << 0 // new QStandardItem
        << item3
        << item4
        << item5
        << item6
        << item7
        << item8
        << item9;

    itm->insertRow(0, lst);
}


bool CentralModel::save(QString filePath)
{
    // nothing to save.
    if (rowCount() <= 0)
        return false;

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

    out << QString("Terminal %1 \n").arg(terminalId);

    // export header
    QString str;
    foreach (int col, columns)
    {
        QStandardItem* itm = horizontalHeaderItem(col);
        str += (itm ? itm->text() : " ");
        str += ";";
    }
    out << str + " \n";

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
            out << str + " \n";

            qDebug() << row << ": " << str;
        }        
    }

    return true;
}

void CentralModel::updateTerminalStatus()
{
    QDateTime now = QDateTime::currentDateTime();
    for (int row = 0; row < rowCount(); ++row)
    {
        QStandardItem* termIdItem = item(row, 0);
        if (termIdItem && termIdItem->hasChildren())
        {
            QStandardItem* timeItem = termIdItem->child(0, 2);
            QDateTime lastTick = timeItem->data(Qt::UserRole).toDateTime();

            QStandardItem* statusItem = item(row, 1);

            if (statusItem && lastTick.secsTo(now) > GasInfoSettings::activeIntervalF())
            {
                statusItem->setText(QString::fromLocal8Bit("离线"));
                statusItem->setBackground(QBrush(Qt::darkYellow));
            }
            else
            {
                statusItem->setText(QString::fromLocal8Bit("在线"));
                statusItem->setBackground(QBrush(Qt::green));
            }
        }
    }
}

void CentralModel::timerEvent(QTimerEvent *event)
{
    if (GasInfoSettings::applicationModeF() == Receive)
    {
        updateTerminalStatus();

        int elapsed = m_receiveSessionData->startTime.secsTo(
                    m_receiveSessionData->lastHit);

        if (elapsed >= int(GasInfoSettings::archivePeriodF()))
        {
            emit archivePeriodReached();
        }
    }
}

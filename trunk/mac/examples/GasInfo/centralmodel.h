#ifndef CENTRALMODEL_H
#define CENTRALMODEL_H

#include "SerialTypes.hpp"

#include <QStandardItemModel>
#include <QStandardItem>
#include <QModelIndex>



class CentralModel : public QStandardItemModel
{
    Q_OBJECT
public:
    explicit CentralModel(QObject *parent = 0);
    
public:
    // could be -1 if failed.
    int terminalId(const QModelIndex& idx);

    QModelIndex terminal(int id, bool createNew = true);
    void removeTerminal(int id);
    void addData(const GasInfoItem& item);

signals:
    
public slots:
    
};

#endif // CENTRALMODEL_H

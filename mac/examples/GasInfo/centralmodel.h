#ifndef CENTRALMODEL_H
#define CENTRALMODEL_H

#include <QStandardItemModel>

class CentralModel : public QStandardItemModel
{
    Q_OBJECT
public:
    explicit CentralModel(QObject *parent = 0);
    
signals:
    
public slots:
    
};

#endif // CENTRALMODEL_H

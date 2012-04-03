#ifndef CENTRALMODEL_H
#define CENTRALMODEL_H

#include "SerialTypes.hpp"

#include <QStandardItemModel>
#include <QStandardItem>
#include <QModelIndex>

class QTimerEvent;
class ReceiveSessionData;

class CentralModel : public QStandardItemModel
{
    Q_OBJECT
public:
    explicit CentralModel(QObject *parent = 0);
    
public:

    // During a receive session:
    // - New data can be added.
    // - The signal archivePeriodReached will be emitted.
    void beginReceiveSession();
    void addData(const GasInfoItem& item);
    void endReceiveSession(bool bSave, const QString& filePath = QString());

    bool save(QString filePath);
    bool load(QString filePath);
    bool exportTerminal(QString filePath, int terminalId, const QList<int>& columns);

    // could be -1 if failed.
    int terminalId(int row);
    QModelIndex terminal(int id, bool createNew = true);
    void removeTerminal(int id);

protected:
    void timerEvent(QTimerEvent *event);

private:
    void updateTerminalStatus();

signals:
    void archivePeriodReached();

private:
    ReceiveSessionData* m_receiveSessionData;
    int m_timerId;
};

#endif // CENTRALMODEL_H

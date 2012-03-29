#ifndef GASINFOSETTINGS_H
#define GASINFOSETTINGS_H

#include <QSettings>

class GasInfoSettings : public QSettings
{
    Q_OBJECT
public:
    explicit GasInfoSettings(QObject *parent = 0);
    
signals:
    
public slots:
    
};

#endif // GASINFOSETTINGS_H

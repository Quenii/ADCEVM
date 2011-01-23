#ifndef QELEPHANTSETTINGS_H
#define QELEPHANTSETTINGS_H

#include <QSettings>

class QElephantSettings : public QSettings
{
	Q_OBJECT

public:
	QElephantSettings(QObject *parent);
	~QElephantSettings();

private:
	
};

#endif // QELEPHANTSETTINGS_H

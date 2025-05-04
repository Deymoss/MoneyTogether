//управление настройками (QSettings)
#ifndef SETTINGSMANAGER_H
#define SETTINGSMANAGER_H

#include <QObject>

class SettingsManager : public QObject
{
    Q_OBJECT
public:
    SettingsManager();
};

#endif // SETTINGS-MANAGER_H

//DI контейнер
#ifndef SERVICELOCATOR_H
#define SERVICELOCATOR_H

#include <QObject>

class ServiceLocator : public QObject
{
    Q_OBJECT
public:
    ServiceLocator();
};

#endif // SERVICELOCATOR_H

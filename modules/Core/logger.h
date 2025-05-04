//будет юзаться https://doc.qt.io/qt-6/qtlogging.html
#ifndef LOGGER_H
#define LOGGER_H

#include <QObject>

class Logger : public QObject
{
    Q_OBJECT
public:
    Logger();
};

#endif // LOGGER_H

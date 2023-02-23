#ifndef SERIALADAPTER_H
#define SERIALADAPTER_H

#include <QObject>

class SerialAdapter : public QObject
{
    Q_OBJECT
public:
    explicit SerialAdapter(QObject *parent = nullptr);

signals:

};

#endif // SERIALADAPTER_H

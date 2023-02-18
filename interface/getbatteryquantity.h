#ifndef GETBATTERYQUANTITY_H
#define GETBATTERYQUANTITY_H

#include <QObject>

class getbatteryquantity : public QObject
{
    Q_OBJECT
public:
    explicit getbatteryquantity(QObject *parent = nullptr);

signals:

};

#endif // GETBATTERYQUANTITY_H

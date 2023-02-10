#ifndef IMAGETRANSMISSION_H
#define IMAGETRANSMISSION_H

#include <QObject>

class ImageTransmission : public QObject
{
    Q_OBJECT
public:
    explicit ImageTransmission(QObject *parent = nullptr);

signals:

};

#endif // IMAGETRANSMISSION_H

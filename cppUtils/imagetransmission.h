#ifndef IMAGETRANSMISSION_H
#define IMAGETRANSMISSION_H

#include <QPixmap>
#include <QPainter>
#include <QDebug>
#include <QQuickPaintedItem>
#include <opencv2/core/core.hpp>
#include <opencv2/imgproc.hpp>
#include "cppUtils/camerathread.h"

class ImageTransmission : public QQuickPaintedItem
{
    Q_OBJECT
    QML_ELEMENT


public:
    ImageTransmission(QQuickItem *parent = nullptr);
    void paint(QPainter * painter) override;
    QPixmap matToPixmap(const QSize & size, const cv::Mat & mat);
    Q_INVOKABLE void open_camera();


signals:

public slots:
    // 接受子线程传回的图片
    void recvImage(QImage);

private:
    cv::Mat _mat;
    QImage _img;
    CameraThread * camera_thread = nullptr;
};

#endif // IMAGETRANSMISSION_H

#ifndef IMAGETRANSMISSION_H
#define IMAGETRANSMISSION_H

#include <QPixmap>
#include <QPainter>
#include <QDebug>
#include <QQuickPaintedItem>
#include <opencv2/core/core.hpp>
#include <opencv2/imgproc.hpp>
#include "cppUtils/camerathread.h"
#include "cppUtils/cpp_python_support.h"
// #include <iostream>

class ImageTransmission : public QQuickPaintedItem
{
    Q_OBJECT
    QML_ELEMENT

public:
    ImageTransmission(QQuickItem *parent = nullptr);
    ~ImageTransmission();
    void paint(QPainter * painter) override;
    QPixmap matToPixmap(const QSize & size, const cv::Mat & mat);
    Q_INVOKABLE void open_camera();
    Q_INVOKABLE void updatePainted();
    Q_INVOKABLE void close_camera();
    void setRunning(bool flag);

signals:
    void runningChanged();

public slots:
    // 接受子线程传回的图片
    void recvImage(QImage);
    // 接收python的数据
    void recvMesssage(QString);

private:
    cv::Mat _mat;
    QImage _img;
    CameraThread * camera_thread = nullptr;
    bool _running = false;
    //
    CppPythonSupport * python_support = nullptr;
};

#endif // IMAGETRANSMISSION_H

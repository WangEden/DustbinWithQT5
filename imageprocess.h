#ifndef IMAGEPROCESS_H
#define IMAGEPROCESS_H

#include <QObject>
#include <QQuickItem>
#include <QThread>
#include <opencv2/core.hpp>
#include <opencv2/videoio.hpp>
#include <QMuteX>

// 处理摄像头传回的画面并将其显示在QML中
class ImageProcess : public QThread
{
    Q_OBJECT

public:
    ImageProcess(QObject *parent = 0);
    bool open();
    cv::Mat get_frame() const;
    void set_frame(const cv::Mat &frame);
protected:
    virtual void run();
private:
    cv::Mat frame_;
    bool is_open_;
    mutable QMutex frame_lock;
    cv::VideoCapture vid;
};

#endif // IMAGEPROCESS_H

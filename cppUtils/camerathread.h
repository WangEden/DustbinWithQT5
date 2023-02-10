#ifndef CAMERATHREAD_H
#define CAMERATHREAD_H

#include <QObject>
#include <QQuickItem>
#include <QThread>
#include <QMuteX>
#include <opencv2/core.hpp>
#include <opencv2/videoio.hpp>


class CameraThread : public QThread
{
    Q_OBJECT

public:
    CameraThread( QObject * parent = nullptr);
    bool open();
    cv::Mat get_mat() const;
    void set_mat(const cv::Mat &mat);

protected:
    virtual void run();

private:
    cv::Mat mat_;
    bool is_open_;
    mutable QMutex mat_lock;
    cv::VideoCapture cap;
};

#endif // CAMERATHREAD_H

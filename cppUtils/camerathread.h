#ifndef CAMERATHREAD_H
#define CAMERATHREAD_H

#include <QObject>
#include <QQuickItem>
#include <QThread>
#include <QImage>
#include <QMuteX>
#include <opencv2/core.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/videoio.hpp>

class CameraThread : public QThread
{
    Q_OBJECT

public:
    CameraThread( QObject * parent = nullptr);
    bool open();
    cv::Mat get_mat() const;
    void set_mat(const cv::Mat &mat);
    // 接受主线程传来的参数：
    void recvStatus(int status);
    void released_camera();

protected:
    void run() override;

signals:
    void sendImage(QImage);



private:
    int _status;
    cv::Mat mat_;
    bool is_open_;
    mutable QMutex mat_lock;
    cv::VideoCapture cap;
    QImage toQImage(cv::Mat & srcFrom);
};

#endif // CAMERATHREAD_H

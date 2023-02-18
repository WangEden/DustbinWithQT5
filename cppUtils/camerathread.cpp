#include "camerathread.h"


CameraThread::CameraThread(QObject * parent) : QThread(parent)
{
    this->cap.open(0);
}

cv::Mat CameraThread::get_mat() const
{
    cv::Mat mat;
    this->mat_lock.lock();
    this->mat_.copyTo(mat);
    this->mat_lock.unlock();
    return mat;
}

void CameraThread::set_mat(const cv::Mat &mat)
{
    this->mat_lock.lock();
    mat.copyTo(this->mat_);
    this->mat_lock.unlock();
}

void CameraThread::run()
{
    // qDebug() << "捕获摄像头画面的线程地址：" << QThread::currentThread();
    while(!isInterruptionRequested())
    {
        this->cap >> this->mat_;
        this->set_mat(this->mat_);
        emit sendImage(toQImage(this->mat_));
        msleep(30);
    }
}

QImage CameraThread::toQImage(cv::Mat &srcFrom)
{
    cv::Mat rgbFrame;
    cv::cvtColor(srcFrom,rgbFrame,cv::COLOR_BGR2RGB);
    // qDebug() << "进行颜色转换";
    QImage img((const uchar*)rgbFrame.data,rgbFrame.cols,rgbFrame.rows,rgbFrame.step,QImage::Format_RGB888);
    img.bits(); //深拷贝，避免线程退出内存错误
    return img;
}

void CameraThread::recvStatus(int status)
{
    this->_status = status;
}

void CameraThread::released_camera()
{
    this->cap.release();
}

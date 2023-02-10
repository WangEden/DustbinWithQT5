#include "camerathread.h"
#include "cppUtils/camerathread.h"

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
    while(true)
    {
        this->cap >> this->mat_;
        this->set_mat(this->mat_);
        msleep(30);
    }
}

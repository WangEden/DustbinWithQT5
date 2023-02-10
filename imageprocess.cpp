#include "imageprocess.h"

ImageProcess::ImageProcess(QObject *parent) : QThread(parent)
{
    this->vid.open(0);

}

cv::Mat ImageProcess::get_frame() const
{
    cv::Mat ret;
    this->frame_lock.lock();
    this->frame_.copyTo(ret);
    this->frame_lock.unlock();
    return ret;
}

void ImageProcess::set_frame(const cv::Mat &frame)
{
    this->frame_lock.lock();
    frame.copyTo(this->frame_);
    this->frame_lock.unlock();
}

void ImageProcess::run()
{
    while (true)
    {
        this->vid >> this->frame_;
        this->set_frame(this->frame_);
        msleep(30);
    }
}
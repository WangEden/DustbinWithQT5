#include "imagetransmission.h"

//#define PYTHON_DEBUG
#define CAMERA

ImageTransmission::ImageTransmission(QQuickItem *parent) : QQuickPaintedItem(parent)
{

}

ImageTransmission::~ImageTransmission()
{
#ifdef CAMERA
    this->camera_thread->requestInterruption();
    this->camera_thread->wait();
#endif

#ifdef PYTHON_DEBUG
    this->python_support->requestInterruption();
    this->python_support->wait();
#endif

}

void ImageTransmission::paint(QPainter *painter)
{
    painter->setRenderHints(QPainter::Antialiasing, true);
    auto rect = boundingRect().toRect();
    painter->drawPixmap(rect,QPixmap::fromImage(this->_img));
}

QPixmap ImageTransmission::matToPixmap(const QSize &size, const cv::Mat &mat)
{
    if(mat.empty())
        return QPixmap();

    auto img = QImage((const unsigned char *)(mat.data),
                      mat.cols, mat.rows, mat.cols * mat.channels(),
                      QImage::Format_RGB888);
    return QPixmap::fromImage(img.scaled(size));
}

void ImageTransmission::open_camera()
{
#ifdef CAMERA
    qDebug() << "ImageTransmission: opening camera ...";
//    std::cout << "cout:";
    this->camera_thread = new CameraThread(this);
    // 绑定主线程和子线程的信号和槽
    qRegisterMetaType<QImage>("QImage");
    connect(camera_thread, SIGNAL(sendImage(QImage)), this, SLOT(recvImage(QImage)));
    // qDebug() << "创建并绑定了摄像头线程";
    setRunning(true);
    // qDebug() << "摄像头线程启动";
#endif
    updatePainted();
    // qDebug() << "刷新画面";

#ifdef PYTHON_DEBUG
    this->python_support = new CppPythonSupport(this);
    connect(python_support, SIGNAL(sendMessage(QString)), this, SLOT(recvMesssage(QString)));
    this->python_support->start();
#endif


}

void ImageTransmission::updatePainted()
{
    update();
}

#ifdef CAMERA
void ImageTransmission::close_camera()
{
    setRunning(false);
    emit runningChanged();
}

void ImageTransmission::setRunning(bool flag)
{
    this->_running = flag;
    if(_running) {
        this->camera_thread->start();
    }
    else {
        this->camera_thread->requestInterruption();
        this->camera_thread->released_camera();
        this->camera_thread->wait();
    }
}
#endif

void ImageTransmission::recvImage(QImage img)
{
    this->_img = img;
    // qDebug() << "从摄像头读取mat";
}

void ImageTransmission::recvMesssage(QString s)
{
    qDebug() << s;
}



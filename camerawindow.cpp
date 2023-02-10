#include "camerawindow.h"

CameraWindow::CameraWindow(QObject *parent)
    : QObject{parent}
{

}

CameraWindow *CameraWindow::getInstance()
{
    static CameraWindow * obj = new CameraWindow();
    return obj;
}

int CameraWindow::iValue() const
{
    return m_iValue;
}

void CameraWindow::setIValue(int newIValue)
{
    if (m_iValue == newIValue)
        return;
    m_iValue = newIValue;
    emit iValueChanged();
}

QString CameraWindow::sString() const
{
    return m_sString;
}

void CameraWindow::setSString(const QString &newSString)
{
    if (m_sString == newSString)
        return;
    m_sString = newSString;
    emit sStringChanged();
}

void CameraWindow::func()
{
    qDebug() << __FUNCTION__;
}

void CameraWindow::camera_open(int status, QString s)
{
    // Debug
    {
        qDebug() << __FUNCTION__ << " " << status << " " << s;
    }
}

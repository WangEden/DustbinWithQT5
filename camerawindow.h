#ifndef CAMERAWINDOW_H
#define CAMERAWINDOW_H

#include <QObject>
#include <QtQml>

// 利用opencv处理摄像头
class CameraWindow : public QObject
{
    Q_OBJECT

    QML_ELEMENT
    
public:
    explicit CameraWindow(QObject *parent = nullptr);
    static CameraWindow * getInstance();

    int iValue() const;
    void setIValue(int newIValue);

    QString sString() const;
    void setSString(const QString &newSString);

    // 可被QML直接调用的函数
    Q_INVOKABLE void func();

public slots:
    void camera_open(int status, QString s);

signals:

    void iValueChanged();
    void sStringChanged();

private:
    int m_iValue;
    QString m_sString;

    Q_PROPERTY(int iValue READ iValue WRITE setIValue NOTIFY iValueChanged)
    Q_PROPERTY(QString sString MEMBER m_sString NOTIFY sStringChanged)
};

#endif // CAMERAWINDOW_H

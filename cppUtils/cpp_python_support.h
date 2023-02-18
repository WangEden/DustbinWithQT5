#ifndef CPP_PYTHON_SUPPORT_H
#define CPP_PYTHON_SUPPORT_H

#include <Python.h>
#include <QObject>
#include <QThread>

class CppPythonSupport : public QThread
{
    Q_OBJECT

public:
    CppPythonSupport(QObject * parent = nullptr);
    void py_init();

protected:
    void run() override;

signals:
    void sendMessage(QString);

private:
    QString _result;


};

#endif // CPP_PYTHON_SUPPORT_H

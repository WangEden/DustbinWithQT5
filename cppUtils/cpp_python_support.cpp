#include "cpp_python_support.h"

CppPythonSupport::CppPythonSupport(QObject * parent) : QThread(parent)
{

}

void CppPythonSupport::py_init()
{
    Py_Initialize();
    PyObject * pyModule = NULL;
    PyObject * pyFunc = NULL;
    PyObject * pyArg = NULL;
    PyObject * res = NULL;

    pyModule = PyImport_ImportModule("py_TestModule");
    pyFunc = PyObject_GetAttrString(pyModule, "print_message");
    pyArg = Py_BuildValue("(i, i)", 10, 10);

    QString s;
    res = PyObject_CallObject(pyFunc, pyArg);
    PyArg_Parse(res, "s", &s);
    this->_result = s;

    Py_Finalize();
}

void CppPythonSupport::run()
{
    if(!isInterruptionRequested()){
        py_init();
        emit sendMessage(_result);
    }
}

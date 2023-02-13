/****************************************************************************
** Meta object code from reading C++ file 'imagetransmission.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../../cppUtils/imagetransmission.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'imagetransmission.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_ImageTransmission_t {
    QByteArrayData data[6];
    char stringdata0[58];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ImageTransmission_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ImageTransmission_t qt_meta_stringdata_ImageTransmission = {
    {
QT_MOC_LITERAL(0, 0, 17), // "ImageTransmission"
QT_MOC_LITERAL(1, 18, 11), // "QML.Element"
QT_MOC_LITERAL(2, 30, 4), // "auto"
QT_MOC_LITERAL(3, 35, 9), // "recvImage"
QT_MOC_LITERAL(4, 45, 0), // ""
QT_MOC_LITERAL(5, 46, 11) // "open_camera"

    },
    "ImageTransmission\0QML.Element\0auto\0"
    "recvImage\0\0open_camera"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ImageTransmission[] = {

 // content:
       8,       // revision
       0,       // classname
       1,   14, // classinfo
       2,   16, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // classinfo: key, value
       1,    2,

 // slots: name, argc, parameters, tag, flags
       3,    1,   26,    4, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
       5,    0,   29,    4, 0x02 /* Public */,

 // slots: parameters
    QMetaType::Void, QMetaType::QImage,    4,

 // methods: parameters
    QMetaType::Void,

       0        // eod
};

void ImageTransmission::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<ImageTransmission *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->recvImage((*reinterpret_cast< QImage(*)>(_a[1]))); break;
        case 1: _t->open_camera(); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject ImageTransmission::staticMetaObject = { {
    QMetaObject::SuperData::link<QQuickPaintedItem::staticMetaObject>(),
    qt_meta_stringdata_ImageTransmission.data,
    qt_meta_data_ImageTransmission,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *ImageTransmission::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ImageTransmission::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_ImageTransmission.stringdata0))
        return static_cast<void*>(this);
    return QQuickPaintedItem::qt_metacast(_clname);
}

int ImageTransmission::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickPaintedItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 2)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 2;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE

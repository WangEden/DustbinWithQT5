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
    QByteArrayData data[10];
    char stringdata0[113];
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
QT_MOC_LITERAL(3, 35, 14), // "runningChanged"
QT_MOC_LITERAL(4, 50, 0), // ""
QT_MOC_LITERAL(5, 51, 9), // "recvImage"
QT_MOC_LITERAL(6, 61, 12), // "recvMesssage"
QT_MOC_LITERAL(7, 74, 11), // "open_camera"
QT_MOC_LITERAL(8, 86, 13), // "updatePainted"
QT_MOC_LITERAL(9, 100, 12) // "close_camera"

    },
    "ImageTransmission\0QML.Element\0auto\0"
    "runningChanged\0\0recvImage\0recvMesssage\0"
    "open_camera\0updatePainted\0close_camera"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ImageTransmission[] = {

 // content:
       8,       // revision
       0,       // classname
       1,   14, // classinfo
       6,   16, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // classinfo: key, value
       1,    2,

 // signals: name, argc, parameters, tag, flags
       3,    0,   46,    4, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       5,    1,   47,    4, 0x0a /* Public */,
       6,    1,   50,    4, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
       7,    0,   53,    4, 0x02 /* Public */,
       8,    0,   54,    4, 0x02 /* Public */,
       9,    0,   55,    4, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void, QMetaType::QImage,    4,
    QMetaType::Void, QMetaType::QString,    4,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void ImageTransmission::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<ImageTransmission *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->runningChanged(); break;
        case 1: _t->recvImage((*reinterpret_cast< QImage(*)>(_a[1]))); break;
        case 2: _t->recvMesssage((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 3: _t->open_camera(); break;
        case 4: _t->updatePainted(); break;
        case 5: _t->close_camera(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (ImageTransmission::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ImageTransmission::runningChanged)) {
                *result = 0;
                return;
            }
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
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
    }
    return _id;
}

// SIGNAL 0
void ImageTransmission::runningChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE

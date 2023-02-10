#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QLocale>
#include <QTranslator>
#include <QQmlContext>
// #include "camerawindow.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QTranslator translator;
    const QStringList uiLanguages = QLocale::system().uiLanguages();
    for (const QString &locale : uiLanguages) {
        const QString baseName = "DustbinWithQT5_" + QLocale(locale).name();
        if (translator.load(":/i18n/" + baseName)) {
            app.installTranslator(&translator);
            break;
        }
    }

    QQmlApplicationEngine engine;

    // 全局上下文对象
    {
        QQmlContext * context = engine.rootContext();
        context->setContextProperty("SCREEN_WIDTH", 512);
        context->setContextProperty("SCREEN_HEIGHT", 300);
    }

    // 注册对象
    {
//        qmlRegisterType<CameraWindow>("CameraWindow", 1, 0, "CameraWindow");
    }

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    // 在load之后才可绑定信号和槽
    {
//        auto list = engine.rootObjects();
//        auto camera_window_container = list.first()->findChild<QObject *>("CameraWindowContainer");
//        qDebug() << camera_window_container;
    }

    return app.exec();
}

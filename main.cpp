#include <QGuiApplication>
#include <QQmlApplicationEngine>





class MyMedia {
    QString path;
    int duration;
};




int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    // Leggere i files contenuti in una cartella predefinita
    // e creare una lista

    // Loop per carosello immagini

        // Passare la lista al QML o passa la path immagine

    return app.exec();
}

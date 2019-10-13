

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDir>
#include <QDebug>


/**
 * @brief The MyMedia class
 */
class MyMedia : public QObject {
    Q_OBJECT

private:
    QString m_path;
    int m_duration;

public:
    MyMedia(QString path, int duration = 0){
     m_path = path;
     m_duration = duration;
    }
};



/**
 * @brief main
 * @param argc
 * @param argv
 * @return
 */
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    // Leggere i files contenuti in una cartella predefinita
    // e creare una lista
    QDir dir = QDir("/home/stefano/Scrivania/Foto/2012 Oltre");
    QFileInfoList infoList = dir.entryInfoList();
    QStringList stringList = dir.entryList();
    QList<QObject*> contentList;

    qDebug() << "List: " << infoList.count();
    for (int i=0; i < infoList.count(); i++){
        QFileInfo info = infoList[i];
        contentList.append( new MyMedia(info.absolutePath()));
    }


    //SM Collegamento tra C++ e QML
    QQmlContext *context = engine.rootContext();

    // Passa la lista al QML o passa la path immagine
    qDebug() << "--> " << stringList;

    context->setContextProperty("fileList", QVariant::fromValue(contentList));

    return app.exec();
}

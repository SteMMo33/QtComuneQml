
/**

  Piattaforma Windows
  Installato il pacchetto K-Lite Codec Basic per vedere i video

  */

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDir>
#include <QDebug>

#include "mymedia.h"



QList<QObject*> contentList;
QStringList stringList;

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

    // Leggere i files contenuti in una cartella predefinita
    // e creare una lista

    //QDir dir = QDir("/home/stefano/Scrivania/Foto/2012 Oltre");
    QDir dir = QDir("C:\\Users\\A.Rubiconi\\Downloads\\contents");

    QFileInfoList infoList = dir.entryInfoList();
    stringList = dir.entryList();

    qDebug() << "List: " << infoList.count();
    for (int i=0; i < infoList.count(); i++){
        QFileInfo info = infoList[i];

        if (info.isDir()) continue;

        contentList.append( new MyMedia(info.absoluteFilePath()));
    }
    qDebug() << "Content: " << contentList.count();


    //SM Collegamento tra C++ e QML
    QQmlContext *context = engine.rootContext();

    // Passa la lista al QML o passa la path immagine
    qDebug() << "--> " << stringList;

    // context->setContextProperty("fileList", &contentList); // Errore
    context->setContextProperty("fileList", QVariant::fromValue(contentList));

    context->setContextProperty("fileDataModel", QVariant::fromValue(contentList));

    // context->setContextProperty("fileDataModel", stringList); - ok con text: "Q "+modelData

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}

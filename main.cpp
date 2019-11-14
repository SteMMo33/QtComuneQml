
/**

  Piattaforma Windows
  Installato il pacchetto K-Lite Codec Basic per vedere i video

  */

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDir>
#include <QDebug>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QtSql/QtSql>

#include "mymedia.h"
#include "websocketserver.h"


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

    // Apertura databse MySql
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("localhost");
    db.setDatabaseName("kiosk");
    db.setUserName("root");
    db.setPassword("amtek");

    bool ok = db.open();

    if (ok){
		qDebug() << "Database aperto ..";
		qDebug() << "Query contents ..";

        QSqlQueryModel model;
        model.setQuery("SELECT * FROM contents");
        for (int i = 0; i < model.rowCount(); ++i) {
            int id = model.record(i).value("id").toInt();
            QString name = "home/pi/Desktop/QtComuneQml/contents/"+model.record(i).value("path").toString();
            int duration = model.record(i).value("duration").toInt();
            qDebug() << id << name << duration;
			
			contentList.append( new MyMedia(name, duration));
        }
        db.close();
    }
	else {

		qDebug() << "Errore apertura DB - carico img da cartella\n";

		QDir dir = QDir(".//contents");

		QFileInfoList infoList = dir.entryInfoList();
		stringList = dir.entryList();
		qDebug() << "-> " << stringList;

		qDebug() << "List: " << infoList.count();
		for (int i=0; i < infoList.count(); i++){
			QFileInfo info = infoList[i];

			if (info.isDir()) continue;
			contentList.append( new MyMedia(info.absoluteFilePath()));
		}
		qDebug() << "Content: " << contentList.count();
	}

	// Carica il server websocket per interazione esterna
	int port = 1111;
	bool debug = true;
	WebSocketServer *server = new WebSocketServer(port, debug);
    // QObject::connect(server, &WebSocketServer::closed, &a, &QCoreApplication::quit);
	
    // Collegamento tra C++ e QML
    QQmlContext *context = engine.rootContext();

    // Passa la lista al QML o passa la path immagine

    // context->setContextProperty("fileList", &contentList); // Errore
    context->setContextProperty("fileList", QVariant::fromValue(contentList));
    context->setContextProperty("fileDataModel", QVariant::fromValue(contentList));

    // context->setContextProperty("fileDataModel", stringList); - ok con text: "Q "+modelData

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}

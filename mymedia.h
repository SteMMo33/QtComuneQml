#ifndef MYMEDIA_H
#define MYMEDIA_H

#include <QObject>

class MyMedia : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString path READ path) // WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(int duration READ duration) // WRITE setName NOTIFY nameChanged)

public:
    MyMedia(QString path, int duration = 10);

    QString path() const;
    int duration() const;

private:
    QString m_path; // Path dell'immagine o video
    int m_duration; // Durata visualizzaizone in secondi

};

#endif // MYMEDIA_H

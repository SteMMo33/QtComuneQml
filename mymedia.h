#ifndef MYMEDIA_H
#define MYMEDIA_H

#include <QObject>

class MyMedia : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString path READ path WRITE setPath NOTIFY pathChanged)
    Q_PROPERTY(int duration READ duration WRITE setDuration NOTIFY durationChanged)

public:
    MyMedia(QString path, int duration = 10);

    QString path() const;
    int duration() const;

    void setPath(QString newPath) { m_path = newPath; }
    void setDuration(int newDuration) { m_duration = newDuration; }

signals:
    void pathChanged();
    void durationChanged();

private:
    QString m_path; // Path dell'immagine o video
    int m_duration; // Durata visualizzazione in secondi

};

#endif // MYMEDIA_H

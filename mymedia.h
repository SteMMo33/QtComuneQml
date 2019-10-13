#ifndef MYMEDIA_H
#define MYMEDIA_H

#include <QObject>

class MyMedia : public QObject
{
public:
    MyMedia(QString path, int duration = 0);


// private:
    QString m_path;
    int m_duration;

};

#endif // MYMEDIA_H

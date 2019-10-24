

#include "mymedia.h"


MyMedia::MyMedia(QString path, int duration, QObject* parent) : m_path(path), m_duration(duration), QObject(parent)
{

}



QString MyMedia::path() const {
    return m_path;
}

int MyMedia::duration() const {
    return m_duration;
}

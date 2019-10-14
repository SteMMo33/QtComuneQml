

#include "mymedia.h"


MyMedia::MyMedia(QString path, int duration) : m_path(path), m_duration(duration)
{

}



QString MyMedia::path() const {
    return m_path;
}

int MyMedia::duration() const {
    return m_duration;
}

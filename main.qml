import QtQuick 2.7
import QtQuick.Window 2.2


Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("QtComuneQml")

    Rectangle {
        id: idHeader
        height: 250
        color: "#9d89ff"
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        Image {
            id: image
            x: 0
            height: 100
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            fillMode: Image.PreserveAspectFit
            source: "images/Langhirano-Stemma.png"
        }

        Text {
            id: txtTitolo
            x: 0
            y: 133
            text: qsTr("Comune di Langhirano")
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            font.pixelSize: 44
        }

        Text {
            id: txtSottotitolo
            x: 0
            y: 193
            color: "#3ffbb2"
            text: qsTr("Tel. 0521/351111\nFax 0521/858240\ne.mail comune@comune.langhirano.pr.it")
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 14
        }
    }

    Rectangle {
        id: idMedia
        color: "#ffbda9"
        anchors.top: idHeader.bottom
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0

        Image {
            id: image1
            x: 270
            y: 65
            width: 100
            height: 100
            source: "qrc:/qtquickplugin/images/template_image.png"
        }
    }



}

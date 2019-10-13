import QtQuick 2.7
import QtQuick.Window 2.2


Window {

    property var fileList

    onFileListChanged: {
        console.log("Lista:")
            for(var property in fileList)
                console.log(property)
            console.log("fine Lista")
    }


    id: window
    visible: true
    width: 640
    height: 520
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

            Image {
                id: image5
                x: 540
                y: 35
                width: 100
                height: 80
                fillMode: Image.PreserveAspectFit
                source: "images/mail.gif"
            }
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

        Image {
            id: image
            x: 270
            y: 27
            width: 100
            height: 100
            fillMode: Image.PreserveAspectFit
            source: "images/Langhirano-Stemma.png"
        }

        Image {
            id: image2
            x: 72
            y: 22
            width: 100
            height: 100
            source: "images/ParmaCalcio.png"
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
        anchors.bottomMargin: -147

        Image {
            id: image1
            x: 170
            y: 46
            width: 300
            height: 325
            source: "qrc:/qtquickplugin/images/template_image.png"
        }
    }



}

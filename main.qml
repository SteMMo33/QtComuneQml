import QtQuick 2.7
import QtQuick.Window 2.2
import QtMultimedia 5.5


Window {

    /* property var fileList - arriva dal C++ - non deve essere definita pena sovrapposizione

    onFileListChanged: {
        console.log("Lista:")
        for(var property in fileList)
            console.log(property)
        console.log("fine Lista")
    }
      */

    id: window
    visible: true
    width: 640
    height: 750
    title: qsTr("QtComuneQml")


    property int idx : -1;

    Timer {
        id : tim
        interval: 500
        running: true
        repeat: false
        onTriggered: {

            ++idx;
            if (idx >= fileList.length) idx = 0

            text1.text = idx
            console.log("n."+idx+" "+fileList[idx].path)

            if (show(fileList[idx].path)){
                divVideo.source = "file:///"+fileList[idx].path
                console.log("Video dur:"+divVideo.duration)
                if (!divVideo.visible){
                    divVideo.visible = true
                    divImage.visible = false
                    divVideo.play()
                }
            }
            else {
                console.log("Immagine ")
                divImage.source = "file:///"+fileList[idx].path
                if (!divImage.visible){
                    divImage.visible = true
                    divVideo.visible = false
                    divVideo.stop()
                }
                tim.interval = listView.model[idx].duration*1000
                tim.start()
            }
        }


        function show(content){
            if ((content.indexOf(".mp4")!==-1) || (content.indexOf(".webm")!==-1))
                return 1;
            return 0;
        }
    }

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
            y: 8
            height: 114
            fillMode: Image.PreserveAspectFit
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
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
        anchors.bottomMargin: 0

        Image {
            id: divImage
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            fillMode: Image.PreserveAspectFit
            // source: fileList
            visible: false
            /* Connections {
                target: fileList
                onDataChanged: console.log("The application data changed!")
            } */
        }

        Video {
            id: divVideo
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.bottomMargin: 10
            anchors.topMargin: 10
            anchors.fill: parent
            visible: false
            onStopped: {
                tim.interval = 100
                tim.start()
                console.log("onStopped")
            }
        }

        ListView {
            id: listView
            x: 489
            y: 8
            width: 143
            height: 190
            visible: false
            model: fileDataModel
            delegate: Item {
                id: itemRowFile
                x: 5
                width: 80
                height: 40
                Row {
                    id: row1
                    Rectangle {
                        width: 40
                        height: 40
                        // color: colorCode
                    }

                    Text {
                        text: modelData.path
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }
                    spacing: 10
                }
            }
        }

        Text {
            id: text1
            x: 0
            y: 0
            text: qsTr("--")
            font.bold: true
            font.pixelSize: 22
        }
    }

}

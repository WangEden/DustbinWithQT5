import QtQuick 2.15
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.15

Item {
    id:r
    anchors.fill: parent
    property alias icon: image.source
    property alias text: info.text
    property alias state: image.state
    signal tabclick()

    Rectangle {
        width: parent.width
        height: parent.height
        color: "transparent"
        Image {
            id: image
            width: 0.688 * parent.width
            height: width
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            source: ""
            states:[
                State {
                    name: "choosed"
                    PropertyChanges { target: image_color; visible:true }
                },
                State {
                    name: "unchoosed"
                    PropertyChanges { target: image_color; visible:false }
                }

            ]
            LinearGradient {
                id: image_color
                anchors.fill: parent
                source: parent
                start: Qt.point(0.6 * parent.width, 0.6 * parent.height)
                end: Qt.point(0, parent.height)
                gradient: Gradient {
                    GradientStop { position: 0; color: Qt.rgba(85 / 256, 62 / 256, 231 / 256, 1) }
                    GradientStop { position: 1; color: Qt.rgba(187 / 256, 52 / 256, 103 / 256, 1) }
                }
            }

        }
        Text {
            id: info
            text: ""
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: image.bottom
            anchors.topMargin: 0.4 * image.height
            color: "#d4237a"
            font {
                family: "微软雅黑"
                pixelSize: 8
            }
        }
        NumberAnimation {
            id:animationPressed1
            target:image
            properties: "opacity"
            from:1
            to:0.2
            duration: 150
        }
        NumberAnimation {
            id:animationReleased1
            target:image
            properties: "opacity"
            from:0.2
            to:1
            duration: 150
        }
        NumberAnimation {
            id:animationPressed2
            target:info
            properties: "opacity"
            from:1
            to:0.2
            duration: 150
        }
        NumberAnimation {
            id:animationReleased2
            target:info
            properties: "opacity"
            from:0.2
            to:1
            duration: 150
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            tabclick()
        }
        onPressed: {
            animationPressed1.start()
            animationPressed2.start()
        }
        onReleased: {
            animationReleased1.start()
            animationReleased2.start()
        }

    }
}

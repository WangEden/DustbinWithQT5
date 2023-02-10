import QtQuick 2.15
import QtGraphicalEffects 1.15

Item {
    anchors.fill:parent
    property alias icon: icon.source
    property alias info: info.text
    property alias state: rect.state
    signal tabclick()

    Rectangle {
        id:rect
        height:parent.height
        width: height
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        color:"transparent"
        state: "unchoosed"
        states:[
            State {
                name: "choosed"
                PropertyChanges { target: info; color: Qt.rgba(70 / 256, 58 / 256, 207 / 256, 0.6) }
                PropertyChanges { target: icon_color; visible: true }
            },
            State {
                name: "unchoosed"
                PropertyChanges { target: info; color: Qt.rgba(1, 1, 1, 0.6) }
                PropertyChanges { target: icon_color; visible: false }
            }
        ]
        Image {
            id:icon
            height:parent.height
            width:height
            opacity: 0.6
            fillMode: Image.PreserveAspectFit
            LinearGradient {
                id:icon_color
                anchors.fill: parent
                source: parent
                start: Qt.point(0, 0)
                end: Qt.point(0, parent.height)
                gradient: Gradient {
                    GradientStop { position: 0; color: Qt.rgba(70 / 256, 58 / 256, 207 / 256, 1)}
                    GradientStop { position: 1; color: Qt.rgba(70 / 256, 58 / 256, 207 / 256, 1)}
                }
            }
        }

//        NumberAnimation on x {from: -2 * width; to: width / 2; duration: 150}

    }
    Text {
        id:info
        horizontalAlignment: Text.AlignHCenter
        anchors.centerIn: parent
        font.bold: true
        fontSizeMode: Text.VerticalFit
        font.family: "微软雅黑"
        text: ""
        opacity: 0.6
//        NumberAnimation on x {from: -2 * width; to: width / 2; duration: 150}

    }

    NumberAnimation {
        id:animationPressed1
        target:icon
        properties: "opacity"
        from:0.6
        to:0.2
        duration: 150
    }
    NumberAnimation {
        id:animationReleased1
        target:icon
        properties: "opacity"
        from:0.2
        to:0.6
        duration: 150
    }
    NumberAnimation {
        id:animationPressed2
        target:info
        properties: "opacity"
        from:0.6
        to:0.2
        duration: 150
    }
    NumberAnimation {
        id:animationReleased2
        target:info
        properties: "opacity"
        from:0.2
        to:0.6
        duration: 150
    }

    MouseArea {
//        anchors.fill:parent
        width:parent.width
        height:parent.height * 1.8
        anchors.centerIn: parent
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

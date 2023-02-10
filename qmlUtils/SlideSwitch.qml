import QtQuick 2.15
import QtGraphicalEffects 1.15

Item {
    id: frame
    anchors.fill: parent
    property int optionNum: 3
    property int current_index
    property var optionName: ["", "", ""]

    Rectangle {
        id:rect
        radius:45
        anchors.fill: parent
        color: Qt.rgba(216 / 256, 216 / 256, 216 / 256, 0.1)
        ListView {
            id:listview
            orientation: ListView.Horizontal
            anchors.fill: parent
            model: optionName
            interactive: false
            delegate: Rectangle {
                height: listview.height
                width: listview.width / frame.optionNum
                color: "transparent"
                Text {
                    id:info
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.centerIn: parent
                    font.bold: true
                    fontSizeMode: Text.VerticalFit
                    font.family: "微软雅黑"
                    color:"white"
                    text: modelData
                }
                NumberAnimation {
                    id:animationPressed
                    target:info
                    properties: "opacity"
                    from:1
                    to:0.2
                    duration: 150
                }
                NumberAnimation {
                    id:animationReleased
                    target:info
                    properties: "opacity"
                    from:0.2
                    to:1
                    duration: 150
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        frame.current_index = index
                        animationX.start()
                    }
                    onPressed: {
//                        animationOpacity1.start()
                        animationPressed.start()
                    }
                    onReleased: {
//                        animationOpacity2.start()
                        animationReleased.start()
                    }
                }
            }
        }

        Rectangle {
            id: slide_window
            height: parent.height
            width: parent.width / frame.optionNum
            anchors.verticalCenter: parent.verticalCenter
            opacity:0.3
            radius:45
            LinearGradient {
                anchors.fill: parent
                visible: true
                source: parent
                start: Qt.point(0, 0)
                end: Qt.point(parent.width, parent.height)
                gradient: Gradient {
                    GradientStop {position: 0; color: Qt.rgba(114 / 256, 38 / 256, 213 / 256, 1)}
                    GradientStop {position: 1; color: Qt.rgba(95  / 256, 69 / 256, 220 / 256, 1)}
                }
            }
        }

        PropertyAnimation {
            id: animationX
            target: slide_window
            property: "x"
            to: parent.width / frame.optionNum * current_index;
            duration: 300
            easing.type: Easing.InOutQuint
        }
        NumberAnimation {
            id:animationOpacity1
            target:slide_window
            properties: "opacity"
            from:0.3
            to:0.1
            duration: 150
        }
        NumberAnimation {
            id:animationOpacity2
            target:slide_window
            properties: "opacity"
            from:0.1
            to:0.3
            duration: 150
        }


    }

    Component.onCompleted: {
        slide_window.x = parent.width / frame.optionNum * current_index
    }
}

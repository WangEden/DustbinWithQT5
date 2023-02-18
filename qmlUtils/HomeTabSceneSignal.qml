import QtQuick 2.15

Item {
    anchors.fill: parent
    property alias _scene_state: info.state

    Rectangle {
        width:parent.width
        height:0.92 * parent.height
        anchors.centerIn: parent
        color: "transparent"
        Rectangle {
            id:logo_frame
            height: parent.height / 2
            width: height
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 0.02 * parent.width
            color: "transparent"
            Image {
                anchors.fill: parent
                source: "qrc:/src/pages/homePage/card_1_sign_logo.svg"
                anchors.centerIn: parent
                fillMode: Image.PreserveAspectFit
            }
        }
        Rectangle {
            // 场景的值
            id:info_frame
            height: 0.6 * parent.height
            width:  0.18 * parent.width
            anchors.right: parent.right
            anchors.rightMargin: 0.11 * parent.width
            anchors.verticalCenter: parent.verticalCenter
            color: "transparent"
            Text {
                id: info
                anchors.centerIn: parent
                text: ""
                color: "#ccffffff"
                font {
                    family: "微软雅黑"
                    pixelSize: 8
                }
                states:[
                    State {
                        name: "indoor"
                        PropertyChanges { target: info; text:"室内"}
                    },
                    State {
                        name: "outdoor"
                        PropertyChanges { target: info; text:"室外" }
                    }
                ]
            }
        }
        Rectangle {
            // 说明
            color:"transparent"
            height: 0.6 * parent.height
            width: 0.34 * parent.width
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: logo_frame.right
            anchors.leftMargin: 0.05 * parent.width
            anchors.right: info_frame.left
            anchors.rightMargin: 0.21 * parent.width
            Text {
                anchors.centerIn: parent
                text: "当前场景"
                color: "#ccffffff"
                font {
                    family: "微软雅黑"
                    pixelSize: 8
                }
            }
        }
    }
    Canvas {
        anchors.fill: parent
        onPaint: {
            var context = getContext("2d")
            var gradient = context.createLinearGradient(0,0,parent.width,0)
            gradient.addColorStop(0.0, Qt.rgba(110 / 256, 18 / 256, 235 / 256, 0.01))
            gradient.addColorStop(0.5, Qt.rgba(100 / 256, 24 / 256, 201 / 256, 1))
            gradient.addColorStop(1.0, Qt.rgba(88  / 256, 37 / 256, 158 / 256, 0))
            context.fillStyle = gradient
            context.fillRect(0, 0, parent.width, 0.04 * parent.height)
            context.fillRect(0, 0.96 * parent.height, parent.width, parent.height)
        }
    }
}

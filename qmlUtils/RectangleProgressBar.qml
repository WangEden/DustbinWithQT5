import QtQuick 2.15
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.15

Item {
    id:r
    property alias text: progress_info.text
    property real progress: 0.0
    property string progress_sign: String("%1%").arg((progress * 100).toFixed(0))
//    property bool changed: false

    anchors.fill: parent
    Rectangle {
        // 进度条说明
        height: 0.40 * parent.height
        width: parent.width / 2
        anchors.left: parent.left
        anchors.top: parent.top
//        border.color: "yellow"
        color: "transparent"
        Label {
            id:progress_info
            background:Rectangle{
                color: "transparent"
            }
            width: parent.width
            height: parent.height
            color: Qt.rgba(1, 1, 1, 0.6)
            font.bold: false
            fontSizeMode: Text.VerticalFit
            font.family: "微软雅黑"
            text: ""
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }
    }

    Rectangle {
        // 进度条进度
        height: 0.40 * parent.height
        anchors.right: parent.right
        anchors.top: parent.top
//        border.color: "yellow"
        color: "transparent"
        width: parent.width / 2
        Label {
            id:progress_data
            background:Rectangle{
                color: "transparent"
            }
            width: parent.width
            height: parent.height
            color: Qt.rgba(1, 1, 1, 0.6)
            font.bold: false
            fontSizeMode: Text.Fit
            font.family: "微软雅黑"
            text: r.progress_sign
//            text:"60%"
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
        }
    }

    Rectangle {
        // 进度条图像
        id:outerRect
        width: parent.width
        height: 0.15 * parent.height
        color: Qt.rgba(216 / 256, 216 / 256, 216 / 256, 0.1)
        anchors.bottom: parent.bottom
        radius: 5
        Rectangle {
            // 进度可视化
            id:innerRect
            height: parent.height
            width: 0
            radius: 5
            LinearGradient {
                anchors.fill: parent
                start: Qt.point(0, 0)
                end: Qt.point(width, 0)
                gradient: Gradient {
                    GradientStop {  position: 0.0;    color: Qt.rgba(85  / 256, 62 / 256, 231 / 256, 1) }
                    GradientStop {  position: 0.65;   color: Qt.rgba(171 / 256, 52 / 256, 121 / 256, 1) }
                    GradientStop {  position: 1.6;    color: Qt.rgba(187 / 256, 52 / 256, 103 / 256, 0) }
                }
            }
            NumberAnimation on width { to: r.progress * outerRect.width; duration: 300 }
        }


    }

//    NumberAnimation {
//        id: animationWidth_
//        target: innerRect
//        properties:  width
//        from: 0
//        to: r.progress / 100 * parent.width
//        duration: 500
//    }

//    function animationStart() {
//        console.log("animation Start!!!!!!")
//        animationWidth.start()

//    }
}

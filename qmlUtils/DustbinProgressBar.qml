import QtQuick 2.15
import QtQml 2.15
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.15

Item {
    id: container
    implicitHeight: parent.width * 0.8
    implicitWidth: parent.height * 0.7
    anchors.centerIn: parent
    z:0
    property real progress: 0.0
    property alias trash_type_icon: icon.source
    property alias color1: progress_rectangle_1.color
    property alias color2: progress_rectangle_2.color

    NumberAnimation {target: progress;from: 0;  to: progress; duration: 300}

    Image {
        id: mask
        anchors.centerIn: parent
        source: "qrc:/src/pages/storegePage/dustbin_mask.png"
//        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true
        visible: false
        fillMode: Image.PreserveAspectFit
    }

    Rectangle {
        id: root
        implicitHeight: parent.width
        implicitWidth: parent.height
        anchors.centerIn: parent
        color: Qt.rgba(184 / 256, 184 / 256, 184 / 256, 1)
        smooth: true
        visible: false

        Rectangle {
            y: 17.68 / 253 * parent.height

            width: parent.width
            height: 19.88 / 253 * parent.height
            border.color: "black"
            color: Qt.rgba(138 / 256, 138 / 256, 138 / 256, 1)
            layer.enabled: true
            Rectangle {
                id: progress_rectangle_2

                anchors.bottom: parent.bottom
                width: parent.width
                height: progress_rectangle_1.height - (root.height - parent.y - parent.height) < 0 ?
                            0 : progress_rectangle_1.height - (root.height - parent.y - parent.height)
            }
        }

        Rectangle {
            id: progress_rectangle_1
            opacity: 1
            anchors.bottom: parent.bottom
            width: parent.width
            height: progress * parent.height
        }

    }

    OpacityMask {
        source: root
        maskSource: mask
        anchors.fill:parent
    }

    Image {
        id: icon
        anchors.horizontalCenter: parent.horizontalCenter
        width:parent.width * 0.4
        anchors.topMargin: 0.18 * parent.height
        anchors.top: parent.top
        height: width
        smooth: true
    }
}

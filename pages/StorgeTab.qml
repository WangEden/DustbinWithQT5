import QtQuick 2.15
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.15
import "../qmlUtils" as Utils

Item {
    id: storgeTab
    anchors.fill:parent
    property real progress1: 0.45
    property real progress2: 0.68
    property real progress3: 0.43
    property real progress4: 0.21

    Rectangle {
        width: parent.width
        height: parent.height
        color: "transparent"
        Rectangle {
            id: storgeTab_root
            width: 0.888 * parent.width
            height: 0.533 * width
//            border.color: "black"
            anchors.centerIn: parent
            color: "transparent"
            Rectangle {
                id: storgeTab_headBar
                width: parent.width
                height: 0.212 * parent.height
                anchors.top: parent.top
//                border.color: "black"
                color: "transparent"
                Rectangle {
                    id: storgeTab_headBar_headline
                    height: 0.275 * parent.height
                    width: parent.width
//                    border.color: "black"
                    color: "transparent"
                    Label{
                        background:Rectangle{
                            color: "transparent"
                        }
                        color: "white"
                        font.bold: true
                        fontSizeMode: Text.Fit
                        font.family: "微软雅黑"
                        text: "垃圾桶存量"
                        anchors.left: parent.left
                    }
                }
            }
            Rectangle {
                id: dustbin
                width: parent.width
                height: 0.397 * parent.height
                anchors.top: storgeTab_headBar.bottom
//                border.color: "black"
                color: "transparent"
                Rectangle {
                    id: dustbin1
                    height: parent.height
                    width: parent.width / 4
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
//                    border.color: "black"
                    color: "transparent"
                    Utils.DustbinProgressBar {
                        progress: progress1
                        trash_type_icon:"qrc:/resource/pages/storegePage/trash_type_recylce.png"
                        color1:Qt.rgba(62  / 256, 116 / 256, 208 / 256, 1)
                        color2:Qt.rgba(159 / 256, 46  / 256, 51  / 256, 1)
                    }

                }
                Rectangle {
                    id: dustbin2
                    height: parent.height
                    width: parent.width / 4
                    anchors.left: dustbin1.right
                    anchors.verticalCenter: parent.verticalCenter
//                    border.color: "black"
                    color: "transparent"
                    Utils.DustbinProgressBar {
                        progress: progress2
                        trash_type_icon:"qrc:/resource/pages/storegePage/trash_type_recylce.png"
                        color1:Qt.rgba(227 / 256, 65 / 256, 63 / 256, 1)
                        color2:Qt.rgba(159 / 256, 46 / 256, 51 / 256, 1)
                    }
                }
                Rectangle {
                    id: dustbin3
                    height: parent.height
                    width: parent.width / 4
                    anchors.right: dustbin4.left
                    anchors.verticalCenter: parent.verticalCenter
//                    border.color: "black"
                    color: "transparent"
                    Utils.DustbinProgressBar {
                        progress: progress3
                        trash_type_icon:"qrc:/resource/pages/storegePage/trash_type_recylce.png"
                        color1:Qt.rgba(172 / 256, 51 / 256, 193 / 256, 1)
                        color2:Qt.rgba(159 / 256, 46 / 256, 51  / 256, 1)
                    }
                }
                Rectangle {
                    id: dustbin4
                    height: parent.height
                    width: parent.width / 4
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
//                    border.color: "black"
                    color: "transparent"
                    Utils.DustbinProgressBar {
                        progress: progress4
                        trash_type_icon:"qrc:/resource/pages/storegePage/trash_type_recylce.png"
                        color1:Qt.rgba(227 / 256, 65 / 256, 63 / 256, 1)
                        color2:Qt.rgba(159 / 256, 46 / 256, 51 / 256, 1)
                    }
                }
            }
            Rectangle {
                width: parent.width
                anchors.top: dustbin.bottom
                anchors.bottom: parent.bottom
//                border.color: "black"
                color: "transparent"
                Rectangle {
                    id: dustbin_prograss_container
                    width: parent.width
                    height: parent.height / 3
                    anchors.verticalCenter: parent.verticalCenter
//                    border.color: "black"
                    color: "transparent"
                    Row {
                    //    anchors.centerIn: parent
                        anchors.fill:parent
                        spacing: parent.width / 25
                        leftPadding: parent.width / 25
                        rightPadding: parent.width / 25
                        Rectangle {
                            id: dustbin_prograss_1
                            width: parent.width / 5
                            height: parent.height
                        //    anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
//                            border.color: "black"
                            color: "transparent"
                            Utils.RectangleProgressBar {
                                id:rectangle_progress_1
                                text: "干垃圾"
                                progress: progress1
                            }
                        }
                        Rectangle {
                            id: dustbin_prograss_2
                            width: parent.width / 5
                            height: parent.height
//                                        anchors.left: dustbin_prograss_1.right
                            anchors.verticalCenter: parent.verticalCenter
//                            border.color: "black"
                            color: "transparent"
                            Utils.RectangleProgressBar {
                                id:rectangle_progress_2
                                text: "湿垃圾"
                                progress: progress2

                            }
                        }
                        Rectangle {
                            id: dustbin_prograss_3
                            width: parent.width / 5
                            height: parent.height
//                                        anchors.right: dustbin_prograss_4.left
                            anchors.verticalCenter: parent.verticalCenter
//                            border.color: "black"
                            color: "transparent"
                            Utils.RectangleProgressBar {
                                id:rectangle_progress_3
                                text: "厨余垃圾"
                                progress: progress3
                            }
                        }
                        Rectangle {
                            id: dustbin_prograss_4
                            width: parent.width / 5
                            height: parent.height
//                                        anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
//                            border.color: "black"
                            color: "transparent"
                            Utils.RectangleProgressBar {
                                id:rectangle_progress_4
                                text: "有害垃圾"
                                progress: progress4
                            }
                        }
                    }
                }
            }
        }
    }
}

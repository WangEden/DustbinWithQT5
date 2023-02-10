import QtQuick 2.15
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.15
import "../qmlUtils" as Utils

Item {
    id: checkTab
    anchors.fill:parent
    Rectangle {
        width: parent.width
        height: parent.height
        color: "transparent"
        Rectangle {
            id: checkTab_root
            width: 0.88 * parent.width
            height: 0.485 * width
            // border.color: "black"
            anchors.centerIn: parent
            color: "transparent"
            Rectangle {
                // 左边的数据显示面板
                id: checkTab_panel_left
                height: parent.height
                width: 0.67 * height
                // border.color: "black"
                color: "transparent"
                anchors.left: parent.left
                Rectangle {
                    id: checkTab_panel_left_1
                    width: parent.width
                    height: 0.637 * width
                    // border.color: "black"
                    anchors.top: parent.top
                    color: "transparent"
                    Rectangle {
                        // 文字标签
                        id: checkTab_panel_left_1_words_panel
                        width: 0.31 * parent.width
                        height: 0.5 * parent.height
                        anchors.left: parent.left
                        anchors.top: parent.top
                        // border.color: "black"
                        color: "transparent"
                        Rectangle{
                            // 垃圾分类
                            width: parent.width
                            height: 0.5 * parent.height
                            anchors.top: parent.top
                            // border.color: "black"
                            color: "transparent"
                            Label{
                                background:Rectangle{
                                    color: "transparent"
                                }
                                color: "white"
                                font.bold: true
                                fontSizeMode: Text.Fit
                                font.family: "微软雅黑"
                                text: "垃圾分类"
                            }

                        }

                        Rectangle {
                            // 当前垃圾
                            width: parent.width
                            height: 0.5 * parent.height
                            anchors.bottom: parent.bottom
                            // border.color: "black"
                            color: "transparent"
                            Label{
                                background:Rectangle{
                                    color: "transparent"
                                }
                                color: Qt.rgba(1, 1, 1, 0.6)
                                font.bold: false
                                fontSizeMode: Text.Fit
                                font.family: "微软雅黑"
                                text: "当前垃圾"
                            }
                        }
                    }

                    Rectangle {
                        // 信息面板
                        id: checkTab_panel_left_1_data_panel
                        width: parent.width
                        height: 0.5 * parent.height
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        // border.color: "black"
                        color: Qt.rgba(92 / 256, 86 / 256, 86 / 256, 0.1)
                        radius: 10
                        Rectangle {
                            width: 0.24 * parent.width
                            height: 0.33 * parent.height
                            anchors.centerIn: parent
                            color: "transparent"
                            Text {
                                id: checkTab_panel_dustbin_which
                                color: Qt.rgba(1, 1, 1, 1)
                                font.bold: false
                                anchors.centerIn: parent
                                fontSizeMode: Text.Fit
                                font.family: "微软雅黑"
                                text: qsTr(" ")
                            }
                        }

                    }
                }
                Rectangle {
                    id: checkTab_panel_left_2
                    width: parent.width
                    height: 0.637 * width
                    // border.color: "black"
                    color: "transparent"
                    anchors.top: checkTab_panel_left_1.bottom
                    anchors.topMargin: 0.043 * parent.height
                    Rectangle {
                        // 文字标签
                        id: checkTab_panel_left_2_words_panel
                        width: 0.31 * parent.width
                        height: 0.5 * parent.height
                        anchors.left: parent.left
                        anchors.top: parent.top
                        // border.color: "black"
                        color: "transparent"
                        Rectangle {
                            // 分类类型
                            width: parent.width
                            height: 0.5 * parent.height
                            anchors.bottom: parent.bottom
                            // border.color: "black"
                            color: "transparent"
                            Label{
                                background:Rectangle{
                                    color: "transparent"
                                }
                                color: Qt.rgba(1, 1, 1, 0.6)
                                font.bold: false
                                fontSizeMode: Text.Fit
                                font.family: "微软雅黑"
                                text: "分类类型"
                            }
                        }
                    }

                    Rectangle {
                        // 信息面板
                        id: checkTab_panel_left_2_data_panel
                        width: parent.width
                        height: 0.5 * parent.height
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        // border.color: "black"
                        color: Qt.rgba(92 / 256, 86 / 256, 86 / 256, 0.1)
                        radius: 10
                        Rectangle {
                            width: 0.24 * parent.width
                            height: 0.33 * parent.height
                            anchors.centerIn: parent
                            color: "transparent"
                            Text {
                                id: checkTab_panel_dustbin_type
                                anchors.centerIn: parent
                                color: Qt.rgba(1, 1, 1, 1)
                                font.bold: false
                                fontSizeMode: Text.Fit
                                font.family: "微软雅黑"
                                text: qsTr(" ")
                            }
                        }

                    }
                }
            }
            Rectangle {
                // 右边的摄像头画面
                id: checkTab_panel_right
                height: parent.height
                width: 1.34 * height
                // border.color: "black"
                anchors.right: parent.right
                color: "transparent"
                Rectangle {
                    // 摄像头画面
                    id: checkTab_panel_right_1
                    width: parent.width
                    height: 0.687 * width
                    // border.color: "black"
                    anchors.top: parent.top
                    radius: 24
                    gradient: Gradient {
                        GradientStop {position: 0; color: Qt.rgba(36 / 256, 19 / 256, 72 / 256, 1)}
                        GradientStop {position: 0.46; color: Qt.rgba(25 / 256, 15 / 256, 51 / 256, 1)}
                        GradientStop {position: 1; color: Qt.rgba(47 / 256, 21 / 256, 77 / 256, 0.48)}
                    }
                    Rectangle{
                        id:r
                        anchors.fill: parent;
                        color: "transparent"
                        objectName: "CameraWindowContainer"

                        // 声明信号
//                        signal openCamera(int status, string s)

                        // 摄像头画面接口
//                        CameraWindow {
//                            id:camera_window
//                            iValue: 10
//                            sString: "camera"
//                            objectName: "CameraWindow"
//                            Component.onCompleted: {
//                                console.log(iValue, sString)
//                            }
//                        }
//                        Button {
//                            onClicked: {
//                                r.openCamera(10, "请求打开摄像头");
//                            }
//                        }

                        // 连接打开摄像头的信号和槽
//                        Connections {
//                            target: r
//                            function onOpenCamera(status, s){
//                                camera_window.camera_open(status, s)
//                            }
//                        }
//                        Component.onCompleted: {
//                            openCamera.connect(camera_window.camera_open())
//                        }

                    }
                }
                Rectangle {
                    // 阴影
                    id: checkTab_panel_right_2
                    width: parent.width
                    height: 0.056 * width
                    // border.color: "black"
                    anchors.bottom: parent.bottom
                    radius: 24
                    opacity:0.3
                    gradient: Gradient {
                        GradientStop {position: 0; color: Qt.rgba(47 / 256, 21 / 256, 77 / 256, 0.48)}
                        GradientStop {position: 0.54; color: Qt.rgba(25 / 256, 15 / 256, 51 / 256, 1)}
                        GradientStop {position: 1; color: Qt.rgba(36 / 256, 19 / 256, 72 / 256, 1)}
                    }
                }
            }
        }
    }
}

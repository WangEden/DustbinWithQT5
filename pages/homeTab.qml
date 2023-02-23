import QtQuick 2.15
import QtGraphicalEffects 1.15
import "../qmlUtils" as Utils

Item {
    id: homeTab
    anchors.fill:parent
    property int status
    signal scenechange()

//    property alias scene_state: scene.scene_state
    Rectangle {
        width: parent.width
        height: parent.height
        color: "transparent"
        Rectangle {
            id: homeTab_root
            height: 0.625 * parent.height
            width: 0.74 * parent.width
//            border.color: "yellow"
            color: "transparent"
            anchors.centerIn: parent
            Row {

            }

            Rectangle {
                // 第一块面板
                id: card_1_scene
                height: parent.height
                width: 2 * height / 3
                anchors.left: parent.left
                clip:true
                z:2
//                border.color: "black"
                color: "transparent"
                Rectangle {
                    id: card_1_scene_panel
                    width: parent.width
                    height: 5.5 * width / 4
                    radius: 12
                    anchors.top: parent.top
                    clip: true
                    z:3
//                    border.color: "black"
                    //color:"transparent"
                    layer.enabled: true
                    layer.effect: DropShadow {
                        color: Qt.rgba(0, 0, 0, 0.25)
                        samples:12
                        horizontalOffset: 5
                        verticalOffset: 4
                        radius: 48
                        spread: 0.001
                    }
                    gradient: Gradient {
                        GradientStop { position: 0; color: Qt.rgba(95 / 256, 66 / 256, 128 / 256, 0.9)}
                        GradientStop { position: 0.5; color: Qt.rgba(26 / 256, 15 / 256, 51 / 256, 1)}
                        GradientStop { position: 1; color: Qt.rgba(36 / 256, 19 / 256, 72 / 256, 1)}
                    }
                    Rectangle {
                        width:parent.width
                        height:parent.height / 4
//                        anchors.topMargin: 27
                        color: "transparent"
//                        border.color: "blue"
                        y:parent.height / 4
                        z:4
                        Image{
                            anchors.fill: parent
                            opacity: 0.6
                            fillMode: Image.PreserveAspectCrop
                            source:"qrc:/resource/pages/homePage/card_1_scene_background.png"
                            LinearGradient {
                                anchors.fill: parent
                                source:parent
                                start: Qt.point(0.5 * parent.width, 0)
                                end:Qt.point(0.5 * parent.width, parent.height)
                                gradient: Gradient {
                                    GradientStop { position: 0; color: Qt.rgba(95 / 256, 66 / 256, 128 / 256, 0.9)}
                                    GradientStop { position: 0.7; color: Qt.rgba(26 / 256, 15 / 256, 51 / 256, 0.5)}
                                    GradientStop { position: 1.2; color: Qt.rgba(36 / 256, 19 / 256, 72 / 256, 0.1)}
                                }

                            }

                        }
                    }
                    Rectangle {
                        width:parent.width
                        height:parent.height / 3
                        anchors.topMargin: 20
                        color: "transparent"
//                        border.color: "yellow"
                        y:parent.height / 4
                        z:5
                        Image {
                            height: parent.height
                            anchors.centerIn: parent
                            source: "qrc:/resource/pages/homePage/card_1_scene_logo.svg"
                            fillMode: Image.PreserveAspectFit
                        }
                    }
                    Rectangle {
//                        border.color: "green"
                        height: parent.height / 12
                        width: 0.7 * parent.width
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0.27 * parent.height
                        color: "transparent"
                        Utils.HomeTabSceneSignal {
                            // 当前场景
                            id: scene
//                            _scene_state: scene_state
                            _scene_state: "indoor"
                            _image_color_visible: false
                        }
                    }
                    Rectangle {
                        height: 0.16 * parent.height
                        width: parent.width / 2
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0.05 * parent.height
                        color: "transparent"
//                        border.color: "yellow"
                        Utils.HoverPressButton {
                            onSwitchscene: {
                                if(status == 1){
                                    scene._scene_state = "indoor"
                                    scene._image_color_visible = false
                                }
                                else {
                                    scene._scene_state = "outdoor"
                                    scene._image_color_visible = true
                                }
//                                scenechange()
                                //
                                status = (status + 1) % 2
                                //
                            }

                        }
                    }
                }
                Rectangle {
                    id: card_1_scene_shadow
                    width: parent.width
                    height: 0.1125 * width
                    anchors.bottom: parent.bottom
//                    border.color: "black"
                    //color:"transparent"
                    radius: 24
                    opacity:0.3
                    gradient: Gradient {
                        GradientStop { position: 0.5; color: Qt.rgba(26 / 256, 15 / 256, 51 / 256, 1)}
                        GradientStop { position: 0; color: Qt.rgba(36 / 256, 19 / 256, 72 / 256, 1)}
                        GradientStop { position: 1; color: Qt.rgba(21 / 256, 5 / 256, 39 / 256, 0.9)}
                    }
                    layer.enabled: true
                    layer.effect: DropShadow {
                        color: Qt.rgba(0, 0, 0, 0.25)
                        samples:12
                        horizontalOffset: 5
                        verticalOffset: 4
                        radius: 48
                        spread: 0.001
                    }
                }
            }
            Rectangle {
                // 第二块面板
                id: card_2_battery
                height: parent.height
                width: 2 * height / 3
                anchors.right: parent.right
//                border.color: "black"
                color: "transparent"
                Rectangle {
                    id: card_2_battery_panel
                    width: parent.width
                    height: 5.5 * width / 4
                    radius: 12
                    anchors.top: parent.top
//                    border.color: "black"
                    //color:"transparent"
                    layer.enabled: true
                    layer.effect: DropShadow {
                        color: Qt.rgba(0, 0, 0, 0.25)
                        samples:12
                        horizontalOffset: 5
                        verticalOffset: 4
                        radius: 48
                        spread: 0.001
                    }
                    gradient: Gradient{
                        GradientStop { position: 0; color: Qt.rgba(29 / 256, 7 / 256, 55 / 256, 0.9)}
                        GradientStop { position: 0.75; color: Qt.rgba(26 / 256, 15 / 256, 51 / 256, 1)}
                        GradientStop { position: 1.2; color: Qt.rgba(36 / 256, 19 / 256, 72 / 256, 1)}
                    }
                    Rectangle {
                        width: 0.56 * parent.width
                        height: width
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: 0.22 * parent.height
//                        border.color:"blue"
                        color: "transparent"
                        Utils.BatteryPanel {
                            rate: 1
                        }
                    }

                    Rectangle {
                        width: parent.width / 4 * 3
                        height: parent.height * 0.15
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0.15 * parent.height
//                        border.color: "yellow"
                        color: "transparent"
                        Text {
                            text: qsTr("电池电量")
                            anchors.centerIn: parent
                            verticalAlignment: Text.AlignHCenter
                            font.family: "微软雅黑"
                            font.bold: true
                            font.pixelSize: 20
                            font.weight: Font.DemiBold
                            fontSizeMode: Text.Fit
                            color: "#99ffffff"
                        }
                        Canvas {
                            anchors.bottom: parent.bottom
                            anchors.fill: parent
                            onPaint: {
                                var context = getContext("2d")
                                var gradient = context.createLinearGradient(0,0,parent.width,0)
                                gradient.addColorStop(0.0, Qt.rgba(110 / 256, 18 / 256, 235 / 256, 0.01))
                                gradient.addColorStop(0.5, Qt.rgba(100 / 256, 24 / 256, 201 / 256, 1))
                                gradient.addColorStop(1.0, Qt.rgba(88  / 256, 37 / 256, 158 / 256, 0))
                                context.fillStyle = gradient
                                context.fillRect(0, 0.96 * parent.height, parent.width, parent.height)
                            }
                        }
                    }


                }
                Rectangle {
                    id: card_2_battery_shadow
                    width: parent.width
                    height: 0.1125 * width
                    anchors.bottom: parent.bottom
//                    border.color: "black"
                    // color:"transparent"
                    radius: 24
                    opacity: 0.3
                    layer.effect: DropShadow {
                        color: Qt.rgba(0, 0, 0, 0.25)
                        samples:12
                        horizontalOffset: 5
                        verticalOffset: 4
                        radius: 48
                        spread: 0.001
                    }
                    gradient: Gradient{
                        GradientStop { position: 0; color: Qt.rgba(36 / 256, 19 / 256, 72 / 256, 0.9)}
                        GradientStop { position: 0.5; color: Qt.rgba(26 / 256, 15 / 256, 51 / 256, 1)}
                        GradientStop { position: 1; color: Qt.rgba(21 / 256, 5 / 256, 39 / 256, 1)}
                    }
                }
            }
        }
    }
}

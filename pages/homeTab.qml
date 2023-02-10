import QtQuick 2.15
import QtGraphicalEffects 1.15
import "../qmlUtils" as Utils

Item {
    id: homeTab
    anchors.fill:parent
    Rectangle {
        width: parent.width
        height: parent.height
        color: "transparent"
        Rectangle {
            id: homeTab_root
            height: 0.625 * parent.height
            width: 0.74 * parent.width
            border.color: "black"
            color: "transparent"
            anchors.centerIn: parent
            Rectangle {
                id: card_1_scene
                height: parent.height
                width: 2 * height / 3
                anchors.left: parent.left
                clip:true
                z:2
                border.color: "black"
                color: "transparent"
                Rectangle {
                    id: card_1_scene_panel
                    width: parent.width
                    height: 5.5 * width / 4
                    radius: 12
                    anchors.top: parent.top
                    clip: true
                    z:3
                    border.color: "black"
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
                        anchors.topMargin: 27
                        color: "transparent"
                        y:parent.height / 4
                        z:4
                        Image{
                            anchors.fill: parent
                            opacity: 0.4
                            fillMode: Image.PreserveAspectCrop
                            source:"qrc:/src/pages/homePage/card_1_scene_background.png"
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

                    }
                }
                Rectangle {
                    id: card_1_scene_shadow
                    width: parent.width
                    height: 0.1125 * width
                    anchors.bottom: parent.bottom
                    border.color: "black"
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
                id: card_2_battery
                height: parent.height
                width: 2 * height / 3
                anchors.right: parent.right
                border.color: "black"
                color: "transparent"
                Rectangle {
                    id: card_2_battery_panel
                    width: parent.width
                    height: 5.5 * width / 4
                    radius: 12
                    anchors.top: parent.top
                    border.color: "black"
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

                }
                Rectangle {
                    id: card_2_battery_shadow
                    width: parent.width
                    height: 0.1125 * width
                    anchors.bottom: parent.bottom
                    border.color: "black"
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

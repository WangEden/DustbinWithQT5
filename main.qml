import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.VirtualKeyboard 2.15
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11
import QtGraphicalEffects 1.15
import "./qmlUtils" as Utils
import "./pages"

Window {
    id: window
    visible: true
    width: SCREEN_WIDTH
    height: SCREEN_HEIGHT
//    maximumWidth: 1024
//    maximumHeight: 600
//    minimumWidth: 512
//    minimumHeight: 300
//    title: qsTr("demo")
//    flags: Qt.Window
    objectName: "window"
    Rectangle {
        id: container
        width: parent.width
        height: parent.height
        z: 0
        objectName: "container"
        property bool firstPressed: true
        property bool secondPressed: false
        property bool thirdPressed: false
        property bool forthPressed: false

        // 左边的菜单栏
        Rectangle {
            id: barRect
            width: 0.1 * parent.width
            height: parent.height
            radius: 10
            anchors.verticalCenter: parent.verticalCenter
            color: "#00000000"
            clip: true
            smooth: true
            z: 1
            Image {
                id: root_bg
                anchors.fill: parent
                fillMode: Image.PreserveAspectCrop
                source: "qrc:/src/tabBar/root_bg.png"
            }

            // 左边的菜单栏的内部框架
            Rectangle {
                z: 2
                id: root
                width: 0.6 * parent.width
                height: 0.76 * parent.height
                anchors.centerIn: parent
                // border.color: "black";
                color: "transparent"
                Rectangle {
                    // 菜单栏的第一个选项
                    z: 3
                    id: homeTabBar
                    width: root.width
                    height: 0.194 * root.height
                    anchors.top: parent.top
                    color: "transparent"
                    // border.color: "black";
                    Utils.NavigationBar {
                        id:homeTabBarIcon
                        icon: "qrc:/src/tabBar/home_gray.svg"
                        text: "首页"
                        state: "choosed"
                        onTabclick:{
                            if(homeTabBarIcon.state != "choosed"){
                                page_loader.source="/pages/HomeTab.qml"
                                page_loader_animation.start()
                                homeTabBarIcon.state = "choosed"
                                checkTabBarIcon.state = "unchoosed"
                                storgeTabBarIcon.state = "unchoosed"
                                moreTabBarIcon.state = "unchoosed"
                                bg_color_1.visible = true
                                bg_color_2.visible = false
                                bg_color_3.visible = false
                                bg_color_4.visible = false
                            }
                        }
                    }

                }
                Rectangle {
                    // 菜单栏的第二个选项
                    z: 3
                    id: checkTabBar
                    width: root.width
                    height: 0.194 * root.height
                    anchors.top: homeTabBar.bottom
                    anchors.topMargin: 0.07 * root.height
                    color: "transparent"
                    Utils.NavigationBar {
                        id:checkTabBarIcon
                        icon: "qrc:/src/tabBar/check_gray.svg"
                        text: "查看"
                        state: "unchoosed"
                        onTabclick:{
                            if(checkTabBarIcon.state != "choosed"){
                                page_loader.source="/pages/CheckTab.qml"
                                page_loader_animation.start()
                                homeTabBarIcon.state = "unchoosed"
                                checkTabBarIcon.state = "choosed"
                                storgeTabBarIcon.state = "unchoosed"
                                moreTabBarIcon.state = "unchoosed"
                                bg_color_1.visible = false
                                bg_color_2.visible = true
                                bg_color_3.visible = false
                                bg_color_4.visible = false
                            }
                        }
                    }
                }
                Rectangle {
                    // 菜单栏的第三个选项
                    z:3
                    id: storgeTabBar
                    width: root.width
                    height: 0.194 * root.height
                    anchors.bottom: moreTabBar.top
                    anchors.bottomMargin: 0.07 * root.height
                    color: "transparent"
                    Utils.NavigationBar {
                        id:storgeTabBarIcon
                        icon: "qrc:/src/tabBar/storge_gray.svg"
                        text: "存量"
                        state: "unchoosed"
                        onTabclick:{
                            if(storgeTabBarIcon.state != "choosed"){
                                page_loader.source="/pages/StorgeTab.qml"
                                page_loader_animation.start()
                                homeTabBarIcon.state = "unchoosed"
                                checkTabBarIcon.state = "unchoosed"
                                storgeTabBarIcon.state = "choosed"
                                moreTabBarIcon.state = "unchoosed"
                                bg_color_1.visible = false
                                bg_color_2.visible = false
                                bg_color_3.visible = true
                                bg_color_4.visible = false
                            }
                        }
                    }
                }
                Rectangle {
                    // 菜单栏的第四个选项
                    z:3
                    id: moreTabBar
                    width: root.width
                    height: 0.194 * root.height
                    anchors.bottom: parent.bottom
                    color: "transparent"
                    Utils.NavigationBar {
                        id:moreTabBarIcon
                        icon: "qrc:/src/tabBar/more_gray.svg"
                        text: "更多"
                        state: "unchoosed"
                        onTabclick:{
                            if(moreTabBarIcon.state != "choosed"){
                                page_loader.source="/pages/MoreTab.qml"
                                page_loader_animation.start()
                                homeTabBarIcon.state = "unchoosed"
                                checkTabBarIcon.state = "unchoosed"
                                storgeTabBarIcon.state = "unchoosed"
                                moreTabBarIcon.state = "choosed"
                                bg_color_1.visible = false
                                bg_color_2.visible = false
                                bg_color_3.visible = false
                                bg_color_4.visible = true
                            }
                        }
                    }
                }
            }
        }

        // 右边页面的框架
        Rectangle {
            id: page
            width: 0.9 * parent.width
            height: parent.height
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            z: 1
            color:"transparent"
            Loader {
                id:page_loader
                anchors.fill: parent
                source: "/pages/HomeTab.qml"
//                onStatusChanged: {
//                    console.log("status:", status)
//                }
                NumberAnimation {
                    id: page_loader_animation
                    target: page_loader.item
                    property: "opacity"
                    from: 0.2
                    to:1
                    duration: 250
                }

            }
        }

        // 设置线性渐变填充背景
        Utils.LinearGradientBackground {
            id: bg_color_1
            color1: Qt.rgba(41 / 256, 24 / 256, 63 / 256, 1)
            color2: Qt.rgba(5 / 256, 2 / 256, 30 / 256, 1)
        }
        Utils.LinearGradientBackground {
            id: bg_color_2
            color1: Qt.rgba(41 / 256, 24 / 256, 63 / 256, 1)
            color2: Qt.rgba(5 / 256, 2 / 256, 30 / 256, 1)

        }
        Utils.LinearGradientBackground {
            id: bg_color_3
            color1: Qt.rgba(41 / 256, 18 / 256, 71 / 256, 1)
            color2: Qt.rgba(5 / 256, 2 / 256, 30 / 256, 1)
        }
        Utils.LinearGradientBackground {
            id: bg_color_4
            color1: Qt.rgba(42 / 256, 19 / 256, 71 / 256, 1)
            color2: Qt.rgba(5 / 256, 2 / 256, 30 / 256, 1)
        }
    }
}


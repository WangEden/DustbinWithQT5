import QtQuick 2.15
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11
import QtGraphicalEffects 1.15
import "../qmlUtils" as Utils

Item {
    id: moreTab
    anchors.fill:parent
    Rectangle {
        width: parent.width
        height: parent.height
        color: "transparent"
        Rectangle {
            id: moreTab_root
            height: 0.82 * parent.height
            width: 0.92 * parent.width
            anchors.centerIn: parent
            // border.color: "black"
            color:"transparent"
            Rectangle {
                id: moreTab_menu
                width: 0.241 * parent.width
                height: parent.height
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                // border.color: "black"
                color:"transparent"

                // List
                Rectangle {
                    id: moreTab_menu_list_container
                    width: 0.768 * parent.width
                    height: 0.776 * parent.height
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    // border.color: "black"
                    color:"transparent"
                    Flickable {
                        id: moreTab_menu_list_flickable
                        anchors.fill: parent
                        // contentWidth: column.width
                        // contentHeight: moreTab_menu_list_column.height
                        clip: true
                        Column {
                            id: moreTab_menu_list_column
                            anchors.fill: parent
                            spacing: 0.138 * parent.height

//                            ListView {
//                                property int lastIndex: 0;
//                                anchors.fill: parent
//                                spacing: 0.138 * parent.height
//                                model:ListModel {
//                                    ListElement {iconURL: "qrc:/src/pages/morePage/switch.png";     infoName:"开关"; status:"choosed"}
//                                    ListElement {iconURL: "qrc:/src/pages/morePage/pwd.png";        infoName:"密码"; status:"unchoosed"}
//                                    ListElement {iconURL: "qrc:/src/pages/morePage/dev.png";        infoName:"设备"; status:"unchoosed"}
//                                    ListElement {iconURL: "qrc:/src/pages/morePage/feelback.png";   infoName:"反馈"; status:"unchoosed"}
//                                    ListElement {iconURL: "qrc:/src/pages/morePage/about.png";      infoName:"帮助"; status:"unchoosed"}
//                                }
//                                delegate: Rectangle {
//                                    height: 0.089 * moreTab_menu_list_container.height
//                                    width: moreTab_menu_list_container.width
//                                    // border.color: "black"
//                                    color:"transparent"
//                                    Utils.RowNavigationBar {
//                                        id: moreTab_1
//                                        icon: iconURL
//                                        info: infoName
//                                        state: status
//                                        onTabclick:{
//                                            moretab_page.currentIndex = index;
//                                            state = "choosed"
//                                            moretab_page.currentIndex = 0
//                                            moreTab_1.state = "choosed"
//                                            moreTab_2.state = "unchoosed"
//                                            moreTab_3.state = "unchoosed"
//                                            moreTab_4.state = "unchoosed"
//                                            moreTab_5.state = "unchoosed"
//                                        }
//                                    }
//                                }
//                            }

                            Rectangle {
                                height: 0.089 * moreTab_menu_list_container.height
                                width: moreTab_menu_list_container.width
                                // border.color: "black"
                                color:"transparent"
                                Utils.RowNavigationBar {
                                    id: moreTab_1
                                    icon:"qrc:/resource/pages/morePage/switch.png"
                                    info:"开关"
                                    state: "choosed"
                                    onTabclick:{
                                        moretab_page.currentIndex = 0
                                        moreTab_1.state = "choosed"
                                        moreTab_2.state = "unchoosed"
                                        moreTab_3.state = "unchoosed"
                                        moreTab_4.state = "unchoosed"
                                        moreTab_5.state = "unchoosed"
                                    }
                                }

                            }
                            Rectangle {
                                height: 0.089 * moreTab_menu_list_container.height
                                width: moreTab_menu_list_container.width
                                // border.color: "black"
                                color:"transparent"
                                Utils.RowNavigationBar {
                                    id: moreTab_2
                                    icon:"qrc:/resource/pages/morePage/pwd.png"
                                    info:"密码"
                                    onTabclick:{
                                        moretab_page.currentIndex = 1
                                        moreTab_1.state = "unchoosed"
                                        moreTab_2.state = "choosed"
                                        moreTab_3.state = "unchoosed"
                                        moreTab_4.state = "unchoosed"
                                        moreTab_5.state = "unchoosed"
                                    }
                                }
                            }
                            Rectangle {
                                height: 0.089 * moreTab_menu_list_container.height
                                width: moreTab_menu_list_container.width
                                // border.color: "black"
                                color:"transparent"
                                Utils.RowNavigationBar {
                                    id: moreTab_3
                                    icon:"qrc:/resource/pages/morePage/dev.png"
                                    info:"设备"
                                    onTabclick:{
                                        moretab_page.currentIndex = 2
                                        moreTab_1.state = "unchoosed"
                                        moreTab_2.state = "unchoosed"
                                        moreTab_3.state = "choosed"
                                        moreTab_4.state = "unchoosed"
                                        moreTab_5.state = "unchoosed"
                                    }
                                }
                            }
                            Rectangle {
                                height: 0.089 * moreTab_menu_list_container.height
                                width: moreTab_menu_list_container.width
                                // border.color: "black"
                                color:"transparent"
                                Utils.RowNavigationBar {
                                    id: moreTab_4
                                    icon:"qrc:/resource/pages/morePage/feelback.png"
                                    info:"反馈"
                                    onTabclick:{
                                        moretab_page.currentIndex = 3
                                        moreTab_1.state = "unchoosed"
                                        moreTab_2.state = "unchoosed"
                                        moreTab_3.state = "unchoosed"
                                        moreTab_4.state = "choosed"
                                        moreTab_5.state = "unchoosed"
                                    }
                                }
                            }
                            Rectangle {
                                height: 0.089 * moreTab_menu_list_container.height
                                width: moreTab_menu_list_container.width
                                // border.color: "black"
                                color:"transparent"
                                Utils.RowNavigationBar {
                                    id: moreTab_5
                                    icon:"qrc:/resource/pages/morePage/about.png"
                                    info:"帮助"
                                    onTabclick:{
                                        moretab_page.currentIndex = 4
                                        moreTab_1.state = "unchoosed"
                                        moreTab_2.state = "unchoosed"
                                        moreTab_3.state = "unchoosed"
                                        moreTab_4.state = "unchoosed"
                                        moreTab_5.state = "choosed"
                                    }
                                }
                            }
//                            populate: Transition {
//                                NumberAnimation { properties: "x"; from: -300; duration: 300;easing.type:Easing.OutBounce}
//                            }

                        }
                    }
                }
                // bg
                Image {
                    id: root_bg
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/resource/tabBar/root_bg.png"
                }
            }
            Rectangle {
                id: moreTab_panel
                width: 0.710 * parent.width
                height: parent.height
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                // border.color: "black"
                color:"transparent"
                StackLayout {
                    id:moretab_page
                    currentIndex: 0
                    anchors.fill: parent
                    // List
                    Item {
                        Flickable {
                            id: moreTab_panel_flickable
                            anchors.fill: parent
                            contentHeight: moreTab_panel_column.height
                            clip: true
                            Column {
                                id: moreTab_panel_column
                                spacing: 0.1 * moreTab_panel_flickable.height
                                Rectangle {
                                    width: moreTab_panel_flickable.width
                                    height: 0.3 * moreTab_panel_flickable.height
                                    border.color: "black"
                                    color:"transparent"
                                    Column {
                                        anchors.top: parent.top
                                        anchors.bottom:essential_panel.top
                                        Label{
                                            background:Rectangle{
                                                color: "transparent"
                                            }
                                            color: Qt.rgba(1, 1, 1, 1)
                                            font.bold: true
                                            fontSizeMode: Text.Fit
                                            font.family: "微软雅黑"
                                            text: "基本"
                                        }
                                        Label{
                                            background:Rectangle{
                                                color: "transparent"
                                            }
                                            color: Qt.rgba(1, 1, 1, 0.4)
                                            font.bold: false
                                            fontSizeMode: Text.Fit
                                            font.family: "微软雅黑"
                                            text: "蓝牙"
                                        }
                                    }
                                    Rectangle {
                                        id:essential_panel
                                        width: parent.width * 0.75
                                        height: parent.height * 0.4
                                        color:"transparent"
                                        anchors.bottom: parent.bottom
                                        Utils.SlideSwitch {
                                            optionNum: 3
                                            current_index:0
                                            optionName: ['关闭', '开启', '自动']
                                        }
                                    }


                                }
                                Rectangle {
                                    width: moreTab_panel_flickable.width
                                    height: 0.3 * moreTab_panel_flickable.height
                                    border.color: "black"
                                    color:"transparent"
                                    Rectangle {
                                        width: parent.width
                                        height: parent.height * 0.4
                                        color:"transparent"
                                        anchors.bottom: parent.bottom
                                        Utils.SlideSwitch {
                                            optionNum: 4
                                            current_index:3
                                            optionName: ['关闭', '开启', '自动', '呃呃']
                                        }
                                    }
                                }
                                Rectangle {
                                    width: moreTab_panel_flickable.width
                                    height: 0.3 * moreTab_panel_flickable.height
                                    border.color: "black"
                                    color:"transparent"

                                    Rectangle {
                                        width:  100
                                        height: 50
                                        radius: width / 2
                                        //
                                        Button {
                                            anchors.fill: parent
                                            onClicked: {
                                                Qt.quit()
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Item {

                    }
                    Item {

                    }
                    Item {

                    }
                    Item {

                    }


                }
            }
        }
    }
}

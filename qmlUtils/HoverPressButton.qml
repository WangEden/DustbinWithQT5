import QtQuick 2.15


Item {
    id: r
    anchors.fill: parent
    anchors.centerIn: parent
    property int parentWidth: parent.width
    property int parentHeight: parent.height
    property int lineWidth: 4
    property int xTerm1: r.parentWidth - r.parentHeight / 2
    property int yTerm1: r.parentHeight - r.lineWidth / 2
    property int xTerm2: r.parentHeight / 2
    property int yTerm2: r.lineWidth / 2
    property bool canva_init: true

    signal switchscene()
    signal pressedAnimation();
    signal releaseAnimation();

    Rectangle {
        height: parent.height
        width: parent.width
        radius: height / 2
        color: "#08ffffff"
        anchors.centerIn: parent
        Text {
            id:t
            text: "切换场景"
            opacity: 0.8
            anchors.centerIn: parent
            verticalAlignment: TextInput.AlignVCenter
            horizontalAlignment: TextInput.AlignHCenter
            font.pixelSize: 10
            fontSizeMode: Text.Fit
            minimumPixelSize: 5
            color: Qt.rgba(1, 1, 1, 0.8)
            font.bold: true
            font.family: "微软雅黑"
        }
        NumberAnimation {
            id:pressTextAnimation
            target: t
            properties: "opacity"
            from:0.8
            to: 0.2
            duration: 150
        }
        NumberAnimation {
            id:releaseTextAnimation
            target: t
            properties: "opacity"
            from:0.2
            to: 0.8
            duration: 150
        }
    }
    Canvas {
        id: canvas
        anchors.fill: parent
        z:1
        property int line_width: r.lineWidth
        property int line_x: r.parentHeight / 2
        property int line_y: line_width / 2
        property int dprogress1: 0              // 0 --> 50
        property int dprogress2: 0              // 0 --> 50

        onPaint: {
            var context = getContext("2d")
            var gradient = context.createLinearGradient(0,0,parent.width,0)
            gradient.addColorStop(0.0, Qt.rgba(110 / 256, 18 / 256, 235 / 256, 0))
            gradient.addColorStop(0.5, Qt.rgba(100 / 256, 24 / 256, 201 / 256, 1))
            gradient.addColorStop(1.0, Qt.rgba(88  / 256, 37 / 256, 158 / 256, 0))

//            context.clearRect(0, 0, parent.width, parent.height);
            context.lineCap = "butt";


            context.lineWidth = line_width

            if(canva_init){
                context.clearRect(0, 0, parent.width, parent.height);
                context.strokeStyle = "#FFD640A7"
                context.beginPath()
                context.moveTo(r.parentHeight / 2, line_width / 2)
                context.lineTo(r.parentWidth - r.parentHeight / 2, line_width / 2)
                context.arc(r.parentWidth - r.parentHeight / 2, r.parentHeight / 2,
                                r.parentHeight / 2 - line_width / 2,
                                -Math.PI / 2,
                                -Math.PI / 2 + 50 / 100 * 2 * Math.PI)
                context.moveTo(r.parentWidth - r.parentHeight / 2, r.parentHeight - line_width / 2)
                context.lineTo(r.parentHeight / 2, r.parentHeight - line_width / 2)
                context.arc(r.parentHeight / 2, r.parentHeight / 2,
                                r.parentHeight / 2 - line_width / 2,
                                Math.PI / 2,
                                Math.PI / 2 + 50 / 100 * 2 * Math.PI)
                context.stroke()
                canva_init = false
            }
            else {
                context.strokeStyle = "yellow"
                if(line_y == line_width / 2
                         && line_x <= r.xTerm1) {
                     // 圆边矩形第一段，直线
                     context.beginPath()
                     context.moveTo(r.parentHeight / 2, line_width / 2)
                     context.lineTo(line_x, line_y)
                     context.stroke()
                }
                else if(line_x > r.xTerm1
                         && line_y != r.yTerm1) {
                     // 圆边矩形第二段，弧线
                     context.beginPath()
                     context.arc(r.parentWidth - r.parentHeight / 2, r.parentHeight / 2,    // x, y
                                 r.parentHeight / 2 - line_width / 2,                      // r
                                 -Math.PI * 0.51,                                              // startAngle
                                 -Math.PI * 0.5 + dprogress1 / 100 * 2 * Math.PI)             // endAngle
                     context.stroke()
                }
                else if(line_y == r.yTerm1
                         && line_x >= r.xTerm2) {
                     // 圆边矩形第三段，直线
                     context.beginPath()
                     context.moveTo(r.parentWidth - r.parentHeight / 2, r.parentHeight - line_width / 2)
                     context.lineTo(line_x, line_y)
                     context.stroke()
                }
                else if(line_x < r.xTerm2
                         && line_y != r.yTerm2) {
                     context.beginPath()
                     context.arc(r.parentHeight / 2, r.parentHeight / 2,
                                 r.parentHeight / 2 - line_width / 2,
                                 Math.PI / 2,
                                 Math.PI / 2 + dprogress2 / 100 * 2 * Math.PI)
                     context.stroke()
                }

            }


        }
         Timer {
             id:timer
             repeat: true
             interval: 20
             running: false
             onTriggered: {
                 if(canvas.dprogress1 == 50)
                     canvas.line_y = r.yTerm1

                 if(canvas.line_y == canvas.line_width / 2
                         && canvas.line_x <= r.xTerm1) {
                     canvas.requestPaint()
                     canvas.line_x += 2
 //                    console.log("line1 point: " + canvas.line_x + " " + canvas.line_y + " " + r.xTerm1)
                 }
                 else if(canvas.line_x > r.xTerm1
                         && canvas.line_y < r.yTerm1
                         && canvas.dprogress1 < 50) {
                     canvas.dprogress1 += 2
                     canvas.requestPaint()
 //                    console.log("cycle1 point: " + canvas.line_x + " " + canvas.line_y + " dprogress1: " + canvas.dprogress1)
                 }
                 else if(canvas.line_y == r.yTerm1
                         && canvas.line_x >= r.xTerm2){
                     canvas.line_x -= 2
                     canvas.requestPaint()
 //                    console.log("line2 point: " + canvas.line_x + " " + canvas.line_y)
                 }
                 else if(canvas.line_x < r.xTerm2
                         && canvas.line_y > r.yTerm2
                         && canvas.dprogress2 < 50){
                     canvas.dprogress2 += 2
                     canvas.requestPaint()
 //                    console.log("cycle2 point: " + canvas.line_x + " " + canvas.line_y)
                 }
                 else {
 //                    console.log("end point: " + canvas.line_x + " " + canvas.line_y)
                        stop()
                        switchscene()
                        canva_init = true
                     canvas.requestPaint()
                 }
             }
         }

        function drawPath(context) {
            if(flag % 2){
                context.strokeStyle = "#FFD640A7"
            }
            else {
                context.strokeStyle = "#FFDA5CB2"
            }
            flag = (flag + 1) % 2
            context.stroke()
        }

    }

    MouseArea {
        anchors.fill: parent
        pressAndHoldInterval: 1000
        onPressed: {
            console.log("pressed")
            pressTextAnimation.start()
//            canvas.requestPaint()
            timer.restart()
            pressedAnimation()

        }
        onReleased: {
            console.log("released")
            releaseTextAnimation.start()
//            canvas.requestPaint()
            releaseAnimation()
            timer.stop()
            canvas.line_x = r.parentHeight / 2
            canvas.line_y = canvas.line_width / 2
            canvas.dprogress1 = 0
            canvas.dprogress2 = 0
            canva_init = true
            canvas.requestPaint()

        }
//        onPressAndHold: {
//            switchscene()
//        }
    }

//    Component.completed: {

//    }
}

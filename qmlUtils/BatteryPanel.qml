import QtQuick 2.15
import QtQml 2.15
import QtQuick.Controls 2.4

Item {
    id: control
    implicitHeight: parent.width
    implicitWidth: parent.height
    anchors.centerIn: parent

    property real rate: 0.6
    property string rate_sign: String("%1%").arg((rate * 100).toFixed(0))
    property int canvasWidth: parent.width

    Image {
        id: logo
        anchors.fill: parent
        source: "qrc:/resource/pages/homePage/card_2_battery_logo.svg"
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
    }

    Canvas {
        id: canvas
        width: canvasWidth
        height: canvasWidth

        property int progress: 0

        onPaint: {
            var context = getContext("2d");
            context.clearRect(0, 0, canvasWidth, canvasWidth);
            context.lineCap = "round";

            context.strokeStyle = "#ffddcc45"
            context.lineWidth = 4
            context.font = "bold 25px 微软雅黑"
            context.textAlign = "center";


            function draw_ring() {
                if(canvas.progress <= (rate * 100).toFixed(0)) {
                    context.fillStyle = "#ffffff"
                    context.font = "bold 25px 微软雅黑"
                    context.clearRect(canvasWidth / 4, canvasWidth / 4, canvasWidth / 4 * 3, canvasWidth / 4 * 3)
                    context.fillText(String("%1").arg(canvas.progress), canvasWidth / 2, canvasWidth * 0.55)

                    context.font = "bold 10px 微软雅黑"
                    context.fillText("%", canvasWidth * 0.7, canvasWidth * 0.65)
                    context.fillStyle = "#00000000"

                    context.save()
                    context.beginPath()
                    context.arc(canvasWidth / 2, canvasWidth / 2,
                                canvasWidth / 2 - context.lineWidth / 2,
                                Math.PI / 2,
                                Math.PI / 2 + progress / 100 * 2 * Math.PI)
                    context.stroke()
                    progress += 1
                }
                requestAnimationFrame(draw_ring)
            }
            requestAnimationFrame(draw_ring)
        }

    }

    RotationAnimation {
        id: rotation_animation
        target: logo
        to:logo.rotation + 10
        duration:  250
    }

    //用定时器刷新
    Timer {
        running: true
        repeat: true
        interval: 35
        onTriggered:{
            rotation_animation.start()
        }
    }
}

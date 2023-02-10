import QtQuick 2.15
import QtGraphicalEffects 1.15

LinearGradient {
    property color color1;
    property color color2;
    id: bg_color
    anchors.fill: parent
    source: parent
    start: Qt.point(0, 0)
    end: Qt.point(0, parent.height)
    visible: true
    gradient: Gradient {
        GradientStop {
            position: 0
            color: color1
        }
        GradientStop {
            position: 1
            color: color2
        }
    }
}

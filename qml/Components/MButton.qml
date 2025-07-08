import QtQuick
import UI.Assets

Rectangle {
    property string backgroundColor: Style.color.labelPrimary
    property string borderColor: Style.color.backgroundSecondary
    property bool bordered: false
    property alias label: txt

    color: backgroundColor
    border.color: borderColor
    border.width: bordered ? 2 : 0
    radius: 0

    Text {
        id: txt
        anchors.centerIn: parent
        text: ""
    }

    MouseArea {
        anchors.fill: parent
    }
}

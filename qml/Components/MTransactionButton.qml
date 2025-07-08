import QtQuick
import QtQuick.Layouts
import UI.Assets

Item {
    id: root
    property string backgroundColor: Style.color.labelPrimary
    Rectangle {
        anchors.fill: parent
        border {
            width: Style.size2
            color: Style.color.backgroundTetriary
        }
        radius: Style.size8
        color: root.backgroundColor
    }

}

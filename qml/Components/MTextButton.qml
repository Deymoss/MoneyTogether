import QtQuick
import UI.Assets 1.0

Item {
    id: root

    property alias label: label
    property alias icon: icon
    required property string image
    height: label.contentHeight
    width: label.contentWidth + 20

    Rectangle {
        anchors.fill: parent

        Text {
            id: label
            anchors {
                top: parent.top
            }
            font.pointSize: 14
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: root.text
        }

        Image {
            id: icon
            width: Style.size16
            height: Style.size16
            fillMode: Image.PreserveAspectFit
            anchors {
                left: label.right
                verticalCenter: label.verticalCenter
                leftMargin: Style.size4
            }
            source: root.image
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
        }
    }
}

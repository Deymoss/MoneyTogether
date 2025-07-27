import QtQuick
import QtQuick.Layouts
import UI.Assets

Item {
    id: root
    property string backgroundColor: Style.color.labelPrimary
    property string categoryColor: Style.color.labelPrimary
    property alias label: category
    property alias area: area

    Rectangle {
        anchors.fill: parent
        border.width: Style.size2
        border.color: Style.color.backgroundTetriary
        radius: Style.size8
        color: root.backgroundColor
    }

    RowLayout {
        anchors {
            left: parent.left
            right: parent.right
            verticalCenter: parent.verticalCenter
            leftMargin: Style.size16
            rightMargin: Style.size16
        }
        height: parent.height
        spacing: Style.size16

        RowLayout {
            spacing: Style.size16

            Rectangle {
                id: rect
                Layout.preferredWidth: Style.size32
                Layout.preferredHeight: width
                color: root.categoryColor
                radius: Style.size8
            }

            Text {
                id: category
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
            }
        }

        Item {
            Layout.fillWidth: true
        }

        RowLayout {
            spacing: Style.size16

            Text {
                id: cashValue
                text: "33 BYN"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
            }

            Text {
                id: percentvalue
                text: "33%"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
            }
        }
    }

    MouseArea {
        id: area
        anchors.fill: parent
        onClicked: {

        }
    }
}

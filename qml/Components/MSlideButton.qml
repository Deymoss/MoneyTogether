import QtQuick
import QtQuick.Layouts
import UI.Assets

Rectangle {
    property string activeColor: Style.color.labelPrimary
    property string backgroundColor: Style.color.backgroundSecondary
    property list<string> listModel: []
    property int currentIndex: 0

    color: backgroundColor

    ListView {
        anchors.fill: parent
        orientation: ListView.Horizontal
        delegate: MButton {

        }
    }
}

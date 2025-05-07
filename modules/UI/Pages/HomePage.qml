import QtQuick
import UI.Assets
Item {
    Component.onCompleted: {
        console.log("HomePage created, Style test: ", Style.size4)
    }
    Rectangle {
        anchors.centerIn: parent
        height: 40
        width: 40
        color: "blue"
        // MButton {

        // }
    }
}

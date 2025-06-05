import QtQuick
import UI.Assets
import UI.Components
Item {
    Component.onCompleted: {
        console.log("HomePage created, Style test: ", Style.size4)
    }
    MButton {
        anchors.centerIn: parent
        height: 40
        width: 100
    }
}

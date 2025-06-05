import QtQuick
import QtQuick.Controls
import UI.Assets

Button {
    Component.onCompleted: console.log("MButton created, Style test: ", Style.size4)
    Text {
        id: txt
        anchors.centerIn: parent
        text: "Modules works."
    }
}

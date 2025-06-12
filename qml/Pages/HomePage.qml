import QtQuick
import QtGraphs 1.0
import UI.Assets
import UI.Components
Item {
    Component.onCompleted: {
        console.log("HomePage created, Style test: ", Style.color.backgroundPrimary)
    }

    Rectangle {
        anchors.centerIn: parent
        height: Style.size48
        width: Style.size320
        radius: Style.size16
    }
}

import QtQuick
import QtGraphs 1.0
import UI.Assets
import UI.Components

Item {
    Component.onCompleted: {
        console.log("HomePage created, Style test: ", Style.color.backgroundPrimary)
    }
    MSlideButton {
        height: Style.size48
        width: Style.size320
        backgroundRadius: Style.size16
        anchors.centerIn: parent
        leftName: "Доходы"
        rightName: "Расходы"
    }


}

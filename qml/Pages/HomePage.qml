import QtQuick
import QtGraphs
import UI.Assets
import UI.Components

Item {
    Rectangle {
        anchors.fill: parent
        color: Style.color.backgroundPrimary
    }

    MTextButton {
        id: walletButton
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }
        label.text: "Зарплатная"
        label.font.pixelSize: Style.size24
        label.font.bold: true
        image: "qrc:/qt/qml/MoneyTogether/res/images/ic_arrow_expand.png"
    }

    MTextButton {
        id: amountButton
        anchors {
            top: walletButton.bottom
            topMargin: 12
            horizontalCenter: parent.horizontalCenter
        }
        label.text: "3458 BYN"
        label.font.pointSize: Style.size14
        label.font.weight: 500
        icon.height: Style.size12
        icon.width: Style.size12
        image: "qrc:/qt/qml/MoneyTogether/res/images/ic_edit.png"
    }

    MSlideButton {
        id: categoryButton
        anchors {
            top: amountButton.bottom
            topMargin: Style.size24
            horizontalCenter: parent.horizontalCenter
        }
        height: Style.size48
        width: Style.size320
        backgroundRadius: Style.size16
        leftName: "Доходы"
        rightName: "Расходы"
    }

    GraphsView {
        id: overallGraph
        anchors {
            top: categoryButton.bottom
            horizontalCenter: parent.horizontalCenter
            topMargin: Style.size28
        }
        theme: GraphsTheme {
            colorScheme: GraphsTheme.ColorScheme.Dark
            backgroundColor: "transparent"
        }
        height: Style.size320
        width: Style.size320

        PieSeries {
            id: pieOuter
            pieSize: 0.96
            holeSize: 0.6
            PieSlice {
                label: "Alpha"
                borderWidth: 2
                borderColor: Style.color.backgroundSecondary
                value: 33;
                color: "#B470C2"
            }
            PieSlice {
                label: "Epsilon"
                borderWidth: 2
                borderColor: Style.color.backgroundSecondary
                value: 33
                color: "#7D70C2"
            }
            PieSlice {
                label: "Psi"
                borderWidth: 2
                borderColor: Style.color.backgroundSecondary
                value: 33
                color: "#C27070"
            }
        }
    }
    Rectangle {
        anchors.centerIn: overallGraph
        width: Style.size120
        height: Style.size120
        radius: Style.size60
        z: 2
        color: Style.color.backgroundTetriary
        Text {
            anchors.centerIn: parent
            font {
                pixelSize: 20
                weight: 600
            }
            color: Style.color.labelPrimary
            text: "275 BYN"
        }
    }
}

import QtQuick
import QtGraphs 1.0
import UI.Assets
import UI.Components

Item {
    Rectangle {
        anchors.fill: parent
        color: Style.color.backgroundPrimary
    }

    MTextButton {
        id: wallet
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }
        label.text: "Зарплатная"
        label.font.pointSize: Style.size16
        label.font.bold: true
        image: "qrc:/qt/qml/MoneyTogether/res/images/ic_arrow_expand.png"
    }

    MTextButton {
        id: amount
        anchors {
            top: wallet.bottom
            topMargin: 12
            horizontalCenter: parent.horizontalCenter
        }
        label.text: "3458 BYN"
        label.font.pointSize: Style.size14
        icon.height: Style.size12
        icon.width: Style.size12
        image: "qrc:/qt/qml/MoneyTogether/res/images/ic_edit.png"
    }

    MSlideButton {
        anchors {
            top: amount.bottom
            topMargin: Style.size24
            horizontalCenter: parent.horizontalCenter
        }
        height: Style.size48
        width: Style.size320
        backgroundRadius: Style.size16
        leftName: "Доходы"
        rightName: "Расходы"
    }
}

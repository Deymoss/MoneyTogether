import QtQuick
import UI.Assets

Item {
    id: root
    property color primaryColor: Style.color.backgroundPrimary
    property color secondaryColor: Style.color.backgroundSecondary
    property int currentState: 0
    property int backgroundRadius: Style.size16
    property int margins: Style.size4
    property var buttonModel
    // required property string leftName
    // required property string rightName

    Rectangle {
        id: outerRect
        clip: true
        anchors.fill: parent
        radius: root.backgroundRadius
        color: root.secondaryColor

        ListView {
            id: listView
            model: root.buttonModel
            orientation: ListView.Horizontal
            highlightFollowsCurrentItem: true
            anchors {
                fill: parent
            }
            spacing: 0

            onCurrentItemChanged: {

                const item = listView.currentItem
                    if (!item) return

                    const itemX = item.x
                    const itemW = item.width
                    const currentX = highlightRect.x
                    const currentW = highlightRect.width

                    if (itemX > currentX) {
                        leftAnim.leftWidthPhase1 = (itemX + itemW) - currentX
                        leftAnim.leftXPhase2 = itemX
                        leftAnim.leftWidthPhase2 = itemW

                        leftAnim.stop()
                        leftAnim.start()
                    } else {
                        rightAnim.rightXPhase1 = itemX
                        rightAnim.rightWidthPhase1 = (currentX + currentW) - itemX
                        rightAnim.rightWidthPhase2 = itemW

                        rightAnim.stop()
                        rightAnim.start()
                    }
            }
            delegate: Rectangle {
                    width: outerRect.width / listView.count
                    height: outerRect.height
                    color: "transparent"
                    z: 2

                    Text {
                        anchors.centerIn: parent
                        text: modelData
                        color: listView.currentIndex === index ? "black" : "white"
                        font.pointSize: 12
                        z:3
                        Behavior on color {
                            ColorAnimation { duration: 150 }
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: listView.currentIndex = index
                    }
                }

            Rectangle {
                id: highlightRect
                x: listView.x
                width: root.width / listView.count
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                radius: root.backgroundRadius - root.margins/2
                color: root.primaryColor
                z:1
            }

            SequentialAnimation {
                id: leftAnim
                property real leftWidthPhase1: 0
                property real leftXPhase2: 0
                property real leftWidthPhase2: 0

                NumberAnimation {
                    target: highlightRect
                    property: "width"
                    to: leftAnim.leftWidthPhase1 //listView.currentItem.x + listView.currentItem.x.width - highlightRect.x
                    duration: 100
                    easing.type: Easing.Linear
                }

                ParallelAnimation {
                    NumberAnimation {
                        target: highlightRect
                        property: "x"
                        to: leftAnim.leftXPhase2//listView.currentItem.x
                        duration: 100
                        easing.type: Easing.Linear
                    }

                    NumberAnimation {
                        target: highlightRect
                        property: "width"
                        to: leftAnim.leftWidthPhase2//listView.currentItem.width
                        duration: 100
                        easing.type: Easing.Linear
                    }

                    // ColorAnimation {
                    //     target: rightText
                    //     from: root.primaryColor
                    //     duration: 150
                    // }
                    // ColorAnimation {
                    //     target: leftText
                    //     from: root.secondaryColor
                    //     duration: 150
                    // }
                }
            }
            SequentialAnimation {
                id: rightAnim
                property real rightWidthPhase1: 0
                property real rightXPhase1: 0
                property real rightWidthPhase2: 0
                ParallelAnimation {
                    NumberAnimation {
                        target: highlightRect
                        property: "x"
                        to: rightAnim.rightXPhase1 //listView.currentItem.x
                        duration: 100
                        easing.type: Easing.Linear
                    }
                    NumberAnimation {
                        target: highlightRect
                        property: "width"
                        to: rightAnim.rightWidthPhase1 //highlightRect.x + highlightRect.width - listView.currentItem.x
                        duration: 100
                        easing.type: Easing.Linear
                    }
                }

                ParallelAnimation {
                    // ColorAnimation {
                    //     target: rightText
                    //     from: root.secondaryColor
                    //     duration: 150
                    // }
                    NumberAnimation {
                        target: highlightRect
                        property: "width"
                        to: rightAnim.rightWidthPhase2 //listView.currentItem.width
                        duration: 100
                        easing.type: Easing.Linear
                    }
                    // ColorAnimation {
                    //     target: leftText
                    //     from: root.primaryColor
                    //     duration: 150
                    // }
                }
            }
        }
    }
}

import QtQuick
import UI.Assets

Item {
    id: root
    property color primaryColor: Style.color.backgroundPrimary
    property color secondaryColor: Style.color.backgroundSecondary
    property int currentState: 0
    property int backgroundRadius: Style.size16
    property int margins: Style.size4
    property int textSize: Style.size12
    required property var buttonModel

    Rectangle {
        id: outerRect
        clip: true
        anchors.fill: parent
        radius: root.backgroundRadius
        color: root.secondaryColor

        Item {
            anchors {
                fill: parent
                margins: root.margins
            }
            Rectangle {
                id: highlightRect
                x: listView.x
                width: root.width / buttonModel.length
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                radius: root.backgroundRadius - root.margins/2
                color: root.primaryColor
            }

            ListView {
                id: listView
                anchors {
                    fill: parent
                }
                orientation: ListView.Horizontal
                model: root.buttonModel
                highlightFollowsCurrentItem: true
                spacing: 0

                onCurrentItemChanged: {
                    const item = listView.currentItem
                    if (!item) return

                    const currentX = highlightRect.x
                    const currentW = highlightRect.width

                    if (item.x > currentX) {
                        leftAnim.leftWidthPhase1 = (item.x + item.width) - currentX
                        leftAnim.leftXPhase2 = item.x
                        leftAnim.leftWidthPhase2 = item.width
                        leftAnim.stop()
                        leftAnim.start()
                    } else if(item.x < currentX) {
                        rightAnim.rightXPhase1 = item.x
                        rightAnim.rightWidthPhase1 = (currentX + currentW) - item.x
                        rightAnim.rightWidthPhase2 = item.width
                        rightAnim.stop()
                        rightAnim.start()
                    }
                }

                delegate: Rectangle {
                    width: listView.width / listView.count
                    height: listView.height
                    color: "transparent"

                    Text {
                        anchors.centerIn: parent
                        text: modelData
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: listView.currentIndex === index ? "black" : "white"
                        font.pixelSize: textSize
                        Behavior on color {
                            ColorAnimation { duration: 150 }
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: listView.currentIndex = index
                    }
                }

                SequentialAnimation {
                    id: leftAnim
                    property real leftWidthPhase1: 0
                    property real leftXPhase2: 0
                    property real leftWidthPhase2: 0

                    NumberAnimation {
                        target: highlightRect
                        property: "width"
                        to: leftAnim.leftWidthPhase1
                        duration: 150
                        easing.type: Easing.Linear
                    }

                    ParallelAnimation {
                        NumberAnimation {
                            target: highlightRect
                            property: "x"
                            to: leftAnim.leftXPhase2
                            duration: 150
                            easing.type: Easing.Linear
                        }

                        NumberAnimation {
                            target: highlightRect
                            property: "width"
                            to: leftAnim.leftWidthPhase2
                            duration: 150
                            easing.type: Easing.Linear
                        }
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
                            to: rightAnim.rightXPhase1
                            duration: 150
                            easing.type: Easing.Linear
                        }

                        NumberAnimation {
                            target: highlightRect
                            property: "width"
                            to: rightAnim.rightWidthPhase1
                            duration: 150
                            easing.type: Easing.Linear
                        }
                    }

                    NumberAnimation {
                        target: highlightRect
                        property: "width"
                        to: rightAnim.rightWidthPhase2
                        duration: 150
                        easing.type: Easing.Linear
                    }
                }
            }
        }
    }
}

import QtQuick
import UI.Assets

Item {
    id: root
    property color primaryColor: Style.color.backgroundPrimary
    property color secondaryColor: Style.color.backgroundSecondary
    property int currentState: 0
    property int backgroundRadius: Style.size16
    property int margins: Style.size4
    required property string leftName
    required property string rightName

    Rectangle {
        id: outerRect
        clip: true
        anchors.fill: parent
        radius: root.backgroundRadius
        color: root.secondaryColor

        Rectangle {
            id: innerRect
            x: root.margins
            width: parent.width / 2
            height: parent.height - root.margins * 2
            anchors.verticalCenter: parent.verticalCenter
            radius: root.backgroundRadius - root.margins/2
            color: root.primaryColor
        }

        Text {
            id: leftText
            z: 1
            anchors {
                right: parent.right
                rightMargin: root.margins
            }
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            width: parent.width / 2
            height: parent.height
            text: root.leftName
            font.pointSize: 12
        }

        Text {
            id: rightText
            z: 1
            anchors {
                left: parent.left
                leftMargin: root.margins
            }
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            width: parent.width / 2
            height: parent.height
            text: root.rightName
            font.pointSize: 12
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                outerRect.state = outerRect.state === "right" ? "left" : "right"
            }
        }

        states: [
            State {
                name: "left"
                when: outerRect.state === "left"
                PropertyChanges {
                    leftText {
                        color: root.primaryColor
                    }
                    rightText {
                        color: root.secondaryColor
                    }
                }
            },
            State {
                name: "right"
                when: outerRect.state === "right"
                PropertyChanges {
                    leftText {
                        color: root.secondaryColor
                    }
                    rightText {
                        color: root.primaryColor
                    }
                }
            }
        ]

        transitions: [
            Transition {
                from: "*"
                to: "right"
                SequentialAnimation {
                    NumberAnimation {
                        target: innerRect
                        property: "width"
                        to: outerRect.width - 10
                        duration: 100
                        easing.type: Easing.Linear
                    }

                    ParallelAnimation {
                        NumberAnimation {
                            target: innerRect
                            property: "x"
                            to: outerRect.width / 2 - root.margins
                            duration: 100
                            easing.type: Easing.Linear
                        }

                        NumberAnimation {
                            target: innerRect
                            property: "width"
                            to: outerRect.width/2
                            duration: 100
                            easing.type: Easing.Linear
                        }

                        ColorAnimation {
                            target: rightText
                            from: root.primaryColor
                            duration: 150
                        }
                        ColorAnimation {
                            target: leftText
                            from: root.secondaryColor
                            duration: 150
                        }
                    }
                }
            },
            Transition {
                from: "*"
                to: "left"
                SequentialAnimation {

                    ParallelAnimation {
                        NumberAnimation {
                            target: innerRect
                            property: "x"
                            to: root.margins
                            duration: 100
                            easing.type: Easing.Linear
                        }
                        NumberAnimation {
                            target: innerRect
                            property: "width"
                            to: outerRect.width - 10
                            duration: 100
                            easing.type: Easing.Linear
                        }
                    }

                    ParallelAnimation {
                        ColorAnimation {
                            target: rightText
                            from: root.secondaryColor
                            duration: 150
                        }
                        NumberAnimation {
                            target: innerRect
                            property: "width"
                            to: outerRect.width / 2
                            duration: 100
                            easing.type: Easing.Linear
                        }
                        ColorAnimation {
                            target: leftText
                            from: root.primaryColor
                            duration: 150
                        }
                    }
                }
            }
        ]
    }
}

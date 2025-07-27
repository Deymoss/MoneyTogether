import QtQuick
import QtGraphs
import QtQuick.Controls
import QtQuick.Layouts
import UI.Assets
import UI.Components

Item {
    Rectangle {
        anchors.fill: parent
        color: Style.color.backgroundPrimary
    }
    ColumnLayout {
        anchors.fill: parent
        spacing: Style.size12
        MTextButton {
            id: walletButton
            Layout.preferredHeight: label.contentHeight
            Layout.alignment: Qt.AlignHCenter
            label.text: "Зарплатная"
            label.font.pixelSize: Style.size24
            label.font.bold: true
            image: "qrc:/qt/qml/MoneyTogether/res/images/ic_arrow_expand.png"
        }

        MTextButton {
            id: amountButton
            Layout.preferredHeight: label.contentHeight
            Layout.alignment: Qt.AlignHCenter
            label.text: "3458 BYN"
            label.font.pixelSize: Style.size16
            label.font.weight: 500
            icon.height: Style.size12
            icon.width: Style.size12
            image: "qrc:/qt/qml/MoneyTogether/res/images/ic_edit.png"
        }

        MSlideButton {
            id: categoryButton
            Layout.preferredWidth: Style.size320
            Layout.preferredHeight: Style.size48
            Layout.topMargin: Style.size12
            Layout.alignment: Qt.AlignHCenter
            backgroundRadius: Style.size16
            textSize: Style.size16
            buttonModel: ['Расходы', 'Доходы']
        }

        MSlideButton {
            id: categoryTransactionButton
            Layout.preferredWidth: Style.size320
            Layout.preferredHeight: Style.size30
            Layout.alignment: Qt.AlignHCenter
            textSize: Style.size13
            backgroundRadius: Style.size8
            buttonModel: ['День','Неделя','Месяц','Год','Период']
        }
        SwipeView {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Item {
                id: pageRoot
                function highlightSliceByIndex(sliceIndex) {
                    if (sliceIndex < 0 || sliceIndex >= pieOuter.count) {
                        console.warn("Неверный индекс сектора:", sliceIndex);
                        return;
                    }

                    const targetSlice = pieOuter.at(sliceIndex);

                    for (let i = 0; i < pieOuter.count; ++i) {
                        pieOuter.at(i).exploded = (pieOuter.at(i) === targetSlice);
                    }

                    const centerAngle = targetSlice.startAngle + targetSlice.angleSpan / 2;
                    const targetRotation = -90 - centerAngle;

                    rotationAnim.to = targetRotation;
                    rotationAnim.start();
                }

                function resetHighlight() {
                    rotationAnim.to = 0;
                    rotationAnim.start();
                    for (let i = 0; i < pieOuter.count; ++i) {
                        pieOuter.at(i).exploded = false;
                    }
                }
                GraphsView {
                    id: overallGraph
                    height: Style.size320
                    width: Style.size320
                    anchors {
                        top: parent.top
                        horizontalCenter: parent.horizontalCenter
                    }
                    theme: GraphsTheme {
                        colorScheme: GraphsTheme.ColorScheme.Dark
                        backgroundColor: "transparent"
                    }

                    RotationAnimation {
                        id: rotationAnim
                        target: overallGraph
                        duration: 600
                        easing.type: Easing.InOutCubic
                        direction: RotationAnimation.Shortest
                    }

                    PieSeries {
                        id: pieOuter
                        pieSize: 0.96
                        holeSize: 0.6
                        onClicked: (slice) => {
                                       for(let i=0; i < pieOuter.count; ++i) {
                                           if (pieOuter.at(i) === slice) {
                                               pageRoot.highlightSliceByIndex(i);
                                               break;
                                           }
                                       }
                                   }
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
                    z: 5
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
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            rotationAnim.to = 0
                            rotationAnim.start()

                            for (let i = 0; i < pieOuter.count; ++i) {
                                pieOuter.at(i).exploded = false
                            }
                        }
                    }
                }

                ListView {
                    id: categoriesTrans
                    width: Style.size360
                    spacing: Style.size8
                    clip: true
                    anchors {
                        top: overallGraph.bottom
                        bottom: parent.bottom
                        horizontalCenter: parent.horizontalCenter
                    }

                    model: ['Одежда','Одежда','Одежда','Одежда','Одежда','2','3','4','1','2','3','4','1','2','3','4','1','2','3','4','1','2','3','4']
                    delegate: MTransactionButton {
                        height: Style.size40
                        width: Style.size350
                        area.onClicked: {
                            pageRoot.highlightSliceByIndex(index);
                        }

                        label.text: "Одежда"
                    }
                }
            }
        }
    }
}

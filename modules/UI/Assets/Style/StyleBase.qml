pragma Singleton
import QtQuick

QtObject {

    property color error: '#ff6767'
    property color warning: '#ffae3d'
    property color success: '#0FEB8E'
    property color info: '#78a7ff'
    property color white: '#fbfbfb'
    property color black: '#111111'
    property color grey: '#5E5E5E'
    property color greyLight: '#D0D0D0'

    property color imgRefComp: '#16FF2E'
    property color imgExamComp: '#A635FF'
    property color imgExamination: '#03F0FF'
    property color imgProcessing: '#F0905A'

    property color primary: '#276FF6'
    property color focusPrimary: '#70B9EF'
    property color focusSecondary: '#2e2e2e'

    property color labelPrimary: '#fbfbfb'
    property color labelSecondary: '#99eaeaea'
    property color labelTetriary: '#4ceaeaea'
    property color labelQuaternary: '#2eeaeaea'

    property color backgroundPrimary: '#181818'
    property color backgroundSecondary: '#222222'
    property color backgroundTetriary: '#292929'
    property color backgroundQuaternary: '#3f3f41'
    property color backgroundFifth: '#636363'
    property color grid: '#2e2e2e'

    property color toolTipBackground: '#222222'
    property color toolTipText: '#aaefefef'

    function pressed(color){
        return color
    }
}

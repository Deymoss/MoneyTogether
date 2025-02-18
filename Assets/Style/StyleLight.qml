import QtQuick

StyleBase {

    error: '#FF3B30'
    warning: '#FF9500'
    success: '#34C759'
    info: '#0029FF'

    focusPrimary: '#277ff7'
    focusSecondary: '#CECECE'

    labelPrimary: '#0F0F0F'
    labelSecondary: '#505055'
    labelTetriary: '#878787'
    labelQuaternary: '#BFBFBF'

    backgroundPrimary: '#DADADA'
    backgroundSecondary: '#E8E8E8'
    backgroundTetriary: '#E0E0E0'
    backgroundQuaternary: '#97989E'
    backgroundFifth: '#636363'
    grid: '#C6C6C6'

    toolTipBackground: '#222222'
    toolTipText: '#fffbfbfb'

    function pressed(color){
        return Qt.lighter(color, 1.05)
    }
}

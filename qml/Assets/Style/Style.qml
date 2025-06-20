pragma Singleton
import QtQuick

Item {
    id: root

    enum Theme{
        Light,
        Dark
    }

    property var color: light
    property int theme: Style.Theme.Light
    // property alias image: picture
    // property alias fonts: fontStyle

    StyleLight{ id: light }
    StyleDark{ id: dark }
    // Picture{ id: picture}
    // FontStyle{ id: fontStyle}

    readonly property int size1: dp(1)
    readonly property int size2: dp(2)
    readonly property int size3: dp(3)
    readonly property int size4: dp(4)
    readonly property int size5: dp(5)
    readonly property int size6: dp(6)
    readonly property int size7: dp(7)
    readonly property int size8: dp(8)
    readonly property int size9: dp(9)
    readonly property int size10: dp(10)
    readonly property int size12: dp(12)
    readonly property int size14: dp(14)
    readonly property int size15: dp(15)
    readonly property int size16: dp(16)
    readonly property int size17: dp(17)
    readonly property int size18: dp(18)
    readonly property int size20: dp(20)
    readonly property int size24: dp(24)
    readonly property int size25: dp(25)
    readonly property int size28: dp(28)
    readonly property int size30: dp(30)
    readonly property int size32: dp(32)
    readonly property int size34: dp(34)
    readonly property int size35: dp(35)
    readonly property int size40: dp(40)
    readonly property int size42: dp(42)
    readonly property int size45: dp(45)
    readonly property int size48: dp(48)
    readonly property int size50: dp(50)
    readonly property int size54: dp(54)
    readonly property int size55: dp(55)
    readonly property int size60: dp(60)
    readonly property int size65: dp(65)
    readonly property int size68: dp(68)
    readonly property int size70: dp(70)
    readonly property int size75: dp(75)
    readonly property int size80: dp(80)
    readonly property int size90: dp(90)
    readonly property int size100: dp(100)
    readonly property int size110: dp(110)
    readonly property int size120: dp(120)
    readonly property int size130: dp(130)
    readonly property int size140: dp(140)
    readonly property int size150: dp(150)
    readonly property int size160: dp(160)
    readonly property int size180: dp(180)
    readonly property int size190: dp(190)
    readonly property int size200: dp(200)
    readonly property int size240: dp(240)
    readonly property int size250: dp(250)
    readonly property int size280: dp(280)
    readonly property int size300: dp(300)
    readonly property int size320: dp(320)
    readonly property int size400: dp(400)
    readonly property int size450: dp(450)
    readonly property int size500: dp(500)
    readonly property int size600: dp(600)
    readonly property int size750: dp(750)

    function set(type){
        if(type === Style.Theme.Light){
            theme = Style.Theme.Light
            root.color = light
        }
        else if(type === Style.Theme.Dark){
            theme = Style.Theme.Dark
            root.color = dark
        }
    }

    readonly property bool isDesktop:
        Qt.platform.os === "windows" || Qt.platform.os === "macos" || Qt.platform.os === "linux"

    readonly property real scaleFactor: isDesktop ? 1.7 : 1.0

    readonly property real dpi: Screen.pixelDensity * 25.4

    function dp(size) {
        return size * (dpi / 160) * scaleFactor
    }
}

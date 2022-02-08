import QtQuick 2.0

import QGroundControl.ScreenTools   1.0


Item {
    id: _root

    property string leftText: ""
    property string rightText: ""

    property alias text: text.text

    property real _mobileSize: ScreenTools.smallFontPointSize * ScreenTools.smallFontPointRatio
    property real _desktopSize: ScreenTools.defaultFontPointSize * ScreenTools.defaultFontPointRatio
    property real _fontPointSize: ScreenTools.isMobile ?  _mobileSize : _desktopSize

    width:  parent.width

    Row {
        spacing:  _root.width - (text.implicitWidth + _root.width / 2)
        anchors.fill: parent

        Text {
            id: text
            text: qsTr("INTELLIGENT SPREYING")
            color: "white"
            verticalAlignment: Text.AlignVCenter
            height: ScreenTools.toolbarHeight * 0.5
            font.pointSize: _fontPointSize
        }

        SwitchButton {
            id:                     switchButton
            implicitWidth:          _root.width - text.implicitWidth
            implicitHeight:         ScreenTools.toolbarHeight * 0.5
            leftText:               _root.leftText
            rightText:              _root.rightText
        }

    }
}

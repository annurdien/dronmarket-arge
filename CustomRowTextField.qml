import QtQuick 2.0
import QtQuick.Layouts              1.15

import QGroundControl.ScreenTools   1.0

import Custom.Controls              1.0
import Custom.Indicators            1.0


Item {
    id: _root

    property alias text: text.text

    property real _mobileSize: ScreenTools.smallFontPointSize * ScreenTools.smallFontPointRatio
    property real _desktopSize: ScreenTools.defaultFontPointSize * ScreenTools.defaultFontPointRatio
    property real _fontPointSize: ScreenTools.isMobile ?  _mobileSize : _desktopSize

    RowLayout {
        spacing:  _root.width - (text.implicitWidth + _root.width / 2)
        anchors.fill: parent

        Text {
            id: text
            text: qsTr("INTELLIGENT SPREYING")
            color: "white"
            verticalAlignment: Text.AlignVCenter
            height: _root.height
            font.pointSize: _fontPointSize
        }

        CustomTextField {
            id:                     switchButton
            implicitWidth:          (_root.width - _root.width/2) - (text.implicitWidth/2)
            implicitHeight:         _root.height

            Layout.alignment: Qt.AlignRight
            Layout.rightMargin: ScreenTools.defaultFontPixelWidth
        }
    }
}

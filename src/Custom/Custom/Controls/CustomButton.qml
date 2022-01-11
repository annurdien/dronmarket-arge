import QtQuick 2.0
import QtQuick.Controls 2.15

import QGroundControl.Palette           1.0
import QGroundControl.ScreenTools       1.0

Button {

    id: _root

    property string     leftText:           "FLIGHT MANAGER"
    property string     rightText:          "MISSION MANAGER"

    property alias      implicitWidth:      _background.implicitWidth
    property alias      implicitHeight:     _background.implicitHeight

    QGCPalette { id: qgcPal }

    text: qsTr("SETTINGS")

    checkable: true

    contentItem: Text {
        text: _root.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight

        color: _root.checked ? "black" : qgcPal.colorWhite
        font.pointSize:  ScreenTools.defaultFontPointSize * ScreenTools.smallFontPointRatio
    }

    background: Rectangle {
        id : _background
        implicitWidth: 100
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        color:  _root.checked ? qgcPal.colorWhite : "transparent"
        border.width: 1
        radius: 4
        border.color:   qgcPal.colorWhite
    }
}

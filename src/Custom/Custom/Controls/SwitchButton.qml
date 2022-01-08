import QtQuick 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import QGroundControl.ScreenTools   1.0
import QGroundControl.Palette       1.0

Switch {
        id: _root

        property string     leftText:           "FLIGHT MANAGER"
        property string     rightText:          "MISSION MANAGER"

        property real       indicatorHeight:    -1

        property alias      implicitWidth:      _indicator.implicitWidth
        property alias      implicitHeight:     _indicator.implicitHeight

        QGCPalette { id: qgcPal }

            indicator: Rectangle {
                id: _indicator
                x:                  _root.leftPadding
                y:                  _indicator.height / 2 - _indicator.height / 2
                radius:             4
                color:              "transparent"
                border.color:       "#ffffff"


                Item {
                    implicitWidth: _indicator.implicitWidth/2
                    implicitHeight: _indicator.implicitHeight
                    anchors.right: _indicator.right

                    Text {
                        text:                       _root.leftText
                        color:                      qgcPal.colorWhite
                        font.pointSize:             ScreenTools.smallFontPointSize * ScreenTools.smallFontPointRatio
                        anchors.centerIn:           parent
                    }
                }

                Item {
                    implicitWidth: _indicator.implicitWidth/2
                    implicitHeight: _indicator.implicitHeight
                    anchors.left: _indicator.left

                    Text {
                        text:                       _root.rightText
                        color:                      qgcPal.colorWhite
                        font.pointSize:             ScreenTools.smallFontPointSize * ScreenTools.smallFontPointRatio
                        anchors.centerIn:           parent

                    }
                }

                Rectangle {
                    x:              _root.checked ? (_indicator.width - width) : 0
                    y:              _indicator.height / 2 - height / 2
                    width:          _indicator.implicitWidth / 2
                    height:         (_root.indicatorHeight === -1) ? (_indicator.implicitHeight + 10): _root.indicatorHeight
                    radius:         4
                    color:          _root.down ? "#cccccc" : qgcPal.colorWhite
                    border.color:   qgcPal.colorWhite

                    Text {
                        id:                 checkedText
                        text:               _root.checked ? _root.rightText : _root.leftText
                        x:                  parent.width /2 - implicitWidth /2
                        y:                  parent.height / 2 - height / 2
                        color:              "black"
                        leftPadding:        5
                        rightPadding:       5
                        font.pointSize:     ScreenTools.smallFontPointSize * ScreenTools.smallFontPointRatio
                }
           }
     }
}



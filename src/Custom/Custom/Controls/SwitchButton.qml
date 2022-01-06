import QtQuick 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Switch {
        id: switchButton
        property string     leftText:           "FLIGHT MANAGER"
        property string     rightText:          "MISSION MANAGER"
        property real       indicatorHeight:    -1
        property alias      implicitWidth:      _indicator.implicitWidth
        property alias      implicitHeight:     _indicator.implicitHeight

            indicator: Rectangle {
                id: _indicator

                implicitWidth:      200
                implicitHeight:     30
                x:                  switchButton.leftPadding
                y:                  _indicator.height / 2 - _indicator.height / 2
                radius:             4
                color:              "transparent"
                border.color:       "#ffffff"


                Text {
                    text:                       switchButton.leftText
                    color:                      "#ffffff"
                    leftPadding:                5
                    rightPadding:               5
                    font.pointSize:             7
                    anchors.verticalCenter:     _indicator.verticalCenter
                    anchors.left:               _indicator.left
                    anchors.leftMargin:         10
                }

                Text {
                    text:                       switchButton.rightText
                    color:                      "#ffffff"
                    leftPadding:                5
                    rightPadding:               5
                    font.pointSize:             7
                    anchors.verticalCenter:     _indicator.verticalCenter
                    anchors.right:              _indicator.right
                    anchors.rightMargin:        10
                }

                Rectangle {
                    x:              switchButton.checked ? (_indicator.width - width) : 0
                    y:              _indicator.height / 2 - height / 2
                    width:          _indicator.implicitWidth / 2
                    height:         (switchButton.indicatorHeight === -1) ? (_indicator.implicitHeight + 10): switchButton.indicatorHeight
                    radius:         4
                    color:          switchButton.down ? "#cccccc" : "#ffffff"
                    border.color:   "#ffffff"

                    Text {
                        id:                 checkedText
                        text:               switchButton.checked ? switchButton.rightText : switchButton.leftText
                        x:                  parent.width /2 - implicitWidth /2
                        y:                  parent.height / 2 - height / 2
                        color:              "black"
                        leftPadding:        5
                        rightPadding:       5
                        font.pointSize:     7
                }
           }
     }
}



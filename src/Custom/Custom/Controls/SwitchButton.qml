import QtQuick 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15


Item {
    id: _root
    property string     leftText:           "FLIGHT MANAGER"
    property string     rightText:          "MISSION MANAGER"
    property real       indicatorHeight:    -1
    property alias      implicitWidth:      _indicator.implicitWidth
    property alias      implicitHeight:     _indicator.implicitHeight

    Switch {
        id: switchButton

            indicator: Rectangle {
                id: _indicator

                implicitWidth:      200
                implicitHeight:     30
                x:                  switchButton.leftPadding
                y:                  parent.height / 2 - height / 2
                radius:             4
                color:              "transparent"
                border.color:       "#ffffff"


                Text {
                    id:             uncheckedText
                    text:           switchButton.checked ? _root.leftText : _root.rightText
                    x:              switchButton.checked ? 0 : parent.width - width
                    y:              parent.height / 2 - height / 2
                    color:          "#ffffff"
                    leftPadding:    5
                    rightPadding:   5
                    font.pointSize: 10
                }

                Rectangle {
                    x:              switchButton.checked ? (parent.width - width) : 0
                    y:              parent.height / 2 - height / 2
                    width:          100
                    height:         (switchButton.indicatorHeight === -1) ? (parent.implicitHeight + 10): switchButton.indicatorHeight
                    radius:         4
                    color:          switchButton.down ? "#cccccc" : "#ffffff"
                    border.color:   "#ffffff"

                    Text {
                        id:             checkedText
                        text:           switchButton.checked ? _root.rightText : _root.leftText
                        x:              parent.width /2 - width /2
                        y:              parent.height / 2 - height / 2
                        color:          "black"
                        leftPadding:    5
                        rightPadding:   5
                        font.pointSize: 10
                    }
                }
            }
        }
}



import QtQuick                  2.0
import QtQuick.Controls         2.15
import QtQuick.Layouts          1.15

import QGroundControl.Palette       1.0
import QGroundControl.ScreenTools   1.0

Item {
    id: _root

    property alias implicitWidth:       background.implicitWidth
    property alias implicitHeight:      background.implicitHeight
    property alias leadingText:         leading.text
    property alias trailingText:        trailing.text
    property alias value:               progressBar.value

    property real _mobileFontSize: ScreenTools.defaultFontPointSize * ScreenTools.smallFontPointRatio
    property real _desktopFontSize: ScreenTools.defaultFontPointSize * ScreenTools.mediumFontPointRatio

    QGCPalette {id : qgcPal }

    anchors.leftMargin:     10
    anchors.rightMargin:    10


    states: [
        State {
            name: "warning"
            PropertyChanges {target:trailing;   color:"#FFD630"}
        },

        State {
            name: "error"
            PropertyChanges {target:trailing;   color:"#E72D2D"}
        },

        State {
            name: "normal"
            PropertyChanges {target:trailing;   color:"#40C110"}
        }
    ]

    RowLayout {
        anchors.fill: parent

        Item {
            height: ScreenTools.defaultFontPixelHeight
            width: ScreenTools.isMobile ? ScreenTools.smallFontPixelWidth : ScreenTools.defaultFontPixelWidth * 10
            Text {
                id:             leading
                text:           qsTr("Heading")
                font.pointSize: ScreenTools.isMobile ? _mobileFontSize : _desktopFontSize
                color:          qgcPal.colorWhite
            }
            Layout.alignment: Qt.AlignLeft

        }
        ProgressBar {
            id:         progressBar
            value:      0.5

            Layout.alignment: Qt.AlignHCenter

            background: Rectangle {
                id:             background
                implicitWidth:  _root.width - ((ScreenTools.defaultFontPixelWidth * 10) * 2)
                implicitHeight: 3
                color:          qgcPal.customProgressBarBackground
                radius:         3
            }

            contentItem: Item {
                implicitWidth:  background.implicitWidth
                implicitHeight: background.implicitHeight

                Rectangle {
                    width:      progressBar.visualPosition * parent.width
                    height:     parent.height
                    radius:     3
                    color:      qgcPal.customProgressBarItem
                }
            }
        }

        Item {
            width: ScreenTools.isMobile ? ScreenTools.smallFontPixelWidth : ScreenTools.defaultFontPixelWidth * 10
            height: ScreenTools.defaultFontPixelHeight

            Text {
                id:                     trailing
                anchors.right:          parent.right
                anchors.rightMargin:    ScreenTools.defaultFontPixelWidt
                text:                   qsTr("Footer")
                font.pointSize:         ScreenTools.isMobile ? _mobileFontSize : _desktopFontSize
                color:                  qgcPal.colorWhite
            }

            Layout.alignment: Qt.AlignRight
        }

    }
}
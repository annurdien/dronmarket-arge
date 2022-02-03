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

    QGCPalette {id : qgcPal }

    anchors.leftMargin:     10
    anchors.rightMargin:    10

    RowLayout {
        anchors.fill: parent

        Text {
            id:             leading
            text:           qsTr("Heading")
            font.pointSize: ScreenTools.mediumFontPointSize * ScreenTools.mediumFontPointRatio * 0.70
            color:          qgcPal.colorWhite

            Layout.alignment: Qt.AlignLeft
        }

        ProgressBar {
            id:         progressBar
            value:      0.5

            Layout.alignment: Qt.AlignCenter

            background: Rectangle {
                id:             background
                implicitWidth:  _root.width - (leading.implicitWidth + trailing.implicitWidth + ScreenTools.defaultFontPixelWidth * 10)
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

        Text {
            id:             trailing
            text:           qsTr("Footer")
            font.pointSize: ScreenTools.mediumFontPointSize * ScreenTools.mediumFontPointRatio * 0.70
            color:          qgcPal.colorWhite

            Layout.alignment: Qt.AlignRight
        }

    }
}

import QtQuick          2.11
import QtQuick.Layouts  1.15
import QtQuick.Layouts  1.11
import QtQuick.Window   2.11


import QGroundControl               1.0
import QGroundControl.Controls      1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.Palette       1.0


Item {
    id: _root

    QGCPalette {id : qgcPal }

    states: [
        State {
            name: "normal"
            PropertyChanges {target:icon; color:"green"}
            PropertyChanges {target:subtitle; text: "Normal"}
        },

        State {
            name: "abnormal"
            PropertyChanges {target:icon; color:"red"}
            PropertyChanges {target:subtitle; text: "Abnormal"}
        },

        State {
            name: "awaiting"
            PropertyChanges {target:icon; color:"yellow"}
            PropertyChanges {target:subtitle; text: "Awaiting"}
        }

    ]

    RowLayout {
        id:             indicatorRow
        anchors.fill:   parent
        spacing:        ScreenTools.defaultFontPixelWidth * 6

        Rectangle {
            id:                     checkIcon
            color:                  "transparent"
            Layout.minimumHeight:   20
            Layout.maximumHeight:   30
            Layout.minimumWidth:    20
            Layout.maximumWidth:    30
            Layout.alignment:       Qt.AlignTop

            QGCColoredImage {
                id:                 icon
                anchors.centerIn:   parent
                color:              "orange"
                source:             "qrc:/icons/CheckIcon.svg"
                anchors.fill:       checkIcon
        }

        }
            Rectangle {
                id:                 textContainer
                Layout.alignment:   Qt.AlignVCenter
                Layout.fillHeight:  true
                Layout.fillWidth:   true
                color:              "transparent"

                Column {
                    spacing: ScreenTools.defaultFontPixelHeight * 6

                    Text {
                        id:             title
                        text:           qsTr("ALL SYSTEM CHECK")
                        font.pointSize: ScreenTools.largeFontPointSize * ScreenTools.smallFontPointRatio
                        color:          qgcPal.colorWhite
                    }

                    Text {
                        id:             subtitle
                        text:           qsTr("Normal")
                        font.pointSize: ScreenTools.mediumFontPointSize * ScreenTools.smallFontPointRatio
                        color:          qgcPal.colorWhite
                    }


                }

            }

      }

}

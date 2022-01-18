import QtQuick          2.11
import QtQuick.Layouts  1.15
import QtQuick.Window   2.11


import QGroundControl               1.0
import QGroundControl.Controls      1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.Palette       1.0


Item {
    id: _root

    QGCPalette {id : qgcPal }

    property    string      title:       "ALL SYSTEM CHECK"

    states: [
        State {
            name: "normal"
            PropertyChanges {target:icon;       color:"green"}
            PropertyChanges {target:subtitle;   text: "Normal"}
        },

        State {
            name: "abnormal"
            PropertyChanges {target:icon;       color:"red"}
            PropertyChanges {target:subtitle;   text: "Abnormal"}
        },

        State {
            name: "awaiting"
            PropertyChanges {target:icon;       color:"yellow"}
            PropertyChanges {target:subtitle;   text: "Awaiting"}
        }

    ]

    RowLayout {
        id:             indicatorRow
        anchors.fill:   parent
        spacing:        ScreenTools.defaultFontPixelWidth * 0.3

        Rectangle {
            id:                     checkIcon
            color:                  "transparent"
            Layout.minimumHeight:   ScreenTools.defaultFontPixelHeight * 0.70
            Layout.maximumHeight:   ScreenTools.defaultFontPixelHeight * 0.80
            Layout.minimumWidth:    ScreenTools.defaultFontPixelHeight * 0.70
            Layout.maximumWidth:    ScreenTools.defaultFontPixelHeight * 0.80
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
                    spacing: ScreenTools.defaultFontPixelHeight * 0.03

                    Text {
                        id:             title
                        text:           qsTr(_root.title)
                        font.pointSize: ScreenTools.mediumFontPointSize * ScreenTools.smallFontPointRatio * 0.70
                        color:          qgcPal.colorWhite
                    }

                    Text {
                        id:             subtitle
                        text:           qsTr("Normal")
                        font.pointSize: ScreenTools.smallFontPointSize * ScreenTools.smallFontPointRatio
                        color:          qgcPal.colorWhite
                    }
                }

            }
      }
}

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

    property real _minimumHeight: ScreenTools.isAndroid ? ScreenTools.defaultFontPixelHeight * 0.70 : ScreenTools.defaultFontPixelHeight
    property real _maximumHeight: ScreenTools.isAndroid ? ScreenTools.defaultFontPixelHeight * 0.80 : ScreenTools.defaultFontPixelHeight
    property real _minimumWidth: ScreenTools.isAndroid ? ScreenTools.defaultFontPixelHeight * 0.70 : ScreenTools.defaultFontPixelHeight
    property real _maximumWidth: ScreenTools.isAndroid ? ScreenTools.defaultFontPixelHeight * 0.80 : ScreenTools.defaultFontPixelHeight

    property real _androidTitleFontSize: ScreenTools.mediumFontPointSize * ScreenTools.smallFontPointRatio * 0.70
    property real _desktopTitleFontSize: ScreenTools.mediumFontPointSize * ScreenTools.smallFontPointRatio

    property real _androidSubtitleFontSize: ScreenTools.smallFontPointSize * ScreenTools.smallFontPointRatio
    property real _desktopSubtitleFontSize: ScreenTools.smallFontPointSize * ScreenTools.mediumFontPointRatio

    property real _subtitleFontSize: ScreenTools.isAndroid ? _androidSubtitleFontSize : _desktopSubtitleFontSize
    property real _titleFontSize: ScreenTools.isAndroid ? _androidTitleFontSize : _desktopTitleFontSize

    property real _spacing: ScreenTools.isAndroid ? ScreenTools.defaultFontPixelWidth * 0.3 : ScreenTools.defaultFontPixelWidth


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
        spacing:        _spacing

        Rectangle {
            id:                     checkIcon
            color:                  "transparent"
            Layout.minimumHeight:   _minimumHeight
            Layout.maximumHeight:   _maximumHeight
            Layout.minimumWidth:    _minimumWidth
            Layout.maximumWidth:    _maximumWidth
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
                        font.pointSize: _titleFontSize
                        color:          qgcPal.colorWhite
                    }

                    Text {
                        id:             subtitle
                        text:           qsTr("Normal")
                        font.pointSize: _subtitleFontSize
                        color:          qgcPal.colorWhite
                    }
                }

            }
      }
}

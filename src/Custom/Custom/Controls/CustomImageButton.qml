import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts              1.15

import QGroundControl               1.0
import QGroundControl.Controls      1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.Palette       1.0

Button {

    id: _root

    property string     leftText:           "FLIGHT MANAGER"
    property string     rightText:          "MISSION MANAGER"
    property string     imageSource:        "qrc:/icons/Avoinics.svg"

    property alias      implicitWidth:      _background.implicitWidth
    property alias      implicitHeight:     _background.implicitHeight


    QGCPalette { id: qgcPal }

    text: qsTr("SETTINGS")

    contentItem: Item {
        id: content

        RowLayout {
                Item {
                    width: ScreenTools.defaultFontPixelWidth * 5
                    height: ScreenTools.defaultFontPixelWidth * 5

                    QGCColoredImage {

                        id:                 icon
                        anchors.centerIn:   parent
                        source:             _root.imageSource
                        anchors.fill:       parent
                    }

                }

                Text {
                        id:                     buttonText
                        text:                   _root.text
                        horizontalAlignment:    Text.AlignHCenter
                        verticalAlignment:      Text.AlignVCenter
                        elide:                  Text.ElideRight
                        color:                  qgcPal.colorWhite
                        font.pointSize:         ScreenTools.defaultFontPointSize * ScreenTools.smallFontPointRatio

                        Layout.alignment: Qt.AlignHCenter
                 }

            }
    }

    background: Rectangle {
            id :                _background
            implicitHeight:     ScreenTools.defaultFontPixelHeight * 2.5
            implicitWidth:      ScreenTools.defaultFontPixelWidth * 30
            opacity:            enabled ? 1 : 0.3
            color:              _root.down ? qgcPal.colorGrey : "transparent"
            border.width:       1
            radius:             4
            border.color:       _root.down ? qgcPal.colorGrey : "transparent"
    }
}

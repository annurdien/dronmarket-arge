import QtQuick 2.0
import QtQuick.Layouts  1.15

import QGroundControl               1.0
import QGroundControl.ScreenTools   1.0


// Custom Component
import Custom.Controls              1.0
import Custom.Indicators            1.0

Item {
    id: _root

    anchors.fill: parent

    ColumnLayout {
        id:             settingButtons
        anchors.fill:   parent
        spacing:        (parent.height / 6) - ScreenTools.defaultFontPixelHeight * 2.5

        CustomImageButton {
            id:            avoinicsButton
            text:          qsTr('Avoinics')
            onClicked:     { mainWindow.showAvoinicsSettings() }
        }

        CustomImageButton {
            id:          powerButton
            text:         qsTr('Power')
            imageSource: "qrc:/icons/Battery.svg"
            onClicked: { mainWindow.showPowerSettings() }
        }

        CustomImageButton {
            id:          radarButton
            text:        qsTr('Radar System')
            imageSource: "qrc:/icons/Radar.svg"
            onClicked: { mainWindow.showRadarSettings() }
        }

        CustomImageButton {
            id:          spreyingButton
            text:        qsTr('Spreying System')
            imageSource: "qrc:/icons/Spreying.svg"
            onClicked: { mainWindow.showSpreyingSettings() }
        }

        CustomImageButton {
            id:          gncButton
            text:        qsTr('Global Navigation System')
            imageSource: "qrc:/icons/Gnc.svg"
            onClicked: { mainWindow.showGncSettings() }
        }

        CustomImageButton {
            id:          commsButton
            text:        qsTr('Comminication')
            imageSource: "qrc:/icons/Comms.svg"
            onClicked: { mainWindow.showCommsSettings() }
        }
    }
}

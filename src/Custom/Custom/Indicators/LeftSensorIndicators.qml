import QtQuick 2.0
import QtQuick.Layouts  1.15

import QGroundControl               1.0
import QGroundControl.ScreenTools   1.0

import Custom.Indicators            1.0

Item {
    id: _root
    anchors.fill: parent

    property real _sensorHeight: ScreenTools.isAndroid ? ScreenTools.defaultFontPixelHeight * 0.1 : ScreenTools.defaultFontPixelHeight
    property real _sensorWidth: ScreenTools.isAndroid ? ScreenTools.defaultFontPixelWidth * 0.2 : ScreenTools.defaultFontPixelWidth

    ColumnLayout {
        id: leftSensorRow
        anchors.fill: parent

        spacing: (parent.height/5) - ScreenTools.defaultFontPixelHeight * 2.5

        CustomSensorIndicator {
            height: _sensorHeight
            width: _sensorWidth
            title: "ALL SYSTEM CHECK"
            state: "normal"
        }

        CustomSensorIndicator {
            height: _sensorHeight
            width: _sensorWidth
            title: "SPREYING SYSTEM"
            state: "awaiting"
        }

        CustomSensorIndicator {
            height: _sensorHeight
            width: _sensorWidth
            title: "AVIONICS"
            state: "awaiting"
        }

        CustomSensorIndicator {
            height: _sensorHeight
            width: _sensorWidth
            title: "GNC SYSTEM"
            state: "abnormal"
        }

        CustomSensorIndicator {
            height: _sensorHeight
            width: _sensorWidth
            title: "POWER SYSTEM"
            state: "awaiting"
        }

    }
}

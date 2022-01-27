import QtQuick 2.0
import QtQuick.Layouts  1.15

import QGroundControl               1.0
import QGroundControl.ScreenTools   1.0

import Custom.Indicators            1.0

Item {
    id: _root
    anchors.fill: parent

    ColumnLayout {
        id: leftSensorRow
        anchors.fill: parent

        spacing: (parent.height/5) - ScreenTools.defaultFontPixelHeight * 2.5

        CustomSensorIndicator {
            height: ScreenTools.defaultFontPixelHeight * 0.1
            width: ScreenTools.defaultFontPixelWidth * 0.2
            title: "ALL SYSTEM CHECK"
            state: "normal"
        }

        CustomSensorIndicator {
            height: ScreenTools.defaultFontPixelHeight * 0.1
            width: ScreenTools.defaultFontPixelWidth * 0.2
            title: "SPREYING SYSTEM"
            state: "awaiting"
        }

        CustomSensorIndicator {
            height: ScreenTools.defaultFontPixelHeight * 0.1
            width: ScreenTools.defaultFontPixelWidth * 0.2
            title: "AVIONICS"
            state: "awaiting"
        }

        CustomSensorIndicator {
            height: ScreenTools.defaultFontPixelHeight * 0.1
            width: ScreenTools.defaultFontPixelWidth * 0.2
            title: "GNC SYSTEM"
            state: "abnormal"
        }

        CustomSensorIndicator {
            height: ScreenTools.defaultFontPixelHeight * 0.1
            width: ScreenTools.defaultFontPixelWidth * 0.2
            title: "POWER SYSTEM"
            state: "awaiting"
        }

    }
}

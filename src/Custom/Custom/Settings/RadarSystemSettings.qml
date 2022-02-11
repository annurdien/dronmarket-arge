import QtQuick          2.0
import QtQuick.Layouts  1.15
import QtQuick.Controls 2.15

// Custom Component
import Custom.Controls              1.0
import Custom.Indicators            1.0

import QGroundControl.ScreenTools   1.0


Item {
    id: _root

    Item {
        id: name

        anchors.fill:           parent
        anchors.leftMargin:     20
        anchors.rightMargin:    20
        anchors.bottomMargin:   20

        Column {
            anchors.fill: parent
            spacing: ScreenTools.defaultFontPixelHeight

            CustomRowSwitchButton{
                width : name.width
                height: ScreenTools.toolbarHeight * 0.5
                leftText: "ON"
                rightText: "OFF"
                text: "OBSTACLE AVOIDANCE"
            }

            CustomRowSwitchButton{
                width : name.width
                height: ScreenTools.toolbarHeight * 0.5
                leftText: "FLAT"
                rightText: "MOUNTAIN"
                text: "TERRAIN MODE"
            }

            CustomRowTextField{
                width : name.width
                height: ScreenTools.toolbarHeight * 0.5
                text: "OBSTACLE DISPLAY MODE"
            }

            CustomRowSwitchButton{
                width : name.width
                height: ScreenTools.toolbarHeight * 0.5
                leftText: "SEGMENT"
                rightText: "SCATTER"
                text: "OBSTACLE DISPLAY MODE"
            }
        }
    }
}

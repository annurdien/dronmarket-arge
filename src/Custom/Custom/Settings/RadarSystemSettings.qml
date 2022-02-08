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

        ColumnLayout {
            anchors.fill: parent

            CustomRowSwitchButton{
                width : name.width
                leftText: "ON"
                rightText: "OFF"

                Layout.maximumWidth: 30
                Layout.minimumWidth: 15
            }

            CustomRowSwitchButton{
                width : name.width
                leftText: "AGRESIVE"
                rightText: "PASSIVE"
                text: "INTELLIGENT SPREY MODE"

                Layout.maximumWidth: 30
                Layout.minimumWidth: 15
            }
        }
    }
}

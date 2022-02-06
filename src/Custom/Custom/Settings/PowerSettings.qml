import QtQuick          2.0
import QtQuick.Layouts  1.15
import QtQuick.Controls 2.15

import QGroundControl.FactSystem    1.0
import QGroundControl.FactControls  1.0
import QGroundControl.Controls      1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.Palette       1.0

// Custom Component
import Custom.Controls              1.0
import Custom.Indicators            1.0

Item {
    id: _root

    FactPanelController { id: controller; }

    QGCPalette { id: ggcPal; colorGroupEnabled: true }

    property Fact _batt1Monitor:                    controller.getParameterFact(-1, "BATT_MONITOR")
    property Fact _batt2Monitor:                    controller.getParameterFact(-1, "BATT2_MONITOR", false /* reportMissing */)
    property bool _batt2MonitorAvailable:           controller.parameterExists(-1, "BATT2_MONITOR")
    property bool _batt1MonitorEnabled:             _batt1Monitor.rawValue !== 0
    property bool _batt2MonitorEnabled:             _batt2MonitorAvailable ? _batt2Monitor.rawValue !== 0 : false
    property bool _batt1ParamsAvailable:            controller.parameterExists(-1, "BATT_CAPACITY")
    property bool _batt2ParamsAvailable:            controller.parameterExists(-1, "BATT2_CAPACITY")

    property Fact _failsafeBatt1LowAct:             controller.getParameterFact(-1, "BATT_FS_LOW_ACT", false /* reportMissing */)
    property Fact _failsafeBatt2LowAct:             controller.getParameterFact(-1, "BATT2_FS_LOW_ACT", false /* reportMissing */)
    property Fact _failsafeBatt1CritAct:            controller.getParameterFact(-1, "BATT_FS_CRT_ACT", false /* reportMissing */)
    property Fact _failsafeBatt2CritAct:            controller.getParameterFact(-1, "BATT2_FS_CRT_ACT", false /* reportMissing */)
    property Fact _failsafeBatt1LowMah:             controller.getParameterFact(-1, "BATT_LOW_MAH", false /* reportMissing */)
    property Fact _failsafeBatt2LowMah:             controller.getParameterFact(-1, "BATT2_LOW_MAH", false /* reportMissing */)
    property Fact _failsafeBatt1CritMah:            controller.getParameterFact(-1, "BATT_CRT_MAH", false /* reportMissing */)
    property Fact _failsafeBatt2CritMah:            controller.getParameterFact(-1, "BATT2_CRT_MAH", false /* reportMissing */)
    property Fact _failsafeBatt1LowVoltage:         controller.getParameterFact(-1, "BATT_LOW_VOLT", false /* reportMissing */)
    property Fact _failsafeBatt2LowVoltage:         controller.getParameterFact(-1, "BATT2_LOW_VOLT", false /* reportMissing */)
    property Fact _failsafeBatt1CritVoltage:        controller.getParameterFact(-1, "BATT_CRT_VOLT", false /* reportMissing */)
    property Fact _failsafeBatt2CritVoltage:        controller.getParameterFact(-1, "BATT2_CRT_VOLT", false /* reportMissing */)

    property Fact _armingCheck: controller.getParameterFact(-1, "ARMING_CHECK")

    property real _margins:         ScreenTools.defaultFontPixelHeight
    property real _innerMargin:     _margins / 2
    property bool _showIcon:        !ScreenTools.isTinyScreen
    property bool _roverFirmware:   controller.parameterExists(-1, "MODE1") // This catches all usage of ArduRover firmware vehicle types: Rover, Boat...


    property string _restartRequired: qsTr("Requires vehicle reboot")

    Item {
        id : progressIndicators
        anchors.fill:           parent
        anchors.leftMargin:     20
        anchors.rightMargin:    20
        anchors.bottomMargin:   _root.height * 0.40

        ColumnLayout {
            anchors.fill: parent

            Repeater {
                model: 11

                CustomProgressBarIndicator {
                    Layout.minimumWidth: progressIndicators.width
                    Layout.maximumHeight: 10
                    leadingText: "CELL " + (index+1)
                    trailingText: "4.00 V"
                }

            }
        }
    }

    Rectangle {
        id :                divider
        height:             2
        color:              "white"
        width:              _root.width
        anchors.top:        progressIndicators.bottom
        anchors.topMargin: 30
    }

    Component {
        id: batteryFailsafeComponent

        Column {
            spacing: _margins

            GridLayout {
                id:             gridLayout
                columnSpacing:  _margins
                rowSpacing:     _margins
                columns:        2

                QGCLabel { text: qsTr("Low action:") }
                FactComboBox {
                    fact:               failsafeBattLowAct
                    indexModel:         false
                    Layout.fillWidth:   true
                }

                QGCLabel { text: qsTr("Critical action:") }
                FactComboBox {
                    fact:               failsafeBattCritAct
                    indexModel:         false
                    Layout.fillWidth:   true
                }

//                QGCLabel { text: qsTr("Low voltage threshold:") }
//                FactTextField {
//                    fact:               failsafeBattLowVoltage
//                    showUnits:          true
//                    Layout.fillWidth:   true
//                }

                QGCLabel { text: qsTr("Low mAh threshold:") }
                FactTextField {
                    fact:               failsafeBattLowMah
                    showUnits:          true
                    Layout.fillWidth:   true
                }
            } // GridLayout
        } // Column
    }

    Component {
        id: restartRequiredComponent

        ColumnLayout {
            spacing: ScreenTools.defaultFontPixelWidth

            QGCLabel {
                text: _restartRequired
            }

            QGCButton {
                text:       qsTr("Reboot vehicle")
                onClicked:  controller.vehicle.rebootVehicle()
            }
        }
    }

    Item {
        id:             battery1FailsafeLoader
        anchors.top:    divider.bottom
        anchors.right:  _root.right
        anchors.left:   _root.left
        anchors.bottom: _root.bottom


        Loader {

            anchors.margins:    _margins
            anchors.fill: parent

            sourceComponent:    _batt1ParamsAvailable ? batteryFailsafeComponent : restartRequiredComponent

            property Fact battMonitor:              _batt1Monitor
            property bool battParamsAvailable:      _batt1ParamsAvailable
            property Fact failsafeBattLowAct:       _failsafeBatt1LowAct
            property Fact failsafeBattCritAct:      _failsafeBatt1CritAct
            property Fact failsafeBattLowMah:       _failsafeBatt1LowMah
            property Fact failsafeBattLowVoltage:   _failsafeBatt1LowVoltage
        }
    }
}

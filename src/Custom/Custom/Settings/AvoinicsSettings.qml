import QtQuick          2.0
import QtQuick.Layouts  1.15
import QtQuick.Controls 2.15

// Custom Component
import Custom.Controls              1.0
import Custom.Indicators            1.0

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

            CustomProgressBarIndicator {
                Layout.minimumWidth: name.width
                Layout.maximumHeight: 10
                leadingText: "IMU 1"
                trailingText: "22.9"
            }

            CustomProgressBarIndicator {
                Layout.minimumWidth: name.width
                Layout.maximumHeight: 10
                leadingText: "IMU 2"
                trailingText: "0.5"
            }

            CustomProgressBarIndicator {
                Layout.minimumWidth: name.width
                Layout.maximumHeight: 10
                leadingText: "IMU 3"
                trailingText: "0.95"
            }

            Item {
                Layout.minimumWidth: name.width
                Layout.maximumHeight: 30
                CustomButton {
                    height: 30
                    width: name.width
                    text: "CALIBRATE IMU"
                    buttonColor: down ? "grey": "white"
                    textColor: "black"
                }
            }

            CustomProgressBarIndicator {
                Layout.minimumWidth: name.width
                Layout.maximumHeight: 10
                leadingText: "Compass 1"
                trailingText: "Mag Err"
                state: "error"
                value: 0
            }

            CustomProgressBarIndicator {
                Layout.minimumWidth: name.width
                Layout.maximumHeight: 10
                leadingText: "Compass 2"
                trailingText: "220.7"
                state: "warning"
            }

            CustomProgressBarIndicator {
                Layout.minimumWidth: name.width
                Layout.maximumHeight: 10
                leadingText: "Compass 3"
                trailingText: "12.0"
                state: "normal"
                value: 0.2
            }

            Item {
                Layout.minimumWidth: name.width
                Layout.maximumHeight: 30
                CustomButton {
                    height: 30
                    width: name.width
                    text: "CALIBRATE COMPASS"
                    buttonColor: down ? "grey": "white"
                    textColor: "black"
                }
            }
        }
    }
}

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
        anchors.bottomMargin:   _root.height * 0.40

        ColumnLayout {
            anchors.fill: parent

            Repeater {
                model: 11

                CustomProgressBarIndicator {
                    Layout.minimumWidth: name.width
                    Layout.maximumHeight: 10
                    leadingText: "CELL " + (index+1)
                    trailingText: "4.00 V"
                }

            }
        }
    }

    Rectangle {

        height: 2
        color: "white"
        width: _root.width
        anchors.top: name.bottom
        anchors.topMargin: 30
    }
}

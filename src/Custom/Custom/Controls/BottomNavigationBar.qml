import QtQuick                      2.0
import QtQuick.Shapes               1.0
import QtQuick.Layouts              1.15

import QGroundControl.ScreenTools   1.0

Item {
    id: _root


    property    color       color
    property    real        currentNavbarIndex:        0

    function updateCurrentIndex(index) {
        currentNavbarIndex = index;
    }


    Rectangle {
         id:                 _bottomLine
         anchors.bottom:     _root.bottom
         height:             _root.height * 0.30
         width:              _root.width
         color:              _root.color

     }

    Item {
        id:                         _trapezoid

        anchors.horizontalCenter:   _root.horizontalCenter
        width:                      _root.width * 0.40
        height:                     _root.height

        Shape {
            id:                         _trapezoidLine

            anchors.fill:               parent
            anchors.horizontalCenter:   parent.horizontalCenter

            ShapePath {

                strokeColor:            _root.color
                strokeWidth:            30
                fillColor:              _root.color
                capStyle:               ShapePath.RoundCap
                joinStyle:              ShapePath.RoundJoin

                    PathLine { x: _root.width * 0.40; y: 0 }
                    PathLine { x: _root.width * 0.40 + 100; y: _root.height }
                    PathLine { x: -100; y: _root.height }
                    PathLine { x: 0; y: 0 }
            }
       }


        RowLayout {

            anchors.fill: _trapezoid
            Layout.fillWidth: true


            BottomNavBarButton {
                id: _overView
                text: "Overview"
                color: "white"
                source: "qrc:/icons/Overview.svg"
                imageHeight: 30
                imageWidth: 30

                Layout.minimumWidth: 10
                Layout.minimumHeight: 50

                state: currentNavbarIndex === 0 ? "selected" : ""
                onClicked: {
                        _root.updateCurrentIndex(0)
                        mainWindow.showOverviewSettings()
                }
            }

            BottomNavBarButton {
                id: _comms
                text: "Comms"
                color: "white"
                imageColor: "white"
                source: "qrc:/icons/Comms.svg"
                imageHeight: 30
                imageWidth: 30

                Layout.minimumWidth: 10
                Layout.minimumHeight: 50

                state: currentNavbarIndex === 1 ? "selected" : ""
                onClicked: {

                        _root.updateCurrentIndex(1)

                }

            }

            BottomNavBarButton {
                id: _mission
                text: "Radar"
                color: "white"
                imageColor: "white"
                source: "qrc:/icons/Radar.svg"
                imageHeight: 30
                imageWidth: 30

                Layout.minimumWidth: 10
                Layout.minimumHeight: 50

                state: currentNavbarIndex === 2 ? "selected" : ""
                onClicked: {
                        _root.updateCurrentIndex(2)

                }
            }

            BottomNavBarButton {
                id: _power
                text: "Power"
                color: "white"
                imageColor: "white"
                source: "qrc:/icons/Battery.svg"
                imageHeight: 30
                imageWidth: 30

                Layout.minimumWidth: 10
                Layout.minimumHeight: 50

                state: currentNavbarIndex === 3 ? "selected" : ""
                onClicked: {
                        _root.updateCurrentIndex(3)

                }
            }

            BottomNavBarButton {
                id: _avionics
                text: "Avoinics"
                color: "white"
                imageColor: "white"
                source: "qrc:/icons/Avoinics.svg"
                imageHeight: 30
                imageWidth: 30

                Layout.minimumWidth: 10
                Layout.minimumHeight: 50

                state: currentNavbarIndex === 4 ? "selected" : ""
                onClicked: {
                        _root.updateCurrentIndex(4)
                        mainWindow.showAvoinicsSettings()

                }
            }
        }
    }
}

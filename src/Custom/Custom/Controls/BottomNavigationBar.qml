import QtQuick                      2.0
import QtQuick.Shapes               1.0
import QtQuick.Layouts              1.15

import QGroundControl.ScreenTools   1.0

Item {
    id: _root


    property    color       color
    property    real        _currentNavbarIndex:        0

    function updateCurrentIndex(index) {
        _currentNavbarIndex = index;
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
        width:                      _root.width * 0.45
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

                    PathLine { x: _root.width * 0.45; y: 0 }
                    PathLine { x: _root.width * 0.45 + 100; y: _root.height }
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
                source: "qrc:/res/OverviewIcon.svg"
                imageHeight: 30
                imageWidth: 30

                Layout.minimumWidth: 10
                Layout.minimumHeight: 50

                state: _currentNavbarIndex === 0 ? "selected" : ""
                onClicked: {
                        _root.updateCurrentIndex(0)

                }
            }

            BottomNavBarButton {
                id: _comms
                text: "Comms"
                color: "white"
                imageColor: "white"
                source: "qrc:/res/CommsIcon.svg"
                imageHeight: 30
                imageWidth: 30

                Layout.minimumWidth: 10
                Layout.minimumHeight: 50

                state: _currentNavbarIndex === 1 ? "selected" : ""
                onClicked: {

                        _root.updateCurrentIndex(1)

                }

            }

            BottomNavBarButton {
                id: _mission
                text: "Radar"
                color: "white"
                imageColor: "white"
                source: "qrc:/res/RadarIcon.svg"
                imageHeight: 30
                imageWidth: 30

                Layout.minimumWidth: 10
                Layout.minimumHeight: 50

                state: _currentNavbarIndex === 2 ? "selected" : ""
                onClicked: {
                        _root.updateCurrentIndex(2)

                }
            }

            BottomNavBarButton {
                id: _power
                text: "Power"
                color: "white"
                imageColor: "white"
                source: "qrc:/res/PowerIcon.svg"
                imageHeight: 30
                imageWidth: 30

                Layout.minimumWidth: 10
                Layout.minimumHeight: 50

                state: _currentNavbarIndex === 3 ? "selected" : ""
                onClicked: {
                        _root.updateCurrentIndex(3)

                }
            }

            BottomNavBarButton {
                id: _avionics
                text: "Avoinics"
                color: "white"
                imageColor: "white"
                source: "qrc:/res/AvionicsIcon.svg"
                imageHeight: 30
                imageWidth: 30

                Layout.minimumWidth: 10
                Layout.minimumHeight: 50

                state: _currentNavbarIndex === 4 ? "selected" : ""
                onClicked: {
                        _root.updateCurrentIndex(4)

                }
            }
        }
    }
}

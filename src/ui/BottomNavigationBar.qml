import QtQuick                      2.0
import QtQuick.Shapes               1.0
import QGroundControl.ScreenTools   1.0
import QtQuick.Layouts              1.15


Item {
    id: root

    // width = luas layar
    property        color       color

    Rectangle {
         id:                 _bottomLine
         anchors.bottom:     root.bottom
         height:             root.height * 0.30
         width:              root.width
         color:              root.color

     }

    Item {
        id:                         shape

        anchors.horizontalCenter:   root.horizontalCenter
        width:                      root.width * 0.45
        height:                     root.height

        Shape {
            id:                         _shapePath

            anchors.fill:               parent
            anchors.horizontalCenter:   parent.horizontalCenter

            ShapePath {

                strokeColor:            root.color
                strokeWidth:            30
                fillColor:              root.color
                capStyle:               ShapePath.RoundCap
                joinStyle:              ShapePath.RoundJoin

                    PathLine { x: root.width * 0.45; y: 0 }
                    PathLine { x: root.width * 0.45 + 100; y: root.height }
                    PathLine { x: -100; y: root.height }
                    PathLine { x: 0; y: 0 }
            }
       }


        RowLayout {

            anchors.fill: shape
            Layout.fillWidth: true


            BottomNavBarButton {
                id: _overView
                text: "Overview"
                color: "white"
                imageColor: "red"
                source: "qrc:/res/OverviewIcon.svg"
                imageHeight: 30
                imageWidth: 30

                Layout.minimumWidth: 10
                Layout.minimumHeight: 50
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
            }
        }
    }
}

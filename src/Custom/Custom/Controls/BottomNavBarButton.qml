import QtQuick          2.11
import QtQuick.Controls 2.4
import QtQuick.Dialogs  1.3
import QtQuick.Layouts  1.11
import QtQuick.Window   2.11

import QGroundControl               1.0
import QGroundControl.Palette       1.0
import QGroundControl.Controls      1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.FlightDisplay 1.0
import QGroundControl.FlightMap     1.0

MouseArea {
    id : _root
    property        alias       text         : _text.text
    property        alias       color        : _text.color
    property        alias       source       : _image.source
    property        alias       imageColor   : _image.color
    property        alias       imageHeight  : _image.height
    property        alias       imageWidth   : _image.width

    height:                     _image.height + _text.implicitHeight
    width:                      _image.width + _text.implicitWidth
    implicitHeight:             _image.height + _text.implicitHeight

    states: [

        State {
            name: "error"
            PropertyChanges { target : _image; color : "red" }
        },

        State {
                name: "selected"
                PropertyChanges { target: _bottomLine; visible : true }
        },

        State {
                name: "selected-error"
                PropertyChanges { target: _bottomLine; visible : true }
                PropertyChanges { target : _image; color : "red" }
        }
    ]

    Rectangle {
        id :                        _rectangle
        height:                     _image.height + _text.implicitHeight
        width:                      _image.width + _text.implicitWidth
        implicitHeight:             _image.height + _text.implicitHeight
        color:                      "transparent"

        ColumnLayout {

            anchors.fill:           _rectangle
            spacing:                2


            QGCColoredImage {
                id:                         _image
                Layout.alignment:           Qt.AlignHCenter
                width:                      _root.imageWidth
                height:                     _root.imageHeight
                color:                      _root.imageColor
                state:                      _root.state

            }

            Text {
                id:                         _text
                Layout.alignment:           Qt.AlignHCenter
                font.pointSize:             7
            }

            Rectangle {
                id:                         _bottomLine
                height:                     3
                radius:                     3
                width:                      _rectangle.width
                state:                      _root.state
                visible:                    false
            }
        }
    }

}

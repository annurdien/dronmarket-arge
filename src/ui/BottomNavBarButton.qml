import QtQuick                      2.0
import QtQuick.Layouts              1.15
import QGroundControl.ScreenTools   1.0

Item {
    id : _root
    property        alias       text         : _text.text
    property        alias       color        : _text.color
    property        alias       source       : _image.source
    property        alias       imageColor   : _image.color
    property        alias       imageHeight  : _image.height
    property        alias       imageWidth   : _image.width

//    width: _rectangle.width
//    height: _rectangle.height


    Rectangle {
        id : _rectangle
        implicitHeight: _image.height + _text.implicitHeight

        height: _image.height + _text.implicitHeight
        width: _image.width + _text.implicitWidth
        color: "transparent"

        ColumnLayout {

            anchors.fill: _rectangle
            spacing: 2


            QGCColoredImage {
                id:                         _image
                Layout.alignment:           Qt.AlignHCenter
                width:                      _root.imageWidth
                height:                     _root.imageHeight

            }

            Text {
                id:                         _text
                Layout.alignment:           Qt.AlignHCenter
                font.pointSize:             7
            }

        }

    }

}

import QtQuick 2.12
import QtGraphicalEffects 1.0
import "qrc:/import"

Item{
    id:item
    property alias source:image.source
    property alias color:overlay.color
    implicitWidth: image.width
    implicitHeight: image.height
    Image {
        id:image
        fillMode: Image.PreserveAspectFit
        // anchors.centerIn: parent
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height
        source: button.source
       // smooth: true
        //antialiasing: true
        //layer.samples: 8
       // smooth:true
        //mipmap:true
    }
    ColorOverlay {
        id:overlay
            anchors.fill: image
            source: image

        }
}

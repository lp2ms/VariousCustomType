import QtQuick 2.12
import QtQuick.Controls 2.12
import "qrc:/import"
Button {
    id:control
    font.weight: hovered?Font.Black:Font.Medium


    property color textColor:palette.text
    implicitWidth: text.contentWidth+10
    implicitHeight: text.contentHeight+10
    background:Rectangle{
        color: "transparent"
    }

    contentItem: Text {

        id:text
            text: control.text
            font: control.font
            opacity: enabled ? 1.0 : 0.3
            color: control.textColor
          //  horizontalAlignment: Text.AlignHCenter
           // verticalAlignment: Text.AlignVCenter
            //elide: Text.ElideRight
        }
}

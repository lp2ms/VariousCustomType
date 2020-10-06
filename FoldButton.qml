import QtQuick 2.12
import QtQuick.Layouts 1.12
import '../Style'
Button {
    id:button
   // font.bold: true
    font.pointSize: 10
    checkable: true
    //anchors.leftMargin: 50
    //anchors.left: parent.left
   // width: parent.width
    opacity: enabled?1:0.3
    background: Item{}
    contentItem: RowLayout{
        width: parent.width
            Text{
                text:button.text
                font:button.font

                color: horusTheme.textColor
            }
            Text{
                //font:button.font
                text:checked?"-":"+"
                font.bold: button.hovered?true:false
                font.pointSize: button.font.pointSize*1.2
                Layout.alignment: Qt.AlignRight
                horizontalAlignment: Text.AlignRight
                color: horusTheme.textColor
            }
        }


   // highlighted:true
}

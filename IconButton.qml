import QtQuick 2.12
import QtQuick.Controls 2.13
import "../Style"
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.12
Button {
    id:button
   // width: parent.width
    //height:65
    //highlighted: true
    //enabled: true
    //font.bold: hovered?true:false
    property string source
    property string label
    property color color:highlighted?Qt.rgba(0.90,0.90,0.90,1):Qt.rgba(0.1,0.1,0.1,1)
    property color textColor:enabled?horusTheme.textColor:horusTheme.textLightColor
    property int iconeSize: 25
    property int textSize:8
    property color iconeColor:"transparent"
    property bool labelVisible: true
    padding: 0
    opacity: hovered?0.5:1
    height: image.height+text.height+15
    background: Rectangle {
        opacity: enabled ? 1 : 0.3
        color:button.color
//        Text{
//            anchors.bottom: parent.bottom
//            anchors.bottomMargin: 5
//            anchors.horizontalCenter: parent.horizontalCenter
//            text:button.label
//            font.pointSize: button.textSize
//           // color:button.hovered?Qt.lighter(button.textColor,1.2):button.textColor
//        }
    }
    //leftPadding: 20
    contentItem:

        Item{
            Image {
                id:image
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
                anchors.horizontalCenter: parent.horizontalCenter
                height: iconeSize
                source: button.source

               // smooth:true
                //mipmap:true
            }
            ColorOverlay {
                    anchors.fill: image
                    source: image
                    color: iconeColor
                }
            Text{
                id:text
               anchors.top:image.bottom
               anchors.topMargin: 5
               anchors.horizontalCenter: image.horizontalCenter
               visible: labelVisible
               //anchors.bottom: parent.bottom
              // anchors.bottomMargin: 5
                //anchors.horizontalCenter: parent.horizontalCenter
                text:button.label
                font.pointSize: button.textSize
                color:iconeColor
            }
    }

}

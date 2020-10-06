import QtQuick 2.12
import QtQuick.Controls 2.12
import "qrc:/import"

Column{
    id:root
    width:column.width
    spacing: 10
    property var axis: ["X","Y","Z"]
    property int currentIndex: 0
    property bool enabled

    Row{
        Text{
            text:qsTr("Axis: ")
            color:palette.text
            //width:50
        }
        Text{
            text:axis[currentIndex]
             color:palette.text
        }
    }
    AbstractButton{
        enabled: root.enabled
        hoverEnabled: true
        id:button
        implicitWidth: 50
        implicitHeight: 50
        onClicked:{
            root.currentIndex+=1;
            if(currentIndex>axis.length-1){currentIndex=0;}
        }
        contentItem:Rectangle{
            width: 50
            height: 50
            radius: 25
            color:enabled?"light grey":Qt.lighter("light grey",1.1)
            Rectangle{
                visible: root.currentIndex==0?true:false
                x:parent.width/2
                y:parent.height/2
                width: parent.width/2
                height: button.hovered?2:1
                color:enabled?HorusTheme.accentColor:HorusTheme.accentColorDisabled
            }
            Rectangle{
                visible: root.currentIndex==1?true:false
                x:parent.width/2

                width: button.hovered?2:1
                height: parent.height/2
                color:enabled?HorusTheme.accentColor:HorusTheme.accentColorDisabled
            }
            Rectangle{
                visible: root.currentIndex==2?true:false
                x:parent.width/2
                y:parent.height/2
                width: button.hovered?4:2
                height: button.hovered?4:2
                radius:width/2
                color:enabled?HorusTheme.accentColor:HorusTheme.accentColorDisabled

            }
        }
    }

    //            ComboBox{
    //                id:rotationAxis
    //                model:["X","Y","Z"]

    //            }
}

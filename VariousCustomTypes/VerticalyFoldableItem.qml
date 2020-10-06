import QtQuick 2.12
import "qrc:/import"
Column {
    id:column
    default property alias item: ld.sourceComponent
    property alias show:foldButton.checked
    property int unfoldHeight: ld.height+foldButton.height+spacing
    property int foldHeight: foldButton.height
    property alias foldButton: foldButton
    spacing: 20
    property int indentation: column.width*HorusTheme.baseMarginFactor

    FoldButton{
        id:foldButton
        implicitWidth: parent.width
        checked: true
    }

    Item {
        id: info
        implicitWidth: childrenRect.width
        //visible:
        height: (show&&foldButton.enabled) ? ld.height : 0
        anchors.left:column.left
        anchors.right:column.right
        anchors.leftMargin: column.indentation
        //anchors.top:foldButton.bottom
        //anchors.topMargin: 20
        clip: true
        Loader {
            id: ld
            //y: info.height - height
            //anchors.horizontalCenter: info.horizontalCenter
        }
        Behavior on height {
            SmoothedAnimation { velocity: 1000 }
            //NumberAnimation { duration: column.duration*ld.height/100; easing.type: Easing.InOutQuad }
        }
    }
}

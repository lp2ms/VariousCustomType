import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Shapes 1.12
import "qrc:/import"
//import QtGraphicalEffects 1.0


AbstractButton{
    id:startButton
    implicitWidth: 50
    implicitHeight: 50
    padding: 20
    leftPadding: padding
    rightPadding: padding
    topPadding: padding-5
    bottomPadding: padding+5
    //leftInset: 20

    property int radius:5

    property color color
    property color textColor:palette.text

    property color strokeColor:"transparent"
    property int strokeWidth:0
    //property string text
    background:Text{
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: startButton.leftPadding

        //anchors.left:parent.left
        //anchors.horizontalCenter: parent.horizontalCenter
        //horizontalAlignment: Text.AlignHCenter
        text:startButton.text
        font:parent.font
        color:parent.textColor
    }

    contentItem: Shape{
        //rendererType: Shape.GeometryRenderer
       // anchors.fill:startButton
        //anchors.margins: startButton.padding

        ShapePath{
            startX:0
            startY: startButton.radius
            fillColor: startButton.color
            strokeColor: startButton.strokeColor
            strokeWidth: startButton.strokeWidth



           // strokeColor: "black"
            PathArc{

                //direction: PathArc.Counterclockwise
                radiusX: startButton.radius
                radiusY: startButton.radius
                relativeX: startButton.radius
                relativeY: -startButton.radius
            }

            PathLine{
               // x:startButton.x
                //y:startButton.y
                id:line
                relativeX: parent.width-2*startButton.radius-startButton.rightPadding-startButton.leftPadding
                relativeY: (height-startButton.topPadding-startButton.bottomPadding)/2-startButton.radius

            }
            PathArc{

               // direction: PathArc.Counterclockwise
                radiusX: startButton.radius
                radiusY: startButton.radius
                relativeX: 0
                relativeY: 2*Math.cos(Math.atan((line.relativeY-line.y)/(line.relativeX-line.x)))*startButton.radius
            }
            PathLine{
               // x:startButton.x
                //y:startButton.y
                relativeX: -(parent.width-2*startButton.radius-startButton.rightPadding-startButton.leftPadding)
                relativeY: line.relativeY
            }
            PathArc{

               // direction: PathArc.Counterclockwise
                radiusX: startButton.radius
                radiusY: startButton.radius
                relativeX: -startButton.radius
                relativeY: -startButton.radius
            }
            PathLine{
               // x:startButton.x
                //y:startButton.y
                relativeX: 0
                relativeY: -height+2*startButton.radius+startButton.topPadding+startButton.bottomPadding
            }

        }
    }
    //label:"Print"
    //source: printButton.enabled?"/Qml/Main/Icone/Fleche.svg":"/Qml/Main/Icone/FlecheDisable.svg"
    //textColor: printButton.enabled?"light grey":"dimgrey"
}

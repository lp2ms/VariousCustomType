import QtQuick 2.12
import QtQuick.Controls 2.13
import QtQuick.Shapes 1.12
import "../Style"
//import QtGraphicalEffects 1.0

Button {
    id:startButton
    property int radius: horusTheme.baseRadius
    property color color:"transparent"
    property color textColor:horusTheme.textColor

    property color strokeColor:hovered?horusTheme.standardGreen:horusTheme.borderColor
    borderColor: hovered?horusTheme.standardGreen:horusTheme.borderColor
    property int strokeWidth:2
    topPadding: 8
    bottomPadding:8
   // strokeColor: enabled?hovered?horusTheme.standardGreen:horusTheme.borderColor:"dimgrey"
    //padding:20
    contentItem: Item{
        Item{
            //color:"blue"
            id:content
            width:height
            height: parent.height
           // y:startButton.height/2-height/2
            Shape{
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
                        //x:content.right//-2*startButton.radius
                       // relativeX: startButton.width-2*startButton.radius-startButton.rightPadding-startButton.leftPadding
                          relativeX: content.width-2*startButton.radius
                       // relativeY: (height-startButton.topPadding-startButton.bottomPadding)/2-startButton.radius
                        relativeY: (content.height)/2-startButton.radius

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
                        //x:startButton.radius
                        //relativeX: -(startButton.width-2*startButton.radius-startButton.rightPadding-startButton.leftPadding)
                        relativeX: -(content.width-2*startButton.radius)
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
        }
        Text{
            anchors.left: content.right
            anchors.leftMargin: parent.width*0.1
            text: startButton.text
            color:startButton.textColor
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    }

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Shapes 1.12
import QtGraphicalEffects 1.0
import "qrc:/import"
IconButton {
    id:tabButton
    property int radius: HorusTheme.baseRadius
    property int margin: width/6
    labelVisible: !current
    //property string source
    //property string label
    property int tab
    //property int iconeSize: 40
    property bool current: window.tab===tab?true:false
    hoverEnabled: !current
    checkable: false
    onClicked :window.setTab(tab)
    //property color textColor:Qt.rgba(0.85,0.85,0.85,1)
    implicitWidth: 50
    implicitHeight: 70
    iconeSize: 35
    color:"transparent"
    leftPadding: current?20:padding
   // topPadding: current?12:padding
    textColor: HorusTheme.backgroundColor
    iconeColor:current?HorusTheme.accentColor:HorusTheme.backgroundColor


//            Colorize {
//                                anchors.fill: tabButton
//                                source: tabButton
//                                hue: 0.0
//                                saturation: 0.0
//                                lightness: 2
//                            }
    //property bool enable: value
//    Rectangle{
//        anchors.fill:parent
//        color:tabButton.hovered?"red":"green"
//    }

   // x:0
   // y:0

    Shape{
        //rendererType: Shape.GeometryRenderer
        anchors.fill:parent
        visible: tabButton.current?true:false
        z:-1
        ShapePath{
            startX:tabButton.x+tabButton.width
            startY: 0
            fillColor: HorusTheme.backgroundColor
                    PathArc{
                        //direction: PathArc.Counterclockwise
                        radiusX: tabButton.radius
                        radiusY: tabButton.radius
                        relativeX: -tabButton.radius
                        relativeY: tabButton.radius
                    }
            strokeWidth: 1
            strokeColor: fillColor
           // strokeColor: "black"

            PathLine{
               // x:tabButton.x
                //y:tabButton.y
                relativeX: -tabButton.width+2*tabButton.radius+tabButton.margin
                relativeY: 0
            }
            PathArc{

                direction: PathArc.Counterclockwise
                radiusX: tabButton.radius
                radiusY: tabButton.radius
                relativeX: -tabButton.radius
                relativeY: tabButton.radius
            }
            PathLine{
                relativeX: 0
                relativeY: tabButton.height-4*tabButton.radius
            }
            PathArc{
                direction: PathArc.Counterclockwise
                radiusX: tabButton.radius
                radiusY: tabButton.radius
                relativeX: tabButton.radius
                relativeY: tabButton.radius
            }
            PathLine{
                relativeX: tabButton.width-2*tabButton.radius-tabButton.margin
                relativeY: 0
            }
            PathArc{
               // direction: PathArc.Counterclockwise
                radiusX: tabButton.radius
                radiusY: tabButton.radius
                relativeX: tabButton.radius
                relativeY: tabButton.radius
            }
            PathLine{
                relativeX: 0
                relativeY: -tabButton.height
            }

        }
    }
//    IconButton{
//        id:iconButton
//        source:tabButton.source
//        width:parent.width
//        anchors.verticalCenter: parent.verticalCenter
//        x:tabButton.current?parent.x+parent.margin:parent.x
//        y:parent.y-tabButton.height/2+tabButton.radius
//        color:"transparent"
//        iconeSize: 40
//        label:tabButton.label
//        Colorize {
//                            anchors.fill: iconButton
//                            source: iconButton
//                            hue: 0.0
//                            saturation: 0.0
//                            lightness: tabButton.current?0:tabButton.hovered?0.5:1
//                        }

//    }

//    Column {
//        anchors.verticalCenter: parent.verticalCenter
//        width:parent.width
//        spacing:5
//        x:tabButton.current?parent.x+parent.margin:parent.x
//        y:parent.y-tabButton.height/2+tabButton.radius
//        Image {
//            id:image
//            fillMode: Image.PreserveAspectFit
//            anchors.horizontalCenter: parent.horizontalCenter
//            //anchors.verticalCenter: parent.verticalCenter
//            height: iconeSize
//            source: tabButton.source
//           // mipmap: true
////            Colorize {
////                    anchors.fill: image
////                    source: image
////                    hue: 0.0
////                    saturation: 0.0
////                    lightness: tabButton.current?0:tabButton.hovered?0.5:1
////                }
//        }
//        Text{
//            visible: !tabButton.current
//            text:tabButton.label
//            anchors.horizontalCenter: parent.horizontalCenter
//            color:tabButton.hovered?Qt.darker(tabButton.textColor,1.5):tabButton.textColor
//            //font.pointSize: tabButton.textSize
//        }

//    }
}

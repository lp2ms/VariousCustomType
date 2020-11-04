import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

RowLayout{
    property alias preeditText: xScaleValue.preeditText
    property alias linkIcon: xScaleButton.icon
    property string rootIcon
    readonly property real value: xScaleValue.text
    function updateValue(value){
        if(xScaleButton.checked&&Number(xScaleValue.text)!==value){
            xScaleValue.text=value;
        }
    }
    function setValue(value){xScaleValue.text=value;}
    signal valueUpdated(real value);
    signal accepted()
    TextField{
        id:xScaleValue
        // property real previousValue:1;
        onTextEdited: {
            console.log("Value updated !", Number(text))
            if(xScaleButton.checked){
                valueUpdated(Number(text))
            }
        }
        text:"1"
        onAccepted: parent.accepted()
    }
    Button{
        id:xScaleButton

        checkable: true
        checked: true
        Layout.alignment: Qt.AlignVCenter
        display: AbstractButton.IconOnly
        background: Item{}
        implicitWidth: 15
        height: 15
        padding: 0
        leftInset: 0
        icon.source:(checked&&!hovered)||(!checked&&hovered)?rootIcon+"/link.png":rootIcon+"/unlink.png"
        icon.width: 15
        icon.height: 15
//        icon.color:HorusTheme.accentColor
    }
}

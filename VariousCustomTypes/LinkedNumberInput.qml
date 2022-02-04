import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

RowLayout{
    property alias preeditText: xScaleValue.preeditText
    property alias linkIcon: xScaleButton.icon
    property alias validator: xScaleValue.validator
    property string rootIcon
    readonly property real value: Number.fromLocaleString(xScaleValue.text)
    function updateValue(value){
        if(xScaleButton.checked&&Number.fromLocaleString(xScaleValue.text)!==value){
            xScaleValue.text=value.toLocaleString();
        }
    }
    function setValue(value){xScaleValue.text=value.toLocaleString();}
    signal valueUpdated(real value);
    signal accepted()
    TextField{
        id:xScaleValue
        // property real previousValue:1;
        onTextEdited: {
            if(xScaleButton.checked && acceptableInput){
                valueUpdated(Number.fromLocaleString(text))
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

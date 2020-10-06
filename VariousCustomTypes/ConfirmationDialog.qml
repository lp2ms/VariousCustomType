import QtQuick 2.12
import QtQuick.Controls 2.13
import "qrc:/Style"
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.1
Dialog {
    title:qsTr("Delete selection")
    function validate(){}
    property var settingHandler
    //signal autoValidateChanged(bool value)
   // property var settings
   // property string settingName
    //property alias autoValidate
    modal:true
    footer:RowLayout {
        id:footer
        Button {
            text: qsTr("Cancel")
            Layout.alignment: Qt.AlignLeft
            Layout.topMargin: 0
            Layout.bottomMargin: 10
            Layout.leftMargin: 20
            onClicked: loaderDialog.source=""
        }
        Button {
            id:validateButton
            text: qsTr("Yes")
            Layout.alignment: Qt.AlignRight
            Layout.topMargin: 0
            Layout.bottomMargin: 10
            Layout.rightMargin: 20
            onClicked: {
                validate()
            }
        }
    }

    contentItem:
        Item{
        Text{
            id:text
            anchors.centerIn: parent
            text:"Are you sure ?"
            color:horusTheme.standardRed
            font.pointSize: 12
        }
        CheckBox{
            id:checkBox
            anchors.bottom:parent.bottom
            anchors.bottomMargin: 25
            anchors.left:parent.left
            text:qsTr("Never ask again")
            onCheckedChanged: if(settingHandler)settingHandler.updateSettings(!checked)

            checked: false
        }
    }
}

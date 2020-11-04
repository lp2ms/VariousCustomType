import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

ColumnLayout {
    signal accepted()
    function updateAll(value){
        for(var i=0;i<children.length;++i){
            children[i].updateValue(value)
        }
    }

    Component.onCompleted: {
        for(var i=0;i<children.length;++i){
            children[i].valueUpdated.connect(updateAll)
            children[i].accepted.connect(accepted)
        }
    }
}

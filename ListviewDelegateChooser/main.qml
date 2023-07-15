import QtQuick 2.15
import QtQuick.Window 2.15
import Qt.labs.qmlmodels 1.0
import QtQuick.Controls 2.15

// Write by NillReze
Window {
    id: drawerListview
    width: 640
    height: 480
    visible: true
    title: qsTr("Listview with multi deleate")

    component DelegateItem: Row {
        spacing: 6
        width: parent.width - 16
        height: 36
        anchors{ horizontalCenter: parent.horizontalCenter }

        property alias  delegateText: txtDelegate.text
        property alias  delegateText2: txtDelegate2.text

        // Delegate icon
        Text {
            id: txtDelegate
            width: 100
            height: parent.height
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }

        // DelegateName
        Text {
            id: txtDelegate2
            width: parent.width - 106
            height: parent.height
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }
    }

    DelegateChooser {
        id: chooser
        role: "type"
        DelegateChoice { roleValue: "Users";        DelegateItem { delegateText2: name+" "+family; delegateText: type + " " + index; } }
        DelegateChoice { roleValue: "Cameragroups"; DelegateItem { delegateText2: cameraGroupName; delegateText: type + " " + index; } }
    }

    ListView {
        id: listView
        anchors {fill: parent}
        interactive: true
        clip: true
        spacing: 4
        delegate: chooser
        model: mixList
    }

    ListModel {
        id: mixList
        ListElement {
            name: "Nill"
            family: "Rezaei"
            type: "Users"
        }
        ListElement {
            cameraGroupName: "Cam group 2"
            type: "Cameragroups"
        }
        ListElement {
            name: "Sam"
            family: "Wise"
            type: "Users"
        }
        ListElement {
            cameraGroupName: "Cam group 1"
            type: "Cameragroups"
        }
        ListElement {
            name: "John"
            family: "Brown"
            type: "Users"
        }
    }


    ListModel {
        id: userList
        ListElement {
            name: "Nill"
            family: "Rezaei"
            type: "Users"
        }
        ListElement {
            name: "John"
            family: "Brown"
            type: "Users"
        }
        ListElement {
            name: "Sam"
            family: "Wise"
            type: "Users"
        }
    }

    ListModel {
        id: cameragroupList
        ListElement {
            cameraGroupName: "Cam group 1"
            type: "Cameragroups"
        }
        ListElement {
            cameraGroupName: "Cam group 2"
            type: "Cameragroups"
        }
        ListElement {
            cameraGroupName: "Cam group 3"
            type: "Cameragroups"
        }
    }
}

import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    id: root
    visible: false
    minimumWidth: 400
    minimumHeight: 200
    title: update ? qsTr("EditFoodItem") : qsTr("AddFoodItems")

    signal getFoodItem(string name, string expiryDays, bool update)
    property bool update: false
    property string currentName
    property string currentExpiryDays

    Rectangle {
        id: rootRect
        anchors.fill: parent

        ComboBox {
            id: foodList

            width: parent.width / 1.5
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            currentIndex: root.update ? root.nameToIndex(root.currentName) : 0

            model: ListModel {
                id: formatModel

                ListElement { text: "Meat"}
                ListElement { text: "Vegetables"}
                ListElement { text: "Fish"}
                ListElement { text: "Fruits"}
            }
        }

        ComboBox {
            id: expDaysList

            width: parent.width / 1.5
            anchors.top: foodList.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            currentIndex: root.update ? root.expDaysToIndex(root.currentExpiryDays) : 0

            model: ListModel {
                id: expDaysModel

                ListElement { text: "1"}
                ListElement { text: "2"}
                ListElement { text: "3"}
                ListElement { text: "4"}
                ListElement { text: "5"}
                ListElement { text: "10" }
                ListElement { text: "Expired" }
            }
        }

        MenuButton {
            name: root.update ? "Update" : "Add"
            anchors.top: expDaysList.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            mouseArea.onClicked: {
                    root.getFoodItem(formatModel.get(foodList.currentIndex).text, expDaysModel.get(expDaysList.currentIndex).text, root.update)
            }
        }
    }

    //helper functions
    function nameToIndex(name) {
        switch (name) {
        case "Meat":
            return 0;
        case "Vegetables":
            return 1;
        case "Fish":
            return 2;
        case "Fruits":
            return 3;
        }
    }

    function expDaysToIndex(days) {
        switch (days) {
        case "1":
            return 0;
        case "2":
            return 1;
        case "3":
            return 2;
        case "4":
            return 3;
        case "5":
            return 4;
        case "10":
            return 5;
        case "Expired":
            return 6;
        }
    }
}

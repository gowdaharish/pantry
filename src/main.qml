import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import PantryModel 1.0

Window {
    id: root
    visible: true
    minimumWidth: 640
    minimumHeight: 480
    title: qsTr("Pantry")
    color: "lightblue"

    // menu bar
    Rectangle {
        id: menuNameText
        width: parent.width
        height: 50
        anchors.top: parent.tops
        color: "black"

        Text {
            id: mainText
            text: "My Food"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            font.pixelSize: 18
            font.weight: Font.Normal
        }
    }

    ListView {
        id: listView
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: menuNameText.bottom
        anchors.bottom: parent.bottom
        anchors.margins: 3
        clip: true
        model: PantryModel { id: pantryModel }
        delegate: PantryItem {
            name: model.name
            expiryDays: model.expiryDays
            isHighlighted: listView.currentIndex === index
            itemColor:{ if (expiryDays === "Expired" || expiryDays === "1" || expiryDays === "2")
                    return "red"
                if (expiryDays === "3" || expiryDays === "4")
                    return "orange"
                else
                    return "green"
            }
            mouseButton.onClicked: {
                listView.currentIndex = index
                menu.update = true
                menu.visible = true
                menu.raise()
            }
            deleteArea.onClicked: {
                if (listView.currentIndex === index || listView.count === 0)
                    menu.visible = false

                menu.update = false
                pantryModel.deleteFoodItem(index)
            }
        }

        add: Transition {
            NumberAnimation { properties: "x,y"; from: 100; duration: 200 }
        }
    }

    // edit window
    // responsidble for opening a new window when adding a new item to the model
    AddMenu {
        id: menu
        currentName: update ? listView.currentItem.name : ""
        currentExpiryDays: update ? listView.currentItem.expiryDays : ""

        onGetFoodItem: {
            if (update)
            {
                pantryModel.setData(pantryModel.index(listView.currentIndex, 0), name, PantryModel.NameRole)
                pantryModel.setData(pantryModel.index(listView.currentIndex, 0), expiryDays, PantryModel.ExpiryDaysRole)
                close()
            }
            else
            {
                pantryModel.addFoodItem(name, expiryDays)
            }
        }
    }

    // bottom right buttom which enables the option of adding a new item to the model
    AddButton {
        id: addButton
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 5
        anchors.bottomMargin: 5
        mouseArea.onClicked: {
            menu.update = false
            menu.visible = true
            menu.raise()
        }
    }
}

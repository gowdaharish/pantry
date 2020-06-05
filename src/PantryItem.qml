import QtQuick 2.0

Rectangle {
    id: root
    width: parent.width
    height: 50
    radius: 4

    property string name
    property string expiryDays
    property bool isHighlighted: false
    property alias itemColor : root.color
    property alias mouseButton: pantryItemMouseArea
    property alias deleteArea: deleteMouseArea

    states: [
        State {
            name: "hovered"
            when: pantryItemMouseArea.containsMouse

            PropertyChanges {
                target: expText
                anchors.right: deleteRect.left
                anchors.rightMargin: 10
            }
        }
    ]

    // highlight rectangle
    Rectangle {
        id: highlightRect
        width: parent.width
        height: parent.height
        color: "transparent"
        radius: 4
        border.width: 5
        border.color: "black"
        visible: root.isHighlighted
    }

    // items image icon you see on the left
    Image {
        id: image
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        source: "icons/image-24px.svg"
    }

    // name of the item
    BasicText {
        id: nameText
        anchors.left: image.right
        anchors.leftMargin: 20
        rowText.text: qsTr(name)
    }

    // expiration day of the item
    BasicText {
        id: expText
        anchors.right: parent.right
        anchors.rightMargin: 10
        rowText.text: {
            if (expiryDays == "Expired")
                qsTr("Expired")
            else
                qsTr(expiryDays + " Days")
        }
    }

    // bottom seperator between items
    Rectangle {
        id: separator
        width: parent.width - 7
        height: 2
        color: "black"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottoms
    }

    // this should facilitate in opening the window to offer editable option
    MouseArea {
        id: pantryItemMouseArea
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.PointingHandCursor
        enabled: !deleteMouseArea.containsMouse
    }

    // Delete Button
    // this provides delete icon in the end for the hovered item, pressing it will delete the item
    Rectangle {
        id: deleteRect
        visible: pantryItemMouseArea.containsMouse
        width: height
        height: parent.height - 10
        anchors.right: parent.right
        anchors.rightMargin: 7
        anchors.verticalCenter: parent.verticalCenter
        color: "lightblue"
        radius: width/2

        Image {
            id: deleteItem
            //        visible: pantryItemMouseArea.containsMouse
            anchors.centerIn: parent
            source: "icons/delete_outline-24px.svg"
        }

        MouseArea {
            id: deleteMouseArea
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.LeftButton
            cursorShape: Qt.PointingHandCursor
        }
    }
}

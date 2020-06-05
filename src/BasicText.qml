import QtQuick 2.0

Rectangle {
    id: root
    property alias rowText: text

    width: 75
    height: parent.height
    color: "transparent"
    radius: 5
    border.width: 0
    border.color: "#4dd0e1"

    Text {
        id: text
        anchors.verticalCenter: parent.verticalCenter
        color: "white"
        font.pixelSize: 18
        font.weight: Font.Normal
    }
}

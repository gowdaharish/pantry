import QtQuick 2.0

Rectangle {
    id: backButton

    width: 30
    height: 30
    radius: width/2
    color: "white"

    property alias mouseArea: mouseArea

    Item {
        id: statesItem

        states: [
            State {
                name: "pressed"
                when: mouseArea.pressed

                PropertyChanges {
                    target: backButton
                    color: "#29434e"
                }
            },
            State {
                name: "hovered"
                when: mouseArea.containsMouse

                PropertyChanges {
                    target: backButton
                    color: "#546e7a"
                }

                PropertyChanges {
                    target: mouseArea
                    cursorShape: Qt.PointingHandCursor
                }
            }
        ]
    }

    Image {
        anchors.fill: parent

        source: "icons/add_circle_outline-24px.svg"
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.PointingHandCursor
    }
}

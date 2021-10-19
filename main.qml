import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
// import QtQuick.Layouts 1.15
// import QtGraphicalEffects 1.15

Window {
    id: notchWindow
    width: 320
    height: 40
    visible: true
    title: 'Notchify'
    flags: Qt.SubWindow | Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint

    property string coordinates: String(x)+','+String(y)
    x: Math.floor((screen.width-width)/2)
    y: 0

    color: '#00000000'

    Component.onCompleted: {
        notchWindow.showNormal();
    }

    Image {
        id: notchImage
        source: Qt.resolvedUrl('notch.svg')
        anchors.fill: parent

        property alias mouseX: notchMouseArea.mouseX
        property alias mouseY: notchMouseArea.mouseY

        MouseArea {
            id: notchMouseArea

            width: 240
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter

            acceptedButtons: Qt.LeftButton | Qt.RightButton
            hoverEnabled: true


            onEntered: {
                /*
                if (mouseX <= width/2) {

                } else {

                }
                */
                cursorShape = Qt.BlankCursor;
            }

        }

    }

    RoundButton {
        id: roundButton
        x: 0
        y: 0
        width: 20
        height: 20

        icon.source: Qt.resolvedUrl('close_icon.svg')
        icon.color: '#000000'
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        font.family: "Microsoft YaHei UI"
        anchors.rightMargin: 10

        hoverEnabled: true
        opacity: hovered ? 1:0
        palette.button: '#80000000'

        onClicked: {
            close();
        }
    }






}

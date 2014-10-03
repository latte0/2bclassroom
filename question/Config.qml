import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1


Rectangle {
    id:config

    width: 0
    height: 800
    radius:20
    anchors.centerIn: parent
    color:"pink"
    opacity:0.9
    Column {
        spacing: 12
        anchors.centerIn: parent
            visible: config.width === 0 ? 0:1
        Rectangle{
            id:configmenu
            width:800
            height:100
            color:"transparent"
            anchors.margins:20
            Text{
                anchors.centerIn: parent
                text:"configmenu"
                font.pixelSize: 100
                MouseArea{
                    anchors.fill:parent
                    onClicked: {
                        config.width  =0
                    }
                }
            }
        }

        Text{
            text:"volume"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 50
        }

        Slider {
            anchors.margins: 20
            anchors.horizontalCenter: parent.horizontalCenter
            style: touchStyle
            value: 1.0
            onValueChanged: playAudio.volume = value
        }
        Text{
            text:"textspeed"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 50
        }

        Slider {
            anchors.margins: 20
            anchors.horizontalCenter: parent.horizontalCenter
            style: touchStyle
            value: 0.5
            onValueChanged: home.textspeed =(110 - value * 100)
        }
       /* Text{
            anchors.margins: 20
            anchors.horizontalCenter: parent.horizontalCenter
            text:"close"
            font.pixelSize: 50
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    config.width  =0
                }
            }
        }*/
        Rectangle{
            id:yes
            width:150
            height:70
            radius: 10
            anchors.horizontalCenter:parent.horizontalCenter

            anchors.margins: 100
            x:50
            color:"transparent"
            Text{
                anchors.centerIn: parent
                text:"close"
                font.pixelSize: 60

                MouseArea {
                    anchors.fill: parent
                    onClicked:{
                            config.width = 0
                      }
                    hoverEnabled: true
                    onExited:{
                        console.log("enter");
                        yes.color = "transparent";
                    }
                    onEntered: yes.color = "yellow";


                }
            }
        }


    }

    Component {
        id: touchStyle
        SliderStyle {
            handle: Rectangle {
                width: 30
                height: 30
                radius: height
                antialiasing: true
                color: Qt.lighter("#468bb7", 1.2)
            }

            groove: Item {
                implicitHeight: 50
                implicitWidth: 400
                Rectangle {
                    height: 8
                    width: parent.width
                    anchors.verticalCenter: parent.verticalCenter
                    color: "#444"
                    opacity: 0.8
                    Rectangle {
                        antialiasing: true
                        radius: 1
                        color: "#468bb7"
                        height: parent.height
                        width: parent.width * control.value / control.maximumValue
                    }
                }
            }
        }
    }

    Behavior on width{
        SequentialAnimation{
            NumberAnimation{
                duration:100
            }
        }
    }

}

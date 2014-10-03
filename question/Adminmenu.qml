import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1

import FileIO 1.0
import IpGet 1.0


import "File.js" as Filerela
import "Name.js" as Name
import "bunkijson.js" as Bunkijson


Rectangle {
    id:adminmenu

    width: 0
    height: 800
    anchors.centerIn: parent
    color:"black"

    property string myip:""
    property bool network_mode:false
  //  property string hostip:""

    Column {
        spacing: 12
        anchors.centerIn: parent
            visible: adminmenu.width === 0 ? 0:1
        Rectangle{
            id:adminrec
            width:800
            height:100
            color:"transparent"
            anchors.margins:20
            Text{
                anchors.centerIn: parent
                text:"Administrator"
                font.pixelSize: 100
                color:"steel blue"
            }
        }


        Row{
            spacing: 60
            anchors.horizontalCenter: parent.horizontalCenter

            Text{
                text:"MY IP"
                font.pixelSize: 40
                color:"white"
            }

            Text{
                id:ip
                anchors.margins: 20
                text: ipget.getIp()
                color:"red"
                font.pixelSize: 35

            }
        }
        Row{
            spacing: 60
            anchors.horizontalCenter: parent.horizontalCenter

            Text{
                text:"HOST IP"
                font.pixelSize: 40
                color:"white"
            }

            TextField {
                id:hostiptext
                anchors.margins: 20
                text: home.hostip
                style: touchStyle
            }
        }




        Row {
            spacing: 80
            anchors.horizontalCenter: parent.horizontalCenter
            Text{
                text:"NETWORKMODE"
                font.pixelSize: 40
                color:"white"
            }

            Switch {
                id:network
                style: switchStyle
            }
        }

        Row{
            spacing: 60
            anchors.horizontalCenter: parent.horizontalCenter

            Text{
                text:"CURRENT PASS"
                font.pixelSize: 40
                color:"white"
            }

            TextField {
                id:passtext
                anchors.margins: 20
                text: home.passwd
                style: touchStyle
            }
        }

        Rectangle{
            id:gameend
            width:childrenRect.width
            height:70
            anchors.horizontalCenter:parent.horizontalCenter

            anchors.margins: 100
            x:50
            color:"transparent"
            Text{
                anchors.centerIn: parent
                text:"GAME END"
                font.pixelSize: 60
                color:"steel blue"
                MouseArea {
                    anchors.fill: parent
                    onClicked:{
                            adminmenu.width = 0
                        home.receive();
                      }
                    hoverEnabled: true
                    onExited:{
                        console.log("enter");
                        gameend.color = "transparent";
                    }
                    onEntered: gameend.color = "gray";
                }
            }
        }

        Rectangle{
            id:adminsave
            width:childrenRect.width
            height:70
            anchors.horizontalCenter:parent.horizontalCenter

            anchors.margins: 100
            x:50
            color:"transparent"
            Text{
                anchors.centerIn: parent
                text:"save config"
                font.pixelSize: 60
                color:"steel blue"
                MouseArea {
                    anchors.fill: parent
                    onClicked:{
                        myFile.remove();
                        var onoff = "OFF"
                        if(network.checked) onoff = "ON"
                        myFile.write("PASS:"+passtext.text + "\nNETWORKMODE:" + onoff + "\nHOSTIP" + hostiptext.text);
                        home.passwd = passtext.text
                        home.network_mode = network.checked
                        home.hostip = hostiptext.text
                      }
                    hoverEnabled: true
                    onExited:{
                        console.log("enter");
                        adminsave.color = "transparent";
                    }
                    onEntered: adminsave.color = "gray";
                }
            }
        }


        Rectangle{
            id:adminclose
            width:childrenRect.width
            height:70
            anchors.horizontalCenter:parent.horizontalCenter

            anchors.margins: 100
            x:50
            color:"transparent"
            Text{
                anchors.centerIn: parent
                text:"CLOSE"
                font.pixelSize: 60
                color:"steel blue"
                MouseArea {
                    anchors.fill: parent
                    onClicked:{
                            adminmenu.width = 0

                        adminmenu.visible = false;
                        home.startbgm();
                        home.forceActiveFocus()
                      }
                    hoverEnabled: true
                    onExited:{
                        console.log("enter");
                        adminclose.color = "transparent";
                    }
                    onEntered: adminclose.color = "gray";
                }
            }
        }



    }


    Component {
        id: touchStyle

        TextFieldStyle {
            textColor: "white"
            font.pixelSize: 35
            background: Item {
                implicitHeight: 50
                implicitWidth: 320
                BorderImage {
                    source: "../images/textinput.png"
                    border.left: 8
                    border.right: 8
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                }
            }
        }
    }

    Component {
        id: switchStyle
        SwitchStyle {

            groove: Rectangle {
                implicitHeight: 50
                implicitWidth: 152
                Rectangle {
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    width: parent.width/2 - 2
                    height: 20
                    anchors.margins: 2
                    color: control.checked ? "#468bb7" : "#222"
                    Behavior on color {ColorAnimation {}}
                    Text {
                        font.pixelSize: 23
                        color: "white"
                        anchors.centerIn: parent
                        text: "ON"
                    }
                }
                Item {
                    width: parent.width/2
                    height: parent.height
                    anchors.right: parent.right
                    Text {
                        font.pixelSize: 23
                        color: "white"
                        anchors.centerIn: parent
                        text: "OFF"
                    }
                }
                color: "#222"
                border.color: "#444"
                border.width: 2
            }
            handle: Rectangle {
                width: parent.parent.width/2
                height: control.height
                color: "#444"
                border.color: "#555"
                border.width: 2
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

    IpGet{
        id:ipget
    }

    FileIO{
        id:myFile
        source:Name.dhire + "default.conf";
        onError: console.log(message);
    }

    Component.onCompleted: {
        network.checked = home.network_mode
    }



}

import QtQuick 2.0
import QtMultimedia 5.0
import "Name.js" as Name



Rectangle {
    anchors.fill:parent

    color:"white"

    Text{
        id:text
        color:"black"
        anchors.centerIn:parent
        font.pixelSize: 100
        text:"programmig class"

        SequentialAnimation{
            id: textanimation
            property alias dur:anim.duration
            property alias dur2:anim2.duration
            running: true
            loops: Animation.Infinite
            NumberAnimation{
                id:anim
                target: text
                property: "opacity"
                from: 0
                to: 1
                duration: 700

            }
            NumberAnimation{
                id:anim2
                target: text
                property: "opacity"
                from: 1
                to: 0
                duration:700

            }

        }
        MouseArea{
            anchors.fill: parent
           onClicked:{
               playAudio.pause()
              // textanimation.dur = 100

               textanimation.dur = 30
               textanimation.dur2 =30
               textanimation.restart();
               home.shadow = 1;
            //   home.nextdata()
        }
    }
    }

    Rectangle {
        id: backButton
        width:60
        height:80
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.bottom: parent.bottom
        color : "transparent"
        MouseArea {
            id: backmouse
            anchors.fill: parent
            onClicked: home.receive()
        }
    }



    Component.onCompleted:{
        playAudio.play();
        home.startbgm();
    }


}

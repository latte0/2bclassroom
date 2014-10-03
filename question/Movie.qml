import QtQuick 2.0
import QtMultimedia 5.0
import FileIO 1.0
import "File.js" as Filerela
import "Name.js" as Name


Item {
    id:movie
    width: parent.width
    height: parent.height
    property bool goal

    MediaPlayer{
        id:player
        onStatusChanged:{
            if(status == MediaPlayer.EndOfMedia){
                goal = true
                videoPreview.closed();
            }
        }
        volume:0
    }

    VideoOutput{
        id:videoPreview
        source:player
        anchors.fill:parent
    }

    Rectangle {
        id: backButton
        width:60
        anchors.right: parent.right; anchors.bottom: parent.bottom
        anchors.margins:200
       // opacity: goal === true ? 1 : 0

        //anchors.verticalCenter: parent.verticalCenter
        antialiasing: true
        radius: 4
        color: "transparent"
        Behavior on opacity { NumberAnimation{} }
        Text {
            id:text
            font.pixelSize:100
            color:"red"
            text: "next"
            SequentialAnimation{
                running: true
                loops: Animation.Infinite
                NumberAnimation{
                    target: text
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 700

                }
                NumberAnimation{
                    target: text
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 700

                }

            }
            MouseArea {
                id: backmouse
                anchors.fill: parent
                onClicked:{
                    //if(goal===true){
                        Filerela.fileline++;
                        player.pause();
                        home.nextdata();
                    //}
                }
            }
        }
    }


    FileIO {
        id: myFile
        source: Name.dhire + Name.jun
        onError: console.log(msg)
    }


    Component.onCompleted:{
        goal = false;
        var name = myFile.read(Filerela.fileline);
        myFile.source = Name.dhire + name;
        player.source= Name.dhire + name;
        player.play()
    }




}

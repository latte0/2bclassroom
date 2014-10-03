import QtQuick 2.2
import FileIO 1.0
import TimePro 1.0

import "File.js" as Filerela
import "Name.js" as Name



Rectangle {
    id: puzzle

    property alias linecount:boxrepeater.model
    property bool goal
    property bool hintshow

    anchors.fill:parent
    color: "transparent"

    function checkin(){
        console.log("checkinnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
        var count =0;
        for(var i=0;i<linecount;i++){
      //      console.log(boxrepeater.itemAt(i).num)
            if(boxrepeater.itemAt(i).num !== -1){
                if(boxrepeater.itemAt(i).num === i+1)count++;

            }else{
                break;
            }
        }
        if(count === linecount){
            goal=true;
            console.log("uwaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        }

        console.log(count);
    }

    Timer{
        interval:5000; running:true;
        onTriggered: hintshow = true
    }
    ListModel{
        id:codelist
    }

    ListModel{
        id:codepuzzle
    }

/*
    Rectangle {
        width:700
        height:800

        ListView{
            id: box
            anchors.fill: parent
            id:coderepeater
            model:codepuzzle
            delegate:Puzzledelegateif{}
        }
    }
*/


                Column{
                    id: box
                    anchors.left: parent.left; anchors.top: parent.top; anchors.bottom: parent.bottom
                    anchors.margins: 50
                    anchors.topMargin:100
                    width: 700
                    height: 64

                   // anchors.fill:parent
                    opacity: 0.5

                    Text{
                        id:uetext
                        font.pixelSize: 50
                    }

                    Repeater {
                        id:boxrepeater
                        delegate: Dropitem { colorKey: "red" }
                    }

                    Text{
                        id:shitatext
                        font.pixelSize: 50
                    }

                }


        Column {
            id: source
            width: 700
           anchors.right: parent.right; anchors.top: parent.top; anchors.bottom: parent.bottom
           anchors.margins:50
           anchors.topMargin:100

            Repeater {
                id:_repeater
                model: Sentakushimodel{}
                delegate: Dragitem { colorKey: "red" }

            }
            FileIO {
                id: myFile
                source: Name.dhire +Name.jun
                onError: console.log(msg)
            }
            Component.onCompleted:{
                var name = myFile.read(Filerela.fileline);
                console.log(name);
                myFile.source = Name.dhire + name;

                var ran = [];

                var n = myFile.readline();

                for(var i=0;i<n;i++){
                    ran[i] = i+1;
                }
                for(var i=0;i<n;i++){
                    var j = Math.floor(Math.random() * (n));
                    var tmp = ran[i];
                    ran[i] = ran[j];
                        ran[j] = tmp;
                }
                for(var i=0;i<n;i++){
                    console.log(ran[i]);
                }

                    for(var i=0;i<myFile.readline();i++){
                        var k = ran[i];
                        _repeater.model.append({"textdata":myFile.read(k),"numberdayo":k});
                    }
            }
        }

        Rectangle {
            id: backButton
            width:60
            anchors.right: parent.right; anchors.bottom: parent.bottom
            anchors.margins:200
            opacity: goal === true ? 1 : 0
            //anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
            radius: 4
            color: "transparent"
            Behavior on opacity { NumberAnimation{} }
            Text {
                id:text
                font.pixelSize:100
                text: "next"
                color : "red"
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
                    anchors.margins: -10
                    onClicked:{
                        if(goal===true){
                            Filerela.fileline++;
                            home.nextdata();
                        }
                    }
                }
            }
        }

        Rectangle {
            id: hintbutton
            width:60
            anchors.bottom: parent.bottom
            anchors.bottomMargin:300
            anchors.horizontalCenter: parent.horizontalCenter
            opacity: hintshow ? 1:0
            antialiasing: true
            radius: 4
            color: "transparent"
            Behavior on opacity { NumberAnimation{} }
            Text {
                id:hinttext
                font.pixelSize:100
                text: "hint"
                color : "red"
                SequentialAnimation{
                    running: true
                    loops: Animation.Infinite
                    NumberAnimation{
                        target: hinttext
                        property: "opacity"
                        from: 0
                        to: 1
                        duration: 700

                    }
                    NumberAnimation{
                        target: hinttext
                        property: "opacity"
                        from: 1
                        to: 0
                        duration: 700

                    }

                }
                MouseArea {
                    id: hintmouse
                    anchors.fill: parent
                    anchors.margins: -10
                    onClicked:{
                        onClicked: {
                            home.hintread();
                        }
                    }
                }
            }
        }



        FileIO {
            id: myFilep
            source: Name.dhire + Name.jun
            onError: console.log(msg)
        }
        TimePro{
            id:fromtime
        }



        Component.onCompleted:{
            goal = false;
            var name = myFilep.read(Filerela.fileline);
            console.log(name);
            myFilep.source = Name.dhire+ name;
            linecount = myFilep.readline();
           // coderepeater.model.append()
        }



}

import QtQuick 2.0
import FileIO 1.0
import "delay.js" as Delay
import "TextCar.js" as Textcar
import "File.js" as Filerela
import "Name.js" as Name


Rectangle {
    id: explainroot
    width: parent.width
    height: parent.height
    property alias title : title.text
    property alias stepstring: step.running
    color: "white"

    function nextdata(){
        Textcar.i = 0
        Filerela.fileline++;
        home.nextdata();
        _thread.sendMessage({"time":1000});
    }

    function addlog(text){
        home.addlog(text)
    }

    function addfilerela(){
        Filerela.fileline++
    }

    WorkerScript{
        id: _thread
        source: "delay.js"
        onMessage:{
                    Textcar.readtext();
            console.debug("threadfinish");
        }
    }

    Timer{
        id:step
        interval:home.textspeed; running:false; repeat: true
        onTriggered: Textcar.nextchar()
    }

    function pretrans(text){
         title_pre.text = text;
     }

     Rectangle {
         id: pre
         width:500
         height:400

         property int ue:50

        anchors.top:parent.top
        anchors.topMargin:ue
        anchors.horizontalCenter: parent.horizontalCenter

        color:"transparent"

         Text{
             anchors.centerIn:parent
             id: title_pre
             font.pixelSize: 40
         }

         Behavior on ue{
             ParallelAnimation{
                 NumberAnimation { target: pre; property: "opacity"; duration: 100; from:0.8; to:0.3;easing.type: Easing.InOutQuad }
                 NumberAnimation { target: pre; property: "ue"; duration: 700; from:50; to:-title_pre.height*2-100; easing.type: Easing.OutQuad }
             }
             ScriptAction{script: title_pre = ""}

         }


     }


    Rectangle {
        id: _root
        width:500
        height:400

       anchors.top:parent.top
       anchors.topMargin:50
       anchors.horizontalCenter: parent.horizontalCenter

       color:"transparent"

        Component.onCompleted: Textcar.readtext()

        Text{
            anchors.centerIn:parent
            id: title
            font.pixelSize: 40
        }


    }

    Grid{
        spacing: 500
       // anchors.centerIn: parent
        anchors.bottom: parent.bottom
        columns:2

        Image{
            source:Name.dhire + "chilno.jpg"
        }

        Image{
            source:Name.dhire + "tech.png"

        }


    }
    FileIO {
        id: myFile
        source: Name.dhire + Name.jun
        onError: console.log(msg)
    }


    Component.onCompleted:{
        console.log(Filerela.fileline);
        var count = 0;
        while(myFile.read(Filerela.fileline).match(/.txt/)){
            var i = 0;
            var name = myFile.read(Filerela.fileline);
            myFile.source = Name.dhire + name;
            console.log("myfileeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeline", myFile.readline());
            Textcar.explain[count] = myFile.read(1);
            Textcar.explain[count] += "\n";
            for(i=1;i<myFile.readline();i++){
                console.log(myFile.read(i+1));
                Textcar.explain[count] += myFile.read(i+1);
                Textcar.explain[count] += "\n";
            }
            myFile.source = Name.dhire + Name.jun;
            Filerela.fileline++;
            count++;
        }
        explainroot.title = ""
        for(i=0;i<count;i++){
            Filerela.fileline--;
        }

        stepstring = true

      //  Textcar.readtext();
    }

    MouseArea{
        anchors.fill: parent
        onClicked: Textcar.nexttext()
    }
}

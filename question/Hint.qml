import QtQuick 2.0
import FileIO 1.0
import "TextCar.js" as Textcar
import "File.js" as Filerela
import "Name.js" as Name


Rectangle {
    id: explainroot
    width: parent.width
    height: parent.height
    property alias title : title.text

    color: "white"

    Rectangle {
        id: _root
        width:500
        height:400

       anchors.top:parent.top
       anchors.topMargin:50
       anchors.horizontalCenter: parent.horizontalCenter

       color:"pink"

        Text{
            anchors.centerIn:parent
            id: title
            font.pixelSize: 40
        }
        MouseArea{
            anchors.fill: parent
            onClicked: Textcar.nexttext()
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
            var i = 0;
            var name = myFile.read(Filerela.fileline);
            myFile.source = Name.dhire + name+".hint";
            if(myFile.read(1) !== ""){
            title.text = myFile.read(1);
            title.text += "\n";
            for(i=1;i<myFile.readline();i++){
                console.log(myFile.read(i+1));
                title.text += myFile.read(i+1);
                title.text += "\n";
                }
            }else{
                title.text = "Answer\n"
            }

        myFile.source = Name.dhire + Name.jun
        home.hint = true
    }

    Component.onDestruction: {
        home.hint =false;
    }
}

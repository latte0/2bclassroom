import QtQuick 2.0
import FileIO 1.0

import "File.js" as Filerela
import "Name.js" as Name
import "bunkijson.js" as Bunkijson


Rectangle {
    id:bunki
    color:"white"
    width :1600
    height:800
    property var adress:[]
    property var sentaku:[]
    property var line:[]
    property int count:0

    property string jsonname:""


    //anchors.fill:parent

    function bunki(){

    }

    Column{
        anchors.centerIn: parent
        Repeater{
            id: repeatermodel
            model: Sentakushimodel{}
            delegate:_delegate
        }
     }


    Component{
        id:_delegate
        Rectangle{
            id:delegaterec
            width:childrenRect.width;
            height:childrenRect.height;
            color:"white"
                Text{
                  text: adress
                  font.pointSize: 30
                  MouseArea{
                      anchors.fill:parent
                      hoverEnabled: true
                      onClicked: {
                          Filerela.fileline=line
                          Name.jun = sentaku
                          home.nextdata();
                      }
                      onExited:{
                          console.log("enter");
                          color = "white";
                      }
                      onEntered: color = "yellow";
                  }
              }
          }
    }

    Component.onCompleted:{
        var name = myFile.read(Filerela.fileline);
        console.log("thisi afsdfasfas");
        console.log(name);
        jsonname = name;
        Bunkijson.JsonParse(name);
        var i =0;
        for(i=0;i<adress.length;i++){
            console.log(adress[i]);

            repeatermodel.model.append({"adress":adress[i],"sentaku":sentaku[i],"line":line[i]});
        }


    }

    FileIO {
        id: myFile
        source: Name.dhire + Name.jun
        onError: console.log(msg)
    }


}

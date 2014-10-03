import QtQuick 2.0
import FileIO 1.0

//import "TextCar.js" as Textcar
import "choosejs.js" as ChooseJs
import "File.js" as Filerela
import "Name.js" as Name


Rectangle{
    id: list
    width :1600
    height:800

    property int again
    property int card:1

    function nextdata(){
        Filerela.fileline++;
        home.nextdata();
    }

    function add_choice(){

        console.log("add_choice");
        myFile.source = Name.dhire + Name.jun
        var name = myFile.read(Filerela.fileline);
        myFile.source = Name.dhire + name +".ch";
        console.log("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",myFile.readline(),name)
        var ran = Math.floor(Math.random () * myFile.readline());

        for(var j = 0;j<myFile.readline();j++){
            console.log(myFile.read(j+1));
            repeatermodel.model.append({"indi":myFile.read(j+1),"page":"Choose.qml"});
            if(j === ran) repeatermodel.model.append({"indi":ChooseJs.correct,"page":"Choose.qml"});
        }


   /*     for(var i=0;i<card;i++){
            if(i === ran) {
                repeatermodel.model.append({"indi":ChooseJs.correct,"page":"Choose.qml"});
            }else{
                myFile.source = "/usr/share/dict/words"

              / if(ChooseJs.allalphabet){
                    var content = myFile.word_find(ChooseJs.correct);
                    if(content !== ChooseJs.correct) repeatermodel.model.append({"indi":content,"page":"Choose.qml"});
                }else if(ChooseJs.allnumber){
                    var numran = Math.floor(Math.random() * 10000);
                    var numran_str = numran.toString();
                    repeatermodel.model.append({"indi":numran_str,"page":"Choose.qml"});
                }else{

                }
            }
        }*/
    }

    function word_find(){

    }



    ListModel{
        id:codelist
    }


        Rectangle{
            x:10
            y:100
            width:500
            height:800
            ListView{
                anchors.fill: parent
                    id:coderepeater
                    model:codelist
                    delegate:Choosedelegate{}
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
                      text: indi
                      font.pointSize: 30
                      MouseArea{
                          anchors.fill:parent
                          hoverEnabled: true
                          onClicked: ChooseJs.checked(indi);
                          onExited:{
                              console.log("enter");
                              color = "white";
                          }
                          onEntered: color = "yellow";
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
            again = 0;

            console.log("thisischooooooooooooooooooooooooose",Filerela.fileline);
            var name = myFile.read(Filerela.fileline);
            myFile.source = Name.dhire + name;
            ChooseJs.readmark_inside(myFile.read(0));
            var line = myFile.readline()
            var i
            for(i=0;i<line;i++){
                coderepeater.model.append({"code":myFile.read(i+1)})
                console.log(myFile.read(i+1))
            }

          //  if(again == 0) Filerela.fileline++;
          add_choice();

        }


        Text{
            opacity: again ==1 ? 1:0
            font.pixelSize: 70
            color:"red"
            text:"HINT"
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    home.hintread();
                }
            }
        }
        Rectangle{

            width:500
            height:800
            anchors.top:parent.top
            anchors.topMargin:300
            anchors.right: parent.right
            anchors.rightMargin: 20


            ListView{
                                anchors.fill: parent

                    id: repeatermodel;
                    model: Sentakushimodel{}
                    delegate:_delegate
            }
        }




}

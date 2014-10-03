import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.1

Item{
    id: root;
    visible: true
 //   width: 1600
 //   height: 800

    signal quit();

    function receivequit(){
        quit();
    }

    function gettime(){
        return timefunction.getCurrentDateTime();
    }

/*
    function nextdata(){
        function nextdata(){

           // mainView.push(Qt.resolvedUrl("Choose.qml"));

            console.log("this is home");
            var name = myFile.read(Filerela.fileline);
            myFile.source = "home/sharemen-note/" + name;

        //    Filerela.setfile(name,myFile.read(0));

           // Filerela.fileline++;

            console.log("setfile")

            if(name.match(/.txt/)){
                        mainView.push(Qt.resolvedUrl("Explain.qml"));
            }else{

                if(myFile.read(0).match(/@/)){
                    mainView.push(Qt.resolvedUrl("Choose.qml"));
                }else{
                    mainView.push(Qt.resolvedUrl("Puzzle.qml"));
                }

            }
            Filerela.fileline++;

        }
    }

   toolBar: BorderImage {
        border.bottom: 8
    //    source: "images/toolbar.png"
        width: parent.width
        height: 100

        Rectangle {
            id: backButton
            width: opacity ? 60 : 0
            anchors.left: parent.left
            anchors.leftMargin: 20
            opacity: stackView.depth > 1 ? 1 : 0
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
            height: 60
            radius: 4
            color: backmouse.pressed ? "#222" : "transparent"
            Behavior on opacity { NumberAnimation{} }
            Image {
                anchors.verticalCenter: parent.verticalCenter
                source: "start_push.png"
            }
            MouseArea {
                id: backmouse
                anchors.fill: parent
                anchors.margins: -10
                onClicked: stackView.pop()
            }
        }

    }


    Rectangle {
        id: background
        anchors.fill: parent
        focus: true

        // Draw gradient background
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#ffffff" }
            GradientStop { position: 1.0; color: "#999999" }
        }

        Image {
            anchors.centerIn: parent
            width: Math.max(parent.width, parent.height)
            height: width
            rotation: -20
            opacity: 0.1
          //  source: "hazure.jpg"
        }

        StackView {
            id: mainView
            anchors.fill: parent
            initialItem: Qt.resolvedUrl("Home.qml");
        }
    }
*/



    Home{
        id: home
    }


}

import QtQuick 2.0

Rectangle {
    id: log
    width: 1000; height: 0; color: "steelblue"
  //  x:100
   // y:0
    anchors.horizontalCenter: parent.horizontalCenter

    opacity:0.9

    property bool hide :false
    property bool show:false
    property int count:0



    visible:hide

    function addlog(text){
      logview.model.append({"text":text});
    }

    function locclear(){
        logview.model.clear();
    }

    ListView {
        id:logview
        anchors.fill: parent
     //   anchors.left:parent.left
        anchors.bottom:parent.bottom
        anchors.bottomMargin:60

        model: Logmodel{}
        verticalLayoutDirection: TopToBottom
        delegate: Item {
            height: 80; width: ListView.view.width
            Text {
                anchors.centerIn: parent
                text: modelData
                font.family: modelData
                font.pixelSize: 60
                color: "white"
            }
        }
        move: Transition{
            NumberAnimation{ properties: "x,y"; duration: 1000}
        }

    }


        Behavior on opacity { NumberAnimation{} }

        Text{
            id:show
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.bottom: parent.bottom
            text:"hide"
            font.pixelSize: 60
            MouseArea {
                id: backmouse
                anchors.fill: parent
                onClicked:{
                        log.height=0;
                        log.show = false;
                    }
                }
            }


    Behavior on height{
        SequentialAnimation{

            ScriptAction{script:logview.positionViewAtEnd();}

            NumberAnimation{
                        duration: 500
                        easing.type: Easing.OutBounce
            }
        }


    }
}

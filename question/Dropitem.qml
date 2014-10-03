import QtQuick 2.0


DropArea {
    id: dragTarget

    property string colorKey
    property alias dropProxy: dragTarget
    property bool contain: false
    property string objectname;
    property int num
    width: 700; height: 64
    keys: [ colorKey ]



    Rectangle {
        id: dropRectangle

        anchors.fill: parent
        color: "grey"


        states: [
            State {
                when: dragTarget.containsDrag
                PropertyChanges {
                    target: dropRectangle
                    color: "grey"
                }
            },
            State{
                when: dragTarget.containsDrag === false
                PropertyChanges{
                    target: dropRectangle
                    color: "red"
                }
            }

        ]
    }

    onDropped:{
        console.log("enterrrrrrrrrrrrrrrrrrrrrrrrr");
        console.log("test");
        console.log(drag.source.tellnumber);
        num = drag.source.tellnumber;
        objectname = drag.source.toString();
        drag.source.rot = 0;
        contain = true;
        checkin();

    }
    onExited:{
        console.log("ijijijjjjjjjjjjjjjjjjjjjjj");
        if(objectname === drag.source.toString()){
        contain = false;
        }
    }

    Component.onCompleted: {
        num = -1;
    }
}

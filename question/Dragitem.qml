import QtQuick 2.0
import FileIO 1.0

Item {
    id: root
    property string colorKey
    property bool sit
    property string objectname
    property alias num: tile.tellnumber
    property alias kaku:tile.rot

    width: 700; height: 64

    MouseArea {
        id: mouseArea

        width: 700; height: 64
        anchors.centerIn: parent

        drag.target: tile

        onReleased:{
            if(tile.Drag.target !== null){
                if(tile.Drag.target.contain ===true){
                parent = root;
                    if(sit=== true){

                    }
                }
                else{
                    console.log(Drag.source.toString());
                    console.log(num);
                    parent = tile.Drag.target !== null ? tile.Drag.target : root;
                    tile.Drag.drop();
                    sit = true;
                }
            }else{
                                    parent = tile.Drag.target !== null ? tile.Drag.target : root;
            }

        }

      /* onDoubleClicked ( MouseEvent mouse ):{
            mouse.ignore()

        }
        */

        Rectangle {
            id: tile

            property int tellnumber;
            property int rot;

            rotation:rot

            width: 700; height: 64
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            color: "white"

            Drag.keys: [ colorKey ]
            Drag.active: mouseArea.drag.active
            Drag.hotSpot.x: 32
            Drag.hotSpot.y: 32

            Text {
                anchors.fill: parent
                font.pixelSize: 48
                text: textdata
            }

            states: State {
                when: mouseArea.drag.active
                ParentChange { target: tile; parent: root }
                AnchorChanges { target: tile; anchors.verticalCenter: undefined; anchors.horizontalCenter: undefined }
            }

            Behavior on rot{
                NumberAnimation{
                  duration:100
                }
                }
            }

    }

    Component.onCompleted: {
        sit = false;
        num = numberdayo
        kaku = Math.floor(Math.random() * (10)) -Math.floor(Math.random() * (20));
    }
}

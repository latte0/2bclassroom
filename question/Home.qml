import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.1
import QtMultimedia 5.0
import FileIO 1.0


import "File.js" as Filerela
import "Name.js" as Name
import "bunkijson.js" as Bunkijson

Rectangle{
    id: home
    visible: true
    anchors.fill: parent

    property alias shadow:hiderec.opacity
    property bool finish:false
    property bool save:false
    property string savefile:""
    property bool hint:false
    property int saveline:0
    property int textspeed:50
    property var nyu:[]
    property bool network_mode:false
    property string hostip:"192.168.0.1"
    property string passwd:"2bishikawa"


    function logshow(show){
        log.hide= show
    }

    function receive(){
        receivequit()
    }

    function home_gettime(){
        return gettime();
    }

    function addlog(text){
        text = text.replace(/[\n\r]/g,"");
        var cut = 15;
        var len = text.length;
        for(var i= cut; i<len+cut; i=i+cut){
            var a = text.slice((i-cut),i);
            log.addlog(a);
        }
        log.addlog(" ");
    }
    function logclear(){
        log.locclear();
    }

    function hintread(hint){
        mainView.push(Qt.resolvedUrl("Hint.qml"));
    }

    function startbgm(){
        playAudio.play()
    }

    function nextdata(){
        mousemukou.visible = true;
        myFile.source =Name.dhire + Name.jun;
        var name = myFile.read(Filerela.fileline);
        myFile.source = Name.dhire+ name;
            console.log("setfile",myFile.source)


            if(name.match(/.mp4/)){
                mainView.push(Qt.resolvedUrl("Movie.qml"));
            }

            else if(name.match(/.jpg/) || name.match(/.png/)){
                mainView.push(Qt.resolvedUrl("Imageloader.qml"));
            }

            else if(name.match(/.txt/)){
                        mainView.push(Qt.resolvedUrl("Explain.qml"));
            }

            else if(name.match(/{/)){
                mainView.push(Qt.resolvedUrl("Bunki.qml"))
            }

            else if(name.match(/.cpp/)){
                if(myFile.read(0).match(/@/)){
                    mainView.push({item:Qt.resolvedUrl("Choose.qml"),propertyies: {again:0}});
                }else{
                    mainView.push(Qt.resolvedUrl("Puzzle.qml"));
                }

            }else{
                if(name.match(/.mp3/)){
                    playAudio.stop();
                    playAudio.source = Name.dhire + name;
                    playAudio.play();
                    Filerela.fileline++;
                    nextdata();
                }else{
                    mainView.clear();
                    playAudio.stop();
                    finish = true;
                    savefile=""
                    save = false;
                    logclear();
                    hiderec.opacity=1;
                    Name.jun="jun"

                }
            }
    }



    Audio{
        id:playAudio
        source: Name.dhire + "daydreamcafe.mp3"
        volume:0.5
        loops:Audio.Infinite
       // autoPlay:true
    }

    Audio{
        id:se
        source:Name.dhire + "button81.mp3"
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
            initialItem: Qt.resolvedUrl("Initial.qml");
            delegate: StackViewDelegate {
                function transitionFinished(properties)
                {
                    properties.exitItem.x = 0
                    properties.exitItem.rotation = 0
                    mousemukou.visible = false;
                }

                pushTransition: StackViewTransition {
                    SequentialAnimation {
                        ScriptAction {
                            script: enterItem.opacity = 0
                        }
                        PropertyAnimation {
                            target: enterItem
                            property: "scale"
                            from: 0.5
                            to: 1
                        }
                        PropertyAnimation {
                            target: enterItem
                            property: "opacity"
                            from: 0
                            to: 1
                        }
                    }
                    PropertyAnimation {
                        target: exitItem
                        property: "opacity"
                        from: 1
                        to: 0
                    }
                }
            }

        }
    }




    Rectangle {
        id: backButton
        width: opacity ? 60 : 0
        anchors.left: parent.left
        anchors.leftMargin: 20
        opacity: hint ? 1 : 0
        anchors.bottom: parent.bottom
        antialiasing: true
        height: 60
        radius: 4
        color : "transparent"
     //   Behavior on opacity { NumberAnimation{} }
        Text{
            anchors.verticalCenter: parent.verticalCenter
            text:"back"
            font.pixelSize: 60

        }
        MouseArea {
            id: backmouse
            anchors.fill: parent
        //    anchors.margins: 20
            onClicked:{

                if( hint === true && backButton.opacity === 1){
                    mainView.pop()
                    while(myFile.read(Filerela.fileline-1).match(/.txt/)&& myFile.read(Filerela.fileline).match(/.txt/)){
                        myFile.source = Name.dhire + Name.jun;
                        Filerela.fileline--;
                }

            //        Filerela.fileline--;
                }
               /* if(myFile.read(Filerela.fileline).match(/.mp3/)){
                    Filerela.fileline--;
                }*/
                        console.log(Filerela.fileline);
                hint = false;
            }
        }

    }

    Rectangle {
        id: loadButton
        width: opacity ? 60 : 0
        anchors.right: parent.right
        anchors.rightMargin: 350
        opacity:  save ? 1 : 0
        anchors.bottom: parent.bottom
        antialiasing: true
        height: 80
        radius: 4
        color : "transparent"
        Behavior on opacity { NumberAnimation{} }
        Text{
            anchors.verticalCenter: parent.verticalCenter
            text:"LOAD"
            font.pixelSize: 60

        }
        MouseArea {
            id: loadmouse
            anchors.fill: parent
            onClicked:{
                if(save === true){
                  //  mainView.clear();
                 //   playAudio.stop();
                //    finish = true;
                 //   logclear();
                    hiderec.opacity=1;

                    }

                }
            }
        }

        Text{
            id:savetext
            anchors.right: parent.right
            anchors.rightMargin: 70
            anchors.bottom: parent.bottom
            font.pixelSize: 60
            antialiasing: true
            visible: mainView.depth > 1 ? 1:0
            text:"SAVE"
            MouseArea{
                anchors.fill:parent
                onClicked:{
                    confirm.visible = true
                    confirm.opacity = 1

                }
            }
        }

        Text{
            id:configbutton
            anchors.right: parent.right
            anchors.rightMargin: 600
            anchors.bottom: parent.bottom
            font.pixelSize: 60
            visible: mainView.depth > 1 ? 1:0
            antialiasing: true
            text:"CONFIG"
            MouseArea{
                anchors.fill:parent
                onClicked:{
                    config.visible = true
                    config.width = 800
                }
            }
        }






    Rectangle {
        width: 60
        anchors.left: parent.left
        anchors.leftMargin: 20
        opacity: mainView.depth > 1 ? 1 : 0
        anchors.top: parent.top
        antialiasing: true

        height: 60
        radius: 4
        color : "transparent"
        Behavior on opacity { NumberAnimation{} }
        Text{
            opacity: log.show==false ? 1:0
            anchors.verticalCenter: parent.verticalCenter
            text:"logshow"
            font.pixelSize: 60
            MouseArea {
                anchors.fill: parent
                onClicked:{
                    if(mainView.depth > 1 && log.show == false){
                        log.height=900;
                        log.show = true;
                    }

                  }
            }
        }

    }

    Log{
        id:log
        hide:false
        show:false
    }

    Config{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        id:config
        visible:false
    }

    Adminmenu{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        id:adminmenu
        visible:false
    }

    Rectangle{
        id:hiderec
        anchors.fill:parent
        color: "black"
        opacity:0
        Behavior on opacity{
            SequentialAnimation{
                ScriptAction{
                    script:{
                        if(finish===false) script:se.play();
                        else{}
                    }
                }

                NumberAnimation{
                    from:0
                    to:0
                    duration:200
                }

                NumberAnimation{
                    from:0
                    to:1
                    duration:2000

                }
                ScriptAction{
                    script:logshow(true)
                }
                ScriptAction{
                    script:{
                        if(finish === false && save ===false)nextdata()
                        else if (finish === true && save === false){
                            Filerela.fileline=1;
                            finish = false;
                            mainView.push(Qt.resolvedUrl("Initial.qml"));
                        }
                        if(save === true){
                                Filerela.fileline = saveline
                                console.log("load comon")
                                var i
                                myFile.source =Name.dhire + savefile;
                                Name.jun = savefile
                            console.log(savefile,"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                                var name = myFile.read(saveline);
                                myFile.source = Name.dhire  + name;
                           //     mainView.ini

                                if(name.match(/.mp4/)){
                                    mainView.push(Qt.resolvedUrl("Movie.qml"));
                                }

                                else if(name.match(/.jpg/)){}

                                else if(name.match(/.txt/)){
                                            mainView.push(Qt.resolvedUrl("Explain.qml"));
                                }

                                else if(name.match(/{/)){
                                    mainView.push(Qt.resolvedUrl("Bunki.qml"))
                                }

                                else if(name.match(/.cpp/)){
                                    if(myFile.read(0).match(/@/)){
                                        mainView.push({item:Qt.resolvedUrl("Choose.qml"),propertyies: {again:0}});
                                    }else{
                                        mainView.push(Qt.resolvedUrl("Puzzle.qml"));
                                    }

                                }else{
                                    if(name.match(/.mp3/)){
                                        playAudio.stop();
                                        playAudio.source = Name.dhire + name;
                                        playAudio.play();
                                        Filerela.fileline++;
                                        nextdata();
                                    }else{
                                        mainView.clear();
                                        playAudio.stop();
                                        finish = true;
                                        logclear();
                                        hiderec.opacity=1;

                                    }
                                }
                            }
                    }
                }
                NumberAnimation{
                    from:1
                    to:1
                    duration:500
                }

                NumberAnimation{
                    from:1
                    to:0
                    duration:2000

                }
                ScriptAction{
                    script:mousemukou.visible = false;

                }
            }
        }
    }

    Rectangle {
        id:confirm
        width: 500
        height: 300
        anchors.centerIn: parent
        visible:false
        opacity: 0
        antialiasing: true
        radius: 10
        color : "steelblue"
        Behavior on opacity { NumberAnimation{} }
        Rectangle{
            id:yes
            width:150
            height:70
            radius: 10
            anchors.verticalCenter: parent.verticalCenter
            x:50
            color:"transparent"
            Text{
                anchors.centerIn: parent
                text:"Yes"
                font.pixelSize: 70

                MouseArea {
                    anchors.fill: parent
                    onClicked:{
                        if(confirm.visible === true){
                            save = true;
                            saveline = Filerela.fileline
                            savefile = Name.jun
                            confirm.visible = false
                            confirm.opacity = 0
                        }
                      }
                    hoverEnabled: true
                    onExited:{
                        console.log("enter");
                        yes.color = "transparent";
                    }
                    onEntered: yes.color = "yellow";


                }
            }
        }
        Rectangle{
            id:no
            anchors.verticalCenter: parent.verticalCenter
            width:150
            height: 70
            x:300
            radius: 10
            color:"transparent"
            Text{
                anchors.centerIn: parent
                text:"No"
                font.pixelSize: 70
                MouseArea {
                    anchors.fill: parent
                    onClicked:{
                        if(confirm.visible === true){
                            confirm.visible = false
                            confirm.opacity = 0
                        }
                      }
                    hoverEnabled: true
                    onExited:{
                        console.log("enter");
                        no.color = "transparent";
                    }
                    onEntered: no.color = "yellow";


                }
            }
        }


    }

    Keys.onPressed:{
        console.log(passwd);
        console.log(passwd.length)
                console.log("iiiiiiiiiiiiiiiiiiii",passwd)

        if(nyu.length >= passwd.length){
            nyu.shift()
            nyu.push(event.text)
        }else{
            nyu.push(event.text)
        }
        var i;
        var k=0;
        for(i=0;i<passwd.length;i++){
            if(nyu[i] === "" ) break;
            if(passwd.charAt(i) === nyu[i]) k++;
        }
        if(k===passwd.length){
            adminmenu.visible = true
            adminmenu.width = 800
            playAudio.stop()
        }

                event.accept= true
    }

/*
    Image{
        id:re1
        width:3000
        height:2
        y:50
        x:10
        source:Name.dhire + "resear.png"
        NumberAnimation { loops: Animation.Infinite; running: true; target: re1; property: "x"; duration: 1000;  from:1600;  to:-600 }
    }

    Image{
        id:re2
        width:3000
        height:2
        y:850
        x:10
        source:Name.dhire + "resear.png"
        NumberAnimation { loops: Animation.Infinite; running: true; target: re2; property: "x"; duration: 1000;  from:1600;  to:-600 }
    }

    Image{
        id:re3
        width:2000
        height:2
        rotation:90
        y:50
        x:10
        source:Name.dhire + "resear.png"
        NumberAnimation { loops: Animation.Infinite; running: true; target: re3; property: "y"; duration: 1000;  from:1600;  to:-600 }
    }

    Image{
        id:re4
        width:2000
        height:2
        rotation:90
        y:850
        x:10
        source:Name.dhire + "resear.png"
        NumberAnimation { loops: Animation.Infinite; running: true; target: re4; property: "y"; duration: 1000;  from:1600;  to:-600 }
    }

*/
    FileIO {
        id: myFile
        source: Name.dhire + Name.jun
        onError: console.log(msg)
    }

    FileIO {
        id: def
        source: Name.dhire + "default.conf"
        onError: console.log(msg)
    }

    Component.onCompleted:{
        var i
        for(i=0;i<def.readline();i++){
            if(def.read(i+1).slice(0,def.read(i+1).indexOf(":")) === "HOSTIP") hostip = def.read(i+1).slice(def.read(i+1).indexOf(":")+1,def.read(i+1).length)
            if(def.read(i+1).slice(0,def.read(i+1).indexOf(":")) === "PASS"){
                 home.passwd = def.read(i+1).slice(def.read(i+1).indexOf(":")+1,def.read(i+1).length)
            }
            if(def.read(i+1).slice(0,def.read(i+1).indexOf(":")) === "NETWORKMODE"){
                 if(def.read(i+1).slice(def.read(i+1).indexOf(":")+1,def.read(i+1).length) === "ON") network_mode = true
                 }

        }
    }

    MouseArea {
        id: mousemukou
        visible:false
        anchors.fill: parent

        onClicked:{

        }
    }



}

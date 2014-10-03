import QtQuick 2.0

Item {
    id: choosedelegate
    width: parent.width
    height: former.height;
    property string formertext:""
    property string latertext:""
    property string code:""

   // Grid{
     //   spacing: 12
      //  anchors.centerIn: parent

  //      columns:3

        Text{
            id:former
            font.pixelSize: 50
            text:""
            anchors.left: parent.left
            anchors.leftMargin: 20

        }
        Rectangle{
            id:hiderectangle
            visible:false
            x:former.x + former.width + 1
            width:100
            height:60
            color:"black"
        }

        Text{
            id:later
            font.pixelSize: 50
            text:""
            anchors.left: parent.left
            anchors.leftMargin: former.width + hiderectangle.width +former.x
        }

 //   }

    Component.onCompleted: {
        code = model.code
        var code_pre = code
        if(code.match(/@/)){
            var i=0
            var atmarkflag = false

            while(1){
                if(code[i] === "@"){
                    if(atmarkflag === true) break;
                    atmarkflag = true
                }
                if(atmarkflag) code[i] = "@"
                i++
            }
            code = code.replace("@","")

        hiderectangle.visible=true
            console.log(code.indexOf("@"))
            former.text = code_pre.slice(0,code_pre.indexOf("@"));
            console.log(former.text,"qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq")
            later.text = code_pre.slice(code_pre.lastIndexOf("@")+1,-1);
            console.log(later.text)

}else{
            former.text = code
        }

    }

}

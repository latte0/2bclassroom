
var nowtext = "";
var explainline = 0;
var explain= [];
var i =0
var charcount=0
var charfinished = false


function nextchar(){
    if(charcount >= nowtext.length){
        charfinished = true
        explainroot.title = nowtext
        explainroot.stepstring = false
    }else{

      explainroot.title += nowtext.charAt(charcount++)
    }

}

function nexttext(){
    if(charfinished){
        i++;
        explainroot.addlog(nowtext);
        console.log("nexttext",i,explainline);
        if(i >=explain.length){
           // mainView.push(Qt.resolvedUrl("Choose.qml"));
           explainroot.nextdata();
           charfinished = false
        }
        else{
            title_pre.text = nowtext
            pre.ue = 100
            nowtext = explain[i];
            addfilerela()
            explainroot.title = "";
            charfinished = false
            explainroot.stepstring = true
            charcount = 0
        }
    }else{
        charfinished = true
        charcount = nowtext.length +10
        explainroot.title = nowtext
        explainroot.stepstring = false
    }
}

function readtext(){
    explainline = 0;
    i=0;

    nowtext = explain[0];
    console.log(nowtext);
  //  explainroot.title = nowtext;

    explainline = explain.length;

}

function notextret(){
    return nowtext
}


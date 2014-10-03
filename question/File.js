.pragma library


var fileline =1
var currentfile=""

function setfile(filename,program){
    console.log("setfile")

    if(filename.match(/.txt/)){
                mainView.push(Qt.resolvedUrl("Explain.qml"));
    }else{

        if(program.match(/@/)){
            mainView.push(Qt.resolvedUrl("Choose.qml"));
        }else{
            mainView.push(Qt.resolvedUrl("Puzzle.qml"));
        }

    }
}

function loadfile(program){
    console.log("loadfile");
  //  if(loadfile_shu == 0){
        if(program.match(/@/)){
            mainView.push(Qt.resolevedUrl("Choose.qml"));
        }else{
            mainView.push(Qt.resolvedUrl("Puzzle.qml"));
        }

    //}else if(loadfile_shu == 1){

    //}
}

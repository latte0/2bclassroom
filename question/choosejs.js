var correct = "test";
var allalphabet = false;
var allnumber = false;



function readmark_inside(program){
        var result = program.search(/@/);
        program = program.substr(result+1);
        result = program.search(/@/);
        program =program.slice(0,result);

    correct = program

    if(correct.match(/[^A-Za-z/s.-]+/)){
        if(correct.match(/[^0-9]+/)){
        }else{
            allnumber = true;
        }
    }else{
        allalphabet = true;
    }



    console.log("helloooooooooooooooooo", program);

}

function checked(indi){
    if(indi === correct){
        list.nextdata();
    }
    else {
        again = 1;
        //mainView.push({item:Qt.resolvedUrl("Choose.qml"),propertyies: {again:1}});
    }

}

function JsonParse(text){
    var i=0
    var k=0;
    var l=0;
    var m=0;
    var count=0;
    var doublequotaflag = false
    var next = 0
    var loop = false

    while(1){
        if(text[i] === "\""){
            doublequotaflag = true
            console.log("doubleko-to true")
            i++;
        }
        if(doublequotaflag === true){
            var str = ""
            while(text[i] !== "\""){
                str += text[i];
                i++;
                loop = true
            }
            doublequotaflag = false;
            if(loop ===true){
                if(next === 0){
                    bunki.sentaku[k] = str
                    next = 1
                    k++;
                    count++;
                }
                else if(next === 1){
                    bunki.adress[l] = str
                    next = 2;
                    l++;
                }
                else if(next === 2){
                    bunki.line[m] = str
                    next =0
                    m++;
                }
              }
        }
                if(text[i] ==="}") break;
        i++;
        loop= false;
    }

    for(i=0;i<count;i++){
        console.log(bunki.sentaku[i]);
        console.log(bunki.adress[i]);

    }
    bunki.count = count;

}

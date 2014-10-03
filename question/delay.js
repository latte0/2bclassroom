WorkerScript.onMessage = function(message){
    console.debug("thread start");
    var now = 0;
    delay(1000);
    WorkerScript.sendMessage({})
}

function delay(msec){
    var start = 0;
    start = new Date();
    do{
        var now = new Date();
    }while((now - start ) < msec);
}

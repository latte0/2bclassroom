function load() {

    listModel.clear();
    var text
    var xhr = new XMLHttpRequest();
   xhr.open("GET","http://data.json",true);
    xhr.onreadystatechange = function()
    {
        if ( xhr.readyState == xhr.DONE)
        {
            if ( xhr.status == 200)
            {
                var jsonObject = xhr.responseText
            }
        }
    }
    xhr.send();
}

/**
 * Created by Squall on 03/03/2015.
 */
function getXML(filename)
{
    var xhr = new XMLHttpRequest();
    xhr.open("GET", filename, false);
    xhr.send(null);
    return xhr.responseXML;
}

function getXMLJQ(myUrl) {
    var xhr = $.ajax({
        url:      myUrl,
        datatype: "xml",
        async:    false
    });
    return xhr.responseXML;
}
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
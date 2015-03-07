function roundSearch(roundType, num)
{
    console.log("Num Val" + num.toString());
    if ((document.getElementById("resultDisplay").hasChildNodes())) { //Handles Before a Search is Entered
        removeResults();
    }
    var rsXslChange = "match [round='" + num + "']";
    $(stylesheet).find("xsl\\:apply-templates, apply-templates")
        .eq(0)
        .attr("select", rsXslChange);
    if (typeof (XSLTProcessor) != "undefined") {

    }
    else
    {
        window.alert("Your browser sucks...");
    }
    var reResults = proc.transformToFragment(xmlDoc, document);
    document.getElementById("resultDisplay").appendChild(reResults);
}

function search(isExactSearch, nameVar)
{
    if ((document.getElementById("resultDisplay").hasChildNodes())) { //Handles Before a Search is Entered
        removeResults();
    }
    if (isExactSearch)
    {
        playerSearchString = "match [player/name='" + nameVar + "']";
    }
    else
    {
        playerSearchString = "match [player/name[contains(.,'" + nameVar + "')]]";
    }
}

function setSearch(setType, num)
{
    setSearchString = eqXslChange = "match [.//player[position()=1]/sets-won + .//player[position()=2]/sets-won='" + num + "']";
}

function roundSearch(roundType, num)
{
    roundSearchString = rsXslChange = "match [round='" + num + "']";
}

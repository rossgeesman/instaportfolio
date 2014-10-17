
var currentURL = location.href;
var n = currentURL.lastIndexOf('/');
currentURL = currentURL.substring(n + 1);



function Get(yourUrl){
var Httpreq = new XMLHttpRequest(); // a new request
Httpreq.open("GET",yourUrl,false);
Httpreq.send(null);
return Httpreq.responseText;          

    }
function poll() {
	if ( Get("/imagesets/processing/" + currentURL) == 1 ) {
		alert("Not done yet");
	} else {
		clearInterval(interval);
	}
}
var interval = window.setInterval(poll, 5000);


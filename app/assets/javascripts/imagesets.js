
var currentURL = location.href;
var n = currentURL.lastIndexOf('/');
currentURL = currentURL.substring(n + 1);

function Get(yourUrl){
var Httpreq = new XMLHttpRequest(); // a new request
Httpreq.open("GET",yourUrl,false);
Httpreq.send(null);
return Httpreq.responseText;          
 }

function reload(url){
img = document.getElementById("averaged-image");
img.src = url
}


function poll() {
	if ( Get("/imagesets/processing/" + currentURL) == 1 ) {
		document.getElementById('alert-box').style.display='block';
	} else {
		var processedIMGurl = Get("/imagesets/processed_image/" + currentURL)
		reload(processedIMGurl);
		document.getElementById('alert-box').style.display='none';
		clearInterval(interval);
	}
}

var interval = window.setInterval(poll, 5000);



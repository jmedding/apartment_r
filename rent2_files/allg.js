function toggleBelegung() {
	var ele = document.getElementById("belegung");
	var text = document.getElementById("bel_text");
	if(belegung.style.visibility="hidden") {
    		belegung.style.visibility="visible";
			belegung.style.height="auto"
		text.innerHTML = "open";
  	}
	else {
		belegung.style.visibility="hidden";
		belegung.style.height="1px"
		text.innerHTML = "close";
	}
}
function toggleAGB() {
	var ele = document.getElementById("div_agb");
	if(ele.style.visibility="hidden") {
    		ele.style.visibility="visible";
			ele.style.height="auto"
  	}
	else {
		ele.style.visibility="hidden";
		ele.style.height="1px"
	}
}



function getDate1() {
	var oldDate1 = document.jQuery.date1.value;
	//var newDate2 = document.getElementById("date2");
	document.jQuery.test.value = oldDate1;
	//newDate2.setAttribute(value, oldDate1);
 }
 
 function setDate2() {
	var newDate2 = document.getElementById("date1");
	Date2.setAttribute(value, newDate2);
 }
 
 function LoadBar() {  
    document.getElementById("mainContent").style.display = "none";
	document.getElementById("loadingZone").style.display = "table";
	document.getElementById("loadingZone").style.height = "500px";

	};  
function LoadList() {  
    document.getElementById("object_list").style.display = "none";
    document.getElementById("liste").style.display = "none";
	document.getElementById("loadingZone").style.display = "table";
	document.getElementById("loadingZone").style.height = "500px";

	};  
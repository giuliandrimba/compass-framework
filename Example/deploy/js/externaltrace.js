// JavaScript Document

window.onload = function()
{
	createTraceDiv();
}

function createTraceDiv()
{
	var traceDiv = document.createElement("div");
	traceDiv.setAttribute("id","external-trace");
	document.firstChild.nextSibling.appendChild(traceDiv);
}

function externalTrace(msg)
{
	var newTraceMessage = document.createElement("span");
	newTraceMessage.innerHTML = "<font size='2' face='Arial'>" + msg + "</font><br />";
	document.getElementById("external-trace").appendChild(newTraceMessage);
}
var connection;
var tsChannel = "";
var latestPluginVersion = "1.0";
var status = 0;
var count = 1;
var debug = false;
var tsChannelName = "";
var clientID = "";
function init(){
	if(count <= 5 && debug){
		document.getElementById("console").innerHTML += "<br>Init called";
		count++;
	}
	else if(debug){
		var lines = document.getElementById("console").innerHTML.split('<br>');
		lines.splice(0,1);
		document.getElementById("console").innerHTML = lines.join('<br>');
		document.getElementById("console").innerHTML += "<br>Init called";
	}
	connection = new WebSocket('ws://localhost:2445/echo');
	connection.onopen = function()
		{
			if(count <= 5 && debug){
				document.getElementById("console").innerHTML += "<br>connection opened";
				count++;
			}else if(debug){
				var lines = document.getElementById("console").innerHTML.split('<br>');
				lines.splice(0,1);
				document.getElementById("console").innerHTML = lines.join('<br>');
				document.getElementById("console").innerHTML += "<br>connection opened";
			}
			connection.send("updateTeamspeakInfo\0" + tsChannel);
		};
	connection.onerror = function(evt)
	{
		if(count <= 5 && debug){
			document.getElementById("console").innerHTML += "<br>ERROR- " + evt.data;
			count++;
		}else if(debug){
			var lines = document.getElementById("console").innerHTML.split('<br>');
			lines.splice(0,1);
			document.getElementById("console").innerHTML = lines.join('<br>');
			document.getElementById("console").innerHTML += "<br>ERROR- " + evt.data;
		}
	};
	connection.onmessage = function(evt)
	{
		if(count <= 5 && debug){
			document.getElementById("console").innerHTML += "<br>msg- " + evt.data;
			count++;
		}else if(debug){
			var lines = document.getElementById("console").innerHTML.split('<br>');
			lines.splice(0,1);
			document.getElementById("console").innerHTML = lines.join('<br>');
			document.getElementById("console").innerHTML += "<br>msg- " + evt.data;
		}
		if(evt.data.includes("plugin version:")){
			var v = evt.data.split(":")[1];
			if(v == latestPluginVersion){
				document.getElementById("current version").innerHTML = "Plugin Version: <font color='green'>" + v + "</font> (up-to-date)";
			}else{
				document.getElementById("current version").innerHTML = "Plugin Version: <font color='red'>" + v + "</font> (update available)";
			}
		}
		else if(evt.data == "startedtalking") {
			$.post('http://cloudvoip/setTalking', JSON.stringify({
				state: 1
			}));
		}else if(evt.data == "stoppedtalking") {
			$.post('http://cloudvoip/setTalking', JSON.stringify({
				state: 0
			}));
		}else if(evt.data.includes("clientID:")) {
			clientID = evt.data.split(":")[1];
			$.post('http://cloudvoip/setClientID', JSON.stringify({
				id: clientID
			}));

		}else if(evt.data.includes("status:")){
			switch(parseInt(evt.data.split(":")[1])){
				case 0:
					status = 0;
					document.getElementById("plugin status").innerHTML = "Plugin Status: <font color='red'>OFFLINE</font> (Teamspeak not open)";
					document.getElementById("teamspeakServerAdd").innerHTML = "<font color='red'>185.249.196.154:9030</font>";
					document.getElementById("channelName").innerHTML = "<font color='red'>"+tsChannelName+"</font>";
					document.getElementById("pluginScreen").style.display = "block";
					break;
				case 1:
					status = 1;
					document.getElementById("plugin status").innerHTML = "Plugin Status: <font color='red'>wrong Teamspeak server</font>";
					document.getElementById("teamspeakServerAdd").innerHTML = "<font color='red'>185.249.196.154:9030</font>";
					document.getElementById("channelName").innerHTML = "<font color='red'>"+tsChannelName+"</font>";
					document.getElementById("pluginScreen").style.display = "block";
					break;
				case 2:
					status = 2;
					document.getElementById("plugin status").innerHTML = "Plugin Status: <font color='red'>wrong Teamspeak channel</font>";
					document.getElementById("teamspeakServerAdd").innerHTML = "<font color='green'>185.249.196.154:9030</font>";
					document.getElementById("channelName").innerHTML = "<font color='red'>"+tsChannelName+"</font>";
					document.getElementById("pluginScreen").style.display = "block";
					break;
				case 3:
					status = 3;
					document.getElementById("plugin status").innerHTML = "Plugin Status: <font color='green'>ONLINE</font>";
					document.getElementById("teamspeakServerAdd").innerHTML = "<font color='green'>185.249.196.154:9030</font>";
					document.getElementById("channelName").innerHTML = "<font color='green'>"+tsChannelName+"</font>";
					document.getElementById("pluginScreen").style.display = "none";
					break;	
			}
		}
	};
	connection.onclose = function () {
		if(count <= 5 && debug){
			document.getElementById("console").innerHTML += "<br>connection closed- " + reason;
			count++;
		}else if(debug){
			var lines = document.getElementById("console").innerHTML.split('<br>');
			lines.splice(0,1);
			document.getElementById("console").innerHTML = lines.join('<br>');
			document.getElementById("console").innerHTML += "<br>connection closed- " + reason;
		}
		status = 0;
		document.getElementById("plugin status").innerHTML = "Plugin Status: <font color='red'>OFFLINE</font> (Teamspeak not open)";
		document.getElementById("teamspeakServerAdd").innerHTML = "<font color='red'>185.249.196.154:9030</font>";
		document.getElementById("channelName").innerHTML = "<font color='red'>"+tsChannelName+"</font>";
		document.getElementById("pluginScreen").style.display = "block";
		init();
	};
}
function messageReceived(event) {
	if (event.data.type == "init"){
		tsChannel = event.data.tsChannelPath;
		tsChannelName = event.data.tsChannelName;
		init();
	}else if(event.data.type == "updateUserData"){
		if (connection.readyState == connection.OPEN && status == 3) {
			connection.send(event.data.data);
			if(count <= 5 && debug){
			document.getElementById("console").innerHTML += "<br>sent msg- " + event.data.data;
			count++;
			}else if(debug){
				var lines = document.getElementById("console").innerHTML.split('<br>');
				lines.splice(0,1);
				document.getElementById("console").innerHTML = lines.join('<br>');
				document.getElementById("console").innerHTML += "<br>sent msg- " + event.data.data;
			}
		}
	}else if(event.data.type == "updateMode"){
		document.getElementById("mode").innerHTML = event.data.mode;
	}else if(event.data.type == "setOnDuty"){
		if (connection.readyState == connection.OPEN && status == 3) {
			connection.send("setOnDuty");
		}
	}else if(event.data.type == "setOffDuty"){
		if (connection.readyState == connection.OPEN && status == 3) {
			connection.send("setOffDuty");
		}
	}else if(event.data.type == "radioTalkingOn"){
		if (connection.readyState == connection.OPEN && status == 3) {
			connection.send("radioTalkingOn");
			document.getElementById("modeext").innerHTML = " on radio";
		}
	}else if(event.data.type == "radioTalkingOff"){
		if (connection.readyState == connection.OPEN && status == 3) {
			connection.send("radioTalkingOff");
			document.getElementById("modeext").innerHTML = "";
		}
	}else if(event.data.type == "setChannel"){
		document.getElementById("channel").innerHTML = "radio: " + event.data.channel;
		connection.send("setOnDuty");
	}else if(event.data.type == "removeChannel"){
		document.getElementById("channel").innerHTML = "";
		connection.send("setOffDuty");
	}
}
window.addEventListener("message", messageReceived, false);
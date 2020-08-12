<%@page import="com.virtusa.data.HistoricalObject"%>
<%@page import="com.virtusa.calldata.HistoricalData"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Historical data</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	   <link rel="shortcut icon" type="image/x-icon" href="docs/images/favicon.ico" />
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin=""/>
  <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js" integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew==" crossorigin=""></script>
	  
	  
</head>
<header>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<form action="welcome.jsp">
			<button class="btn btn-success" type="submit">main</button>
		</form>
	  <form class="form-inline" action="perioddata" method="post" style="margin: auto;">
	    <input class="form-control"type="text" placeholder="Location" name="cityname"style="width: 230px;margin:auto;">
		<div class="form-inline"style="width: 230px;margin:auto;" ><input class="form-control"type="date" placeholder="YYYY-MM-DD"min="2016-01-01" name="date1"style="width: 230px;margin:auto;"></div>
 		<div class="form-inline"style="width: 230px;margin:auto;" ><input class="form-control"type="date" placeholder="YYYY-MM-DD"min="2016-01-01" name="date2"style="width: 230px;margin: auto;"></div>
		<button class="btn btn-success" type="submit">Request Data</button>
	</form>
	   <form action="logout">
			<button class="btn btn-success" type="submit">logout</button>
		</form>
	</nav>
</header>
<style>
 th, td {
  border: 0.5px solid black;
   padding: 15px;
}
th{
	background:silver; 
}
 tr:nth-child(even) {background-color: #f2f2f2;}
</style>
<body style="background-image: linear-gradient(#e4b0f7,#f2b8b8,#ffe5c7,#97cade);background-attachment: inherit;">
	
	
	 <div class="jumbotron text-center" style="background-color: transparent;">
			<div class="container">
			<h1 style="margin: auto;font-family: cursive;"><%=HistoricalObject.getAddress() %></h1><br>
				<div class="row" > 
					<div class="col-sm-12">
						<div  id="mapid" style=" height:500px;border-radius: 25px;margin: auto;"></div>
					</div>
				</div>
			</div>
		</div> 
				
		<div class="jumbotron text-center" style="background-color: transparent;">
		<h1 style="margin: auto;font-family: cursive;">Historical Weather Forecast</h1><br>
			<div class="container">
				<div class="row" > 
					<div class="col-sm-12" style="border:black;font-family: sans-serif;">
						<table class="table-responsive" >
							<tr class="bg-info" style="border: 1px black;">
							<th style="width: 300px">Date and time</th>
							<th>Temparature<br>(deg &#8451 )</th>
							<th>Min Temparature<br>(deg &#8451 )</th>
							<th>Max Temparature<br>(deg &#8451 )</th>
							<th>Wind Speed </th>
							<th>Cloud Cover<br>( % )</th>
							<th>Heat Index</th>
							<th> Humidity </th>
							<th style="width: 250px">Condition</th>
							</tr>
							<tbody id="dataTable">
        
    						</tbody>
						</table>
						
					</div>
				</div>
			</div>
		</div>
</body>
<script >
document.createElement("table");
$(document).ready(function(){
	if(true){
		buildTable(<%=HistoricalObject.getValues() %>)
		function buildTable(data){
			var table = document.getElementById('dataTable')
		
			for (var i = 0; i < data.length; i++){
				var row = `<tr>
								<td>${data[i].datetimeStr}</td>
								<td>${data[i].temp}</td>
								<td>${data[i].mint}</td>
								<td>${data[i].maxt}</td>
								<td>${data[i].wspd}</td>
								<td>${data[i].cloudcover}</td>
								<td>${data[i].heatindex}</td>
								<td>${data[i].humidity}</td>
								<td>${data[i].conditions}</td>
								
						  </tr>`
				table.innerHTML += row
			}
		}
	}
});
</script>
<script>
var mymap = L.map('mapid').setView([ <%=HistoricalObject.getLatitude() %>,<%=HistoricalObject.getLongitude() %> ], 11);
L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
	maxZoom: 18,
	attribution: '',
	id: 'mapbox/streets-v11',
	tileSize: 512,
	zoomOffset: -1
}).addTo(mymap);
L.marker([<%=HistoricalObject.getLatitude() %>,<%=HistoricalObject.getLongitude() %>]).addTo(mymap)
.openPopup();
L.circle([<%=HistoricalObject.getLatitude() %>,<%=HistoricalObject.getLongitude() %>], 500, {
color: 'red',
fillColor: '#f03',
fillOpacity: 0.5
}).addTo(mymap)

</script>

</html>
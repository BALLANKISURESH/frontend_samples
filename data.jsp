
<%@page import="com.virtusa.data.AirpollutionArray"%>
<%@page import="com.virtusa.data.WeatherObject"%>
<%@page import="com.virtusa.data.WeatherArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head> 
	<title>Weatherdata</title>
	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script src='https://kit.fontawesome.com/a076d05399.js'></script>
  <link rel="shortcut icon" type="image/x-icon" href="docs/images/favicon.ico" />
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin=""/>
  <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js" integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew==" crossorigin=""></script>
	
</head>
<header>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<form action="welcome.jsp">
			<button class="btn btn-success" type="submit">main</button>
		</form>
	  <form class="form-inline" action="WeatherServices" method="post" style="margin: auto;">
	    <input class="form-control mr-sm-2" type="search" name="city" placeholder="Search Other Location">
	    <button class="btn btn-success" type="submit">Request Data</button>
	  </form>
	   <form action="logout">
			<button class="btn btn-success" type="submit">logout</button>
		</form>
	</nav>
</header>
<body style="background-image: linear-gradient(#db8fff,#bae6db,#05b5b5,#afa8e0,#213c6e);">
	<% response.setHeader("Cache-Control", "no-cashe,no-store,must-revalidate");
	if(session.getAttribute("username")==null)response.sendRedirect("index.jsp"); %>
	
	<div class="jumbotron text-center" style="background-image: linear-gradient(#db8fff,#bae6db,#05b5b5,#afa8e0,#213c6e);">
		<div style="font-family: Brush Script Std;font-size: medium;font-weight: bold;">	
		
		<div style="font-size: 60px;font-family: cursive;" >Forecasting</div>
		
		<div><% out.print(WeatherObject.getDate()); %></div>
		
		<div><h2><% out.print(WeatherObject.getLocationcity());%>,<% out.print(WeatherObject.getLocationcountry()); %></h2></div>
		
		<div  class="container">
			<div class="row">
				<div class="col-sm-6">
					<div style="font-family:blackadder;"><h1>Weather Details</h1></div>
					<div style="font-size: 50px;">
						<img alt="weatherIcon" src="<%= WeatherArray.getIcon() %>" >
						<% out.print(WeatherObject.getTemp());%> &#8451
					</div>
					<div style="font-weight: bold;font-family: small-caps">
						Pressure: <% out.print(WeatherObject.getPressure());%> &#x33A9<br>
						WindSpeed: <% out.print(WeatherObject.getWindSpeed()); %> <i class='fas fa-wind'></i><br>
						Humidity: <% out.print(WeatherObject.getHumidity());%> % <br>
						Min/Max:   <% out.print(WeatherObject.getMin_temp());%> &#8451/
						<% out.print(WeatherObject.getMax_temp());%> &#8451<br>		
						Weather Description:
						<% WeatherArray.setWeatherArray();
						out.print(WeatherArray.getDescription());		
						%>
						(<% out.print(WeatherArray.getMain()); %>)
						
					</div>
				</div>
				
					<div class="col-sm-6">
						<div style="font-family:blackadder;"><h1>Air Pollution Details</h1></div>
						<div style="font-size: 50px"><%=AirpollutionArray.getApicon() %> <% out.print(AirpollutionArray.getAirQualityIndex()); %> &#13197/&#13221</div>
						<div style="font-weight: bold;font-family: small-caps">Air QualityIndex<br>
							<br>CONC of  O3 : <% out.print(AirpollutionArray.getCon_Of_O3()); %> % <br>
							CONC of So2: <% out.print(AirpollutionArray.getCon_of_SO2()); %> % <br>
							CONC of No2: <% out.print(AirpollutionArray.getCon_of_NO2()); %> % <br>
							Air Pollution Description:<% out.print(AirpollutionArray.getAirDiscription()); %>
						</div>
					</div>
				</div>
			</div>
			<div class="jumbotron text-center" style="background-color: transparent;">
				<div class="container">
					<div class="row" > 
						<div class="col-sm-12">
							<div  id="mapid" style=" height:500px;border-radius: 25px;margin: auto;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
		
	var mymap = L.map('mapid').setView([<%=WeatherObject.getLat() %>,<%=WeatherObject.getLng()  %>], 11);
	L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
		maxZoom: 18,
		attribution: '',
		id: 'mapbox/streets-v11',
		tileSize: 512,
		zoomOffset: -1
	}).addTo(mymap);
	L.marker([<%=WeatherObject.getLat() %>,<%=WeatherObject.getLng() %>]).addTo(mymap)
	.openPopup();
	L.circle([<%=WeatherObject.getLat() %>,<%=WeatherObject.getLng()  %>], 500, {
	color: 'red',
	fillColor: '#f03',
	fillOpacity: 0.5
	}).addTo(mymap)


</script>
</body>
<footer style="background-color: gray;" ></footer>
</html>
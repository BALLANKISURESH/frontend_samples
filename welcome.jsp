<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>MAIN</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	  <script >
	  $(document).ready(function(){
	     if(<%=request.getAttribute("check") %>) alert("please enter valid data");
	  
		});
	  </script>
</head>
<body class="jumbotron text-center" style="background-image: url(bg2.jpg); background-repeat: no-repeat;background-size: cover; " >
	<% response.setHeader("Cache-Control", "no-cashe,no-store,must-revalidate");
	if(session.getAttribute("username")==null)response.sendRedirect("index.jsp"); %>
	<div class="jumbotron text-center" style="background-color: transparent;">	
		<div class="row">
			<div class="col-sm-6" >
				<div class="jumbotron text-center"style="background-color: transparent ;box-shadow: 0 0 19px #333;">
					<h2  style="font-family: cursive;">Weather Forecast</h2>
					<h6>Present Weather Forecast </h6>
					 <form action="WeatherServices" method="post">
					 	<input class="form-control"type="search" placeholder="Location" name="city"style="width: 230px;margin: auto;"><br>
			 			<button type="submit" type="button" class="btn btn-secondary">Request Weather Data</button><br><br><br><br><br><br>
					 </form>  
			 	</div>
			</div>
			<div class="col-sm-6" >
				<div class="jumbotron text-center"style="background-color: transparent ;box-shadow: 0 0 19px #333;">
				<h2  style="font-family: cursive;">Historical Weather Forecast </h2>
				<h6>Please Enter Data Range Between 100 Days</h6>
					 <form action="perioddata" method="post" >
						<input class="form-control"type="text" placeholder="Location" name="cityname"style="width: 230px;margin:auto;"><br>
						<input class="form-control"type="date" placeholder=" YYYY-MM-DD StartDate"name="date1" min="2016-01-01" style="width: 230px;margin:auto;"><br>
				 		<input class="form-control"type="date" placeholder="YYYY-MM-DD EndDate"name="date2"min="2016-01-01"style="width: 230px;margin: auto;"><br>
						<button type="submit" type="button" class="btn btn-secondary">Request Weather Data</button>
					 </form> 
			 	</div>
			</div>
	 		
		</div>
		<div class="row">
			
	 	</div>
	</div>
	<form action="logout" style=" margin: auto;">
		<button class="btn btn-success" type="submit">logout</button>
	</form>

</body>
	
</html>
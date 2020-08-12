<html>
<head>
		<meta name="viewport" content="width=device-width,initial scale=1"/>
	<link rel="stylesheet" href="http://w3schools.com/lib/w3.css"/>
	<title>login</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="fontawesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="index.css">
</head>
<script >
  $(document).ready(function(){
     if(<%=request.getAttribute("check") %>) alert("please enter valid Credentials");
  
});
  </script>
<body>
	<div class="container">
		<div class="header">
			<h1>Login</h1>
			<p style="color:navy; ">Enter your Username and Password</p>
		</div>
		<div class="main">
			<form action="log" method="post">
				<span>
					<i class="fa fa-user"></i>
					<input type="text" placeholder="Username" name="uname">
				</span><br>
				<span>
					<i class="fa fa-lock"></i>
					<input type="password" placeholder="Password" id="myinput" name="upass">
					<span class="eye" onclick="myFunction()">
					<i id="hide1" class="fa fa-eye"></i>
					<i id="hide2" class="fa fa-eye-slash"></i>
				</span>
				</span>

				</span><br>
				<button  type="submit">Login</button>
				<div class="rig">
				<p>New Here?   <a href="signup.jsp"style="color: white;">Create an Account</a></p>
				</div>
			</form>
		</div>
	</div>
	<script>
		function myFunction(){
			var x=document.getElementById("myinput");
			var y=document.getElementById("hide1");
			var z=document.getElementById("hide2");

			 if(x.type =='password'){
			 	x.type="text";
			 	y.style.display="block";
			 	z.style.display="none";
			 }
           else{
             	x.type="password";
			 	y.style.display="none";
			 	z.style.display="block";

           }
		}
	</script>
</body>
</html>

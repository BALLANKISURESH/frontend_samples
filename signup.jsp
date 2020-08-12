<html>
<head>
		<meta name="viewport" content="width=device-width,initial scale=1"/>
	<link rel="stylesheet" href="http://w3schools.com/lib/w3.css"/>
	<title>login</title>
	<link rel="stylesheet" type="text/css" href="fontawesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="index.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
 
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>SignUp</h1>
			<p style="color:navy;">Enter your Username and Password</p>
		</div>
		<div class="main">
			<form action="Verifypwd" method="post">
				<span>
					<i class="fa fa-user"></i>
					<input type="text" placeholder="Username" name="uname">
				</span><br>
				<span>
					<i class="fa fa-lock"></i>
					<input type="password" placeholder="Password" id="myinput1" name="upass1">
					<span class="eye" onclick="myFunction1()">
					<i id="hide1" class="fa fa-eye"></i>
					<i id="hide2" class="fa fa-eye-slash"></i>
				</span><br>
				<span>
					<i class="fa fa-lock"></i>
					<input type="password" placeholder="Confirm password" id="myinput2" name="upass2">
					<span class="eye" onclick="myFunction2()">
					<i id="hide3" class="fa fa-eye"></i>
					<i id="hide4" class="fa fa-eye-slash"></i>
				</span>
				</span>

				</span><br>
				<button  type="submit">Sign up</button>
				
			</form>
		</div>
	</div>
	<script>
		function myFunction1(){
			var x=document.getElementById("myinput1");
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
		function myFunction2(){
			var x=document.getElementById("myinput2");
			var y=document.getElementById("hide3");
			var z=document.getElementById("hide4");

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

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register Kfc</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
		background: linear-gradient(to bottom right, #BDB76B, white);
}
.container{
	margin-top:170px;
}
label {
        display: inline-block;
        width: 155px;
        text-align: right;
        margin-left:-60px;
      }
      h2{
	margin-right:-90px; ;
	margin-top:65px;
}
button{
	margin-right:-80px; 
}
.bold{
	margin-right:-80px;
}
.exception{
	color:red;
	backround-color:white;
	font-size:15px;
	float:center;
	margin-right:-60px;
}
</style>
</head>
<body>
	<center>
		<form action="s1" method="post">
			<div class="container">
			<h2><i>Register KFC</i></h2> <br>
				<label > <b> User Name : </b> </label><input type="text" name="name"
					pattern="[A-Za-z]{3,}" title="Enter Name max three characters"><br>
				<br> <label><b>mobile number :</b> </label> <input type="text"
					name="mobileNumber" pattern="[6-9][0-9]{9}"
					title="Enter your 10- digit mobile number"><br> <br>
				<label><b>E Mail : </b></label> <input type="email" name="mailId"
					pattern="[a-z0-9]+[@][a-z]+[.][a-z]{2,3}"
					title="Enter your mailId In correctly example:kfc@gmail.com"><br>
				<br>

				<button type="submit"  class="btn btn-primary" value="SignUp">SignUp</button><br> <b class="bold"> (or)</b>
				


			</div>
		</form>
		<a href="login.jsp"><button type="submit" class="btn btn-success" value="SignUp">Login</button></a>
		<%
   if(session.getAttribute("UsedNumber") != null){%>
   
	  <b> <h1 class="exception"><i>Mobile Number is already registered</i></h1></b><%} %>
	   
   <%session.removeAttribute("UsedNumber"); 
   %>
   <%
   if(session.getAttribute("UsedMailId") != null){
	%>
   
	  <b> <h1 class="exception"><i>Mail Id is already registered</i></h1></b><%} %>
	   
   <%session.removeAttribute("UsedNumber"); 
   %>
	</center>
</body>
</html>


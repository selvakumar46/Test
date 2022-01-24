<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Admin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style >
	body {
	background:linear-gradient(to right,brown,white);
}

.container {
	margin-top: 100px;
}
h2{
	margin-right: -100px;
}
.center{
	margin-right:-120px;
}
label {
        display: inline-block;
        width: 165px;
        text-align: right;
        margin-left:-40px; ;
      }
</style>
</head>
<body>
	<center>
		<form action="newAdmin">
			<div class="container">
				<h2>New Admin</h2> <br>
				<label for="adminName" id="adminName"><b>Admin Name</b></label>
				<input type="text" name="adminName" required autofocus> <br> <br>
				<label for="adminMailId" id="adminMailId"><b>Admin MailId</b></label>
				<input type="text" name="adminMailId" pattern="[a-z0-9]+[@][a-z]+[.][a-z]{2,3}"
					title="Enter your mailId In correctly example:kfc@gmail.com" required> <br> <br>
				<label for="adminNumber" id="adminNumber"><b>Mobile Number</b></label>
				<input type="number" name="adminNumber" pattern="[6-9][0-9]{9}"
					title="Enter your 10- digit mobile number" min="0" required> <br> <br>
					<center class="center">
					<button type="submit" class="btn btn-success btn-sm">Submit</button>
					<button type="reset" class="btn btn-danger btn-sm">Reset</button>
					</center> 	
			</div>
		</form><br>
		<a href="AdminPage.jsp"><center class="center"><button type="submit" class="btn btn-outline-dark btn-sm">Home</button></center></a>
	</center>
</body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome KFC</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="assets/css/indexNav.css">
	<link rel="stylesheet" href="assets/css/background.css">
<body>
	<c:set value="${currentUser}" var="user"/>
	<!--logoImage -->
	<img src="image/KFC Logo2.png "alt="KFC_Logo" width="150px" width="150px" height="100px">
	<!-- navbar-->
	<div class="moveTop">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid justify-content-between">
				<!-- Left elements -->
				<a class="nav-link d-sm-flex align-items-lg-center"> <img
					src="https://mdbcdn.b-cdn.net/img/new/avatars/1.webp"
					class="rounded-circle" height="25" width="#" alt="image for b/w" /> <strong
					class="d-none d-sm-block ms-7"><c:out
							value="${user.userName}" /> </strong>
				</a>
				<div class="d-flex">
					<a class="" href="showProducts">
						<button type="submit" class="btn btn-light  button">Menu</button>
					</a> <a href="login.jsp"><button
							type="submit" class="btn btn-light button">My Orders</button></a>

					<!-- Search form -->
					<form action="searchProduct" class="input-group w-auto">
						<input autocomplete="off" type="search" name="search" id="search"
							class="form-control " placeholder="search by meal" />
						<button type="submit" class="btn btn-dark btn-sm">search</button>
					</form>
				</div>
				<!-- Left elements -->

				<!-- Center elements -->
				<a href="login.jsp"><button type="submit"
						class="btn btn-light button">My Cart</button></a>

				<!-- Center elements -->

				<!-- Right elements -->
				<a href="login.jsp"><button type="submit"
						class="btn btn-light button">Login/SignUp</button></a>
				<!-- Right elements -->
			</div>
		</nav>
	</div>
	<!-- Navbar -->
	<center>
		<div class="slide">
			<img src="image/Bucket.png" width="800px" height="300px"
				alt="Kfc Food Special">
			<h4>
				<center>Hi <c:out value="${user.userName}"></c:out></center>
			</h4>
			<h3>
				<strong>Welcome to KFC</strong>
			</h3>
		</div>
	</center>
	<div>
		<div></div>
		<h3>
			<strong>Categories:</strong>
		</h3>
	</div>
	<div>
		<form action="BucketMeals" method="post">
			<div>
				<strong>Bucket meals:</strong>
				<button type="submit" class="btn btn-success btn-sm">Submit</button>
			</div>
		</form>
		<br>
		<form action="TrendingMeal" method="post">
			<div>
				<strong>Trending meals:</strong>
				<button type="submit" class="btn btn-success btn-sm">Submit</button>
			</div>
		</form>
	</div>
	<br>
	<br>
	<div></div>
	<div class="downnav">
		<a href="">Get helpS</a> <a href="">About Us</a> <a href="">Contact
			Us</a>
	</div>

</body>
</html>

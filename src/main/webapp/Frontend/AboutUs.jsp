<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all_js_css.jsp"%>
<title>Books Lover Retreat:Online BookStore |Buy Books Online</title>
<style>
span {
	display: inline-block;
	text-decoration: none;
	color: inherit;
}

.section-head {
	margin-bottom: 60px;
}

.section-head h4 {
	position: relative;
	padding: 0;
	color: #ff4081;
	line-height: 1;
	letter-spacing: 0.3px;
	font-size: 34px;
	font-weight: 700;
	text-align: center;
	text-transform: none;
	margin-bottom: 30px;
}

.section-head h4::before {
	content: '';
	width: 60px;
	height: 3px;
	background: #ff4081;
	position: absolute;
	bottom: -10px;
	left: 0;
	right: 0;
	margin: 0 auto;
}

.section-head h4 span {
	font-weight: 700;
	padding-bottom: 5px;
	color: #2f2f2f;
}

.section-head p {
	color: #818181;
	font-size: 16px;
	line-height: 28px;
	text-align: center;
}

.item {
	background: #fff;
	text-align: center;
	padding: 30px 25px;
	box-shadow: 0 0 25px rgba(0, 0, 0, 0.07);
	border-radius: 20px;
	margin-bottom: 30px;
	border: 5px solid rgba(0, 0, 0, 0.07);
	-webkit-transition: all 0.5s ease 0s;
	transition: all 0.5s ease 0s;
}

.item:hover {
	background: #ff4081;
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.2);
	-webkit-transition: all 0.5s ease 0s;
	transition: all 0.5s ease 0s;
}

.item:hover .item, .item:hover span.icon {
	background: #fff;
	border-radius: 10px;
	-webkit-transition: all 0.5s ease 0s;
	transition: all 0.5s ease 0s;
}

.item:hover h6, .item:hover p {
	color: #fff;
	-webkit-transition: all 0.5s ease 0s;
	transition: all 0.5s ease 0s;
}

.item .icon {
	font-size: 40px;
	margin-bottom: 25px;
	color: #f91942;
	width: 90px;
	height: 90px;
	line-height: 96px;
	border-radius: 50px;
}

.item .feature_box_col_one {
	background: rgba(247, 198, 5, 0.2);
	color: #f91942;
}

.item .feature_box_col_two {
	background: rgba(255, 77, 28, 0.15);
	color: #f91942;
}

.item .feature_box_col_three {
	background: rgba(0, 147, 38, 0.15);
	color: #f91942;
}

.item .feature_box_col_four {
	background: rgba(0, 108, 255, 0.15);
	color: #f91942;
}

.item .feature_box_col_five {
	background: rgba(146, 39, 255, 0.15);
	color: #f91942;
}

.item .feature_box_col_six {
	background: rgba(23, 39, 246, 0.15);
	color: #f91942;
}

.item p {
	font-size: 15px;
	line-height: 26px;
}

.item h6 {
	margin-bottom: 20px;
	color: #2f2f2f;
}
</style>
</head>

<body class="bgcolor">
	<!-- Header -->
	<%@ include file="header.jsp"%>
	<br>
	<%@ include file="Navbar2nd.jsp"%>
	<br>

	<!-- Code from code 4 education -->
	<div class="container">
		<div class="pt-5 pb-5">
			<div class="container bg-light pt-3">
				<div class="row">
					<div class="section-head col-sm-12">
						<h4>
							<span>Why Choose</span> Us?
						</h4>
						<p class="fs-4">
							<b>Books Lover Retreat</b> is India's Largest and Cheapest Online
							Bookstore offering 40+ Million selections.
						</p>
						<p class="fst-italic fs-5">"I declare after all there is no
							enjoyment like reading!"</p>
						<p>
							<small class="color">-Jane Austen, Pride and Prejudice.</small>
						</p>
					</div>
					<div class="col-lg-4 col-sm-6">
						<div class="item">
							<span class="icon feature_box_col_one"> <i
								class="fa fa-globe color"></i></span>
							<h6>We sell in vast collection of books proposed by
								different institutes as syllabus across the country.</h6>
						</div>
					</div>
					<div class="col-lg-4 col-sm-6">
						<div class="item">
							<span class="icon feature_box_col_two"> <i
								class="fa-solid fa-book color"></i></span>
							<h6>Huge collection of books in diverse category</h6>
						</div>
					</div>
					<div class="col-lg-4 col-sm-6">
						<div class="item">
							<span class="icon feature_box_col_three"><i
								class="fa fa-hourglass-half color"></i></span>
							<h6>quick and user-friendly payment options</h6>
						</div>
					</div>
					<div class="col-lg-4 col-sm-6">
						<div class="item">
							<span class="icon feature_box_col_four"><i
								class="fa-brands fa-searchengin"></i></span>
							<h6>User-friendly search engine</h6>
						</div>
					</div>
					<div class="col-lg-4 col-sm-6">
						<div class="item">
							<span class="icon feature_box_col_five"> <i
								class="fa-solid fa-truck color"></i></span>
							<h6>Quicker delivery systems</h6>
						</div>
					</div>
					<div class="col-lg-4 col-sm-6">
						<div class="item">
							<span class="icon feature_box_col_six"><i
								class="fa-solid fa-tag color"></i></span>
							<h6>Exciting offers and pleasant discounts on our books.</h6>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<br>
	<br>

	<!-- Footer -->
	<%@ include file="footer.jsp"%>
	<script type="text/javascript" src="js/MdbJsFiles/mdb.min.js"></script>
</body>
</html>
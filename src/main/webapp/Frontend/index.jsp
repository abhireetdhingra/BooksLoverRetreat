<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all_js_css.jsp"%>
<title>Books Lover Retreat:Online BookStore |Buy Books Online</title>

<style>
.MultiCarousel {
	float: left;
	overflow: hidden;
	padding: 15px;
	width: 100%;
	position: relative;
}

.MultiCarousel .MultiCarousel-inner {
	transition: 1s ease all;
	float: left;
}

.MultiCarousel .MultiCarousel-inner .item {
	float: left;
}

.MultiCarousel .MultiCarousel-inner .item>div {
	text-align: center;
	padding: 10px;
	margin: 10px;
	background: #f1f1f1;
	color: #666;
}

.MultiCarousel .leftLst, .MultiCarousel .rightLst {
	position: absolute;
	border-radius: 50%;
	top: calc(50% - 20px);
}

.MultiCarousel .leftLst {
	left: 0;
}

.MultiCarousel .rightLst {
	right: 0;
}

.MultiCarousel .leftLst.over, .MultiCarousel .rightLst.over {
	pointer-events: none;
	background: #ccc;
}


</style>
<%-- <%@ include file="MultiItemCarouselHeadTag.jsp" %> --%>
</head>
<body class="bgcolor">
	<!-- Header -->
	<%@ include file="header.jsp"%>
	<br>
	<%@ include file="Navbar2nd.jsp"%>
	<br>


	<!-- Carousel at top -->
	<!-- Carousel wrapper -->
	<div id="carouselAtTop" class="carousel slide carousel-fade mb-3"
		data-mdb-ride="carousel">
		<!-- Indicators -->
		<div class="carousel-indicators">
			<button type="button" data-mdb-target="#carouselAtTop"
				data-mdb-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-mdb-target="#carouselAtTop"
				data-mdb-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-mdb-target="#carouselAtTop"
				data-mdb-slide-to="2" aria-label="Slide 3"></button>
			<button type="button" data-mdb-target="#carouselAtTop"
				data-mdb-slide-to="3" aria-label="Slide 4"></button>
			<button type="button" data-mdb-target="#carouselAtTop"
				data-mdb-slide-to="4" aria-label="Slide 5"></button>
		</div>

		<!-- Inner -->
		<div class="carousel-inner">
			<!-- Single item -->
			<div class="carousel-item active" data-mdb-interval="2000">
				<img src="images/71_inr.jpg" class="d-block w-100" alt="Book1" />

			</div>

			<!-- Single item -->
			<div class="carousel-item" data-mdb-interval="3000">
				<img src="images/72_inr.jpg" class="d-block w-100" alt="Second Book" />

			</div>

			<!-- Single item -->
			<div class="carousel-item" data-mdb-interval="3000">
				<img src="images/73_inr.jpg" class="d-block w-100" alt="Third Book" />

			</div>

			<div class="carousel-item" data-mdb-interval="3000">
				<img src="images/76_inr.jpg" class="d-block w-100" alt="4th Book" />

			</div>

			<div class="carousel-item" data-mdb-interval="3000">
				<img src="images/77_inr.jpg" class="d-block w-100" alt="5th book" />

			</div>
		</div>
		<!-- Inner -->

		<!-- Controls -->
		<button class="carousel-control-prev" type="button"
			data-mdb-target="#carouselAtTop" data-mdb-slide="prev">
			<span aria-hidden="true"><i
				class="fas fa-caret-left fa-3x color"></i></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-mdb-target="#carouselAtTop" data-mdb-slide="next">
			<span aria-hidden="true"><i
				class="fas fa-caret-right fa-3x color"></i></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<!-- Carousel wrapper -->

	<!-- Carousel ends -->


	<!-- Multi items carousel for categories -->
	<div class="container bg-light mt-4" id="featuredAuthors">
		<div class="row">
			<div class="MultiCarousel" data-items="1,3,5,6" data-slide="1"
				id="MultiCarousel" data-interval="1000">
				<div class="MultiCarousel-inner">

					<div class="item">
						<div class="pad15">
							<i class="fa-solid fa-book-open fa-4x color"></i>
							<p class="lead">New Arrivals</p>
						</div>
					</div>
					<div class="item">
						<div class="pad15">
							<i class="fa-solid fa-trophy fa-4x color"></i>
							<p class="lead">Award Winners</p>
						</div>
					</div>
					<div class="item">
						<div class="pad15">
							<i class="fa-solid fa-ribbon fa-4x color"></i>
							<p class="lead">Best Sellers</p>
						</div>
					</div>
					<div class="item">
						<div class="pad15">
							<i class="fa-solid fa-box-open fa-4x color"></i>
							<p class="lead">Box Sets</p>
						</div>
					</div>
					<div class="item">
						<div class="pad15">
							<i class="far fa-bookmark fa-4x color"></i>
							<p class="lead">Fiction</p>
						</div>
					</div>
					<div class="item">
						<div class="pad15">
							<i class="fa-solid fa-ribbon fa-4x color"></i>
							<p class="lead">Best Sellers</p>
						</div>
					</div>
					<div class="item">
						<div class="pad15">
							<i class="fa-solid fa-trophy fa-4x color"></i>
							<p class="lead">Award Winners</p>
						</div>
					</div>
					<div class="item">
						<div class="pad15">
							<i class="fa-solid fa-book-open fa-4x color"></i>
							<p class="lead">New Arrivals</p>
						</div>
					</div>
					<div class="item">
						<div class="pad15">
							<i class="far fa-bookmark fa-4x color"></i>
							<p class="lead">Fiction</p>
						</div>
					</div>
					<div class="item">
						<div class="pad15">
							<i class="fa-solid fa-box-open fa-4x color"></i>
							<p class="lead">Box Sets</p>
						</div>
					</div>
				</div>
				<button class="btn btn-primary leftLst"><</button>
				<button class="btn btn-primary rightLst">></button>
			</div>
		</div>
	</div>
	<!-- ********************************************** -->


	<div class="container" id="NewArrivalBooks">
		<div align=center>
			<h3>New Arrivals</h3>
		</div>

		<div class="row row-cols-1 row-cols-sm-1 row-cols-md-5  g-4">
			<c:forEach items="${listNewBooks}" var="book">
				<%@ include file="book_group.jsp"%>
			</c:forEach>
		</div>
		<hr>
		<!-- 2nd carousel for pictures and discounts -->
		<!-- Carousel wrapper -->
		<div id="carouselBasicExample" class="carousel slide carousel-fade"
			data-mdb-ride="carousel">
			<!-- Indicators -->
			<div class="carousel-indicators">
				<button type="button" data-mdb-target="#carouselBasicExample"
					data-mdb-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-mdb-target="#carouselBasicExample"
					data-mdb-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-mdb-target="#carouselBasicExample"
					data-mdb-slide-to="2" aria-label="Slide 3"></button>
			</div>

			<!-- Inner -->
			<div class="carousel-inner">
				<!-- Single item -->
				<div class="carousel-item active" data-mdb-interval="2000">
					<img src="images/DiscountBooks1.jpg" class="d-block w-100"
						alt="Sunset Over the City" style="height: 531px;" />
					<h4 class="bg-light text-center fst-italic">New Offers only
						for you</h4>
				</div>

				<!-- Single item -->
				<div class="carousel-item" data-mdb-interval="2000">
					<img src="images/DiscountBooks2.jpg" class="d-block w-100"
						alt="Canyon at Nigh" style="height: 531px;" />
					<h4 class="bg-light text-center fst-italic">Discount Offers
						you can't miss</h4>

				</div>

				<!-- Single item -->
				<div class="carousel-item" data-mdb-interval="2000">
					<img src="images/8_bigdiscount.jpg" class="d-block w-100"
						alt="Cliff Above a Stormy Sea" style="height: 531px;" />
					<h4 class="bg-light text-center fst-italic">Big Discounts on
						selected Products</h4>

				</div>
			</div>
			<!-- Inner -->

			<!-- Controls -->
			<button class="carousel-control-prev" type="button"
				data-mdb-target="#carouselAtTop" data-mdb-slide="prev">
				<span aria-hidden="true"><i
					class="fas fa-caret-left fa-3x color"></i></span> <span
					class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-mdb-target="#carouselAtTop" data-mdb-slide="next">
				<span aria-hidden="true"><i
					class="fas fa-caret-right fa-3x color"></i></span> <span
					class="visually-hidden">Next</span>
			</button>
		</div>
		<!-- Carousel wrapper -->
		<!-- 2nd carousel ends here -->

		<!-- Best Selling Books Code -->
		<div align=center id="BestSellerBooks">
			<h3>Best Sellers</h3>
		</div>

		<div class="row row-cols-1 row-cols-sm-3 row-cols-md-5  g-4">
			<c:forEach items="${listBestSellingBooks}" var="book">
				<%@ include file="book_group.jsp"%>
			</c:forEach>

		</div>
		<hr>
		<!-- Most Favoured Books Code -->
		<div align=center id="MostFavouriteBooks">
			<h3>Most Favoured</h3>
		</div>
		<div class="row row-cols-1 row-cols-sm-3 row-cols-md-5  g-4">

			<c:forEach items="${listMostFavouredBooks}" var="book">
				<%@ include file="book_group.jsp"%>
			</c:forEach>

		</div>
		<hr>
		<!-- Our Best Fiction Books -->
		<div class="bg-light px-3 py-3" id="FictionBooks">
			<div class="row">
				<h2 class="display-5 fst-italic">Our Best Fiction Books</h2>
			</div>
			<div class="row">
				<div class="col">
					<img src="images/manga.jpg" class="d-block w-100"
						alt="Best Fiction Books 1" />
				</div>
				<div class="col">
					<img src="images/tarot.jpg" class="d-block w-100"
						alt="Best Fiction Books 2" />
				</div>
			</div>
		</div>

		<hr>
		<!-- Box sets Books -->
		<div align=center id="BoxSetBooks">
			<h3>Our Box Sets Collection</h3>
		</div>
		<div class="row row-cols-1 row-cols-sm-3 row-cols-md-5  g-4">
			<c:forEach items="${BoxSetsBooks}" var="book">
				<%@ include file="book_group.jsp"%>
			</c:forEach>
		</div>
		<hr>
		<div class="bg-light px-3 py-3">
			<div class="row">
				<img src="images/examcentral.png" class="d-block w-100"
					alt="Best Fiction Books 1" />
			</div>
		</div>

		<!-- Multi items carousel -->
		<%-- <%@ include file="MultiitemCarousel.jsp" %> --%>
		<!-- Multi items carousel ends -->
		<div class="container bg-light mt-4" id="featuredAuthors">
			<div class="row ">
				<h1 align="center">Featured Authors</h1>
			</div>
			<div class="row">
				<div class="MultiCarousel" data-items="1,3,5,6" data-slide="1"
					id="MultiCarousel" data-interval="1000">
					<div class="MultiCarousel-inner">
						<div class="item">
							<div class="pad15">
								<img src="images/stephen-edwin-king.jpg"
									class="img-fluid rounded-circle" />
								<p class="lead">Stephen King</p>
							</div>

						</div>
						<div class="item">
							<div class="pad15">
								<img src="images/arundhatistory_647_100316054702.jpg"
									class="img-fluid rounded-circle"
									style="width: 185px; height: 150px;" />
								<p class="lead">Arundhati Roy</p>
							</div>
						</div>
						<div class="item">
							<div class="pad15">
								<img src="images/dr-shashi-tharoor-2.jpg"
									class="img-fluid rounded-circle" />
								<p class="lead">Shashi Tharoor</p>
							</div>
						</div>
						<div class="item">
							<div class="pad15">
								<img src="images/gayle-forman.jpg"
									class="img-fluid rounded-circle" />
								<p class="lead">Gayle Forman</p>
							</div>
						</div>
						<div class="item">
							<div class="pad15">
								<img src="images/John_green.jpg"
									class="img-fluid rounded-circle"
									style="width: 185px; height: 150px;" />
								<p class="lead">John Green</p>
							</div>
						</div>
						<div class="item">
							<div class="pad15">
								<img src="images/ma10_milestones_segal.jpg"
									class="img-fluid rounded-circle" />
								<p class="lead">Erich Segal</p>
							</div>
						</div>
						<div class="item">
							<div class="pad15">
								<img src="images/stephan-coonts.jpg"
									class="img-fluid rounded-circle"
									style="width: 185px; height: 150px;" />
								<p class="lead">Stephan Coonts</p>
							</div>
						</div>
						<div class="item">
							<div class="pad15">
								<img src="images/stephen-edwin-king.jpg"
									class="img-fluid rounded-circle" />
								<p class="lead">Stephen King</p>
							</div>
						</div>
						<div class="item">
							<div class="pad15">
								<img src="images/sylvia2.jpg" class="img-fluid rounded-circle" />
								<p class="lead">Sylvia Palth</p>
							</div>
						</div>
						<div class="item">
							<div class="pad15">
								<img src="images/william-wordsworth-8.jpg"
									class="img-fluid rounded-circle" />
								<p class="lead">William Worsworth</p>
							</div>
						</div>
						<div class="item">
							<div class="pad15">
								<img src="images/dillian.jpg" class="img-fluid rounded-circle" />
								<p class="lead">Gillian Flynn</p>
							</div>
						</div>
						<div class="item">
							<div class="pad15">
								<img src="images/James_Patterson.jpg"
									class="img-fluid rounded-circle"
									style="width: 185px; height: 150px;" />
								<p class="lead">James Patterson</p>
							</div>
						</div>
						<div class="item">
							<div class="pad15">
								<img src="images/200610-jk-rowling-al-1348.jpg"
									class="img-fluid rounded-circle"
									style="width: 185px; height: 150px;" />
								<p class="lead">J.K Rowling</p>
							</div>
						</div>
						<div class="item">
							<div class="pad15">
								<img src="images/Nicholas_sparks.jpg"
									class="img-fluid rounded-circle"
									style="width: 185px; height: 150px;" />
								<p class="lead">Nicholas Sparks</p>
							</div>
						</div>
						<div class="item">
							<div class="pad15">
								<img src="images/kiran_desai.jpg"
									class="img-fluid rounded-circle"
									style="width: 185px; height: 150px;" />
								<p class="lead">Kiran Desai</p>
							</div>
						</div>
					</div>
					<button class="btn btn-primary leftLst"><</button>
					<button class="btn btn-primary rightLst">></button>
				</div>
			</div>
		</div>

	</div>
	<br>
	<br>

	<!-- Footer -->
	<%@ include file="footer.jsp"%>

	<script>
		$(document)
				.ready(
						function() {
							$('#customerRegistrationForm').validate({
								rules : {
									email : {
										required : true
									},

									firstName : {
										required : true
									},
									password : {
										required : true
									},
									cnPassword : {
										required : true,
										equalTo : "#password"
									},
								/* phoneNum : {
									required : true
								},
								address : {
									required : true
								},
								country : {
									required : true
								},
								state : {
									required : true
								},
								city : {
									required : true
								},
								zipCode : {
									required : true
								} */
								},
								messages : {
									cnPassword : {
										equalTo : "Passwords must match"
									}
								}
							});

							$('#loginCustomerForm').validate({
								rules : {
									email : {
										required : true,
										email : true

									},
									password : {
										required : true
									}
								},
								messages : {
									email : {
										required : "Email is required",
										email : "Please enter a valid email"
									},

									password : {
										required : "Please enter your password"
									}
								}
							})

							/* Carusel jquery code */

							var itemsMainDiv = ('.MultiCarousel');
							var itemsDiv = ('.MultiCarousel-inner');
							var itemWidth = "";

							$('.leftLst, .rightLst').click(function() {
								var condition = $(this).hasClass("leftLst");
								if (condition)
									click(0, this);
								else
									click(1, this)
							});

							ResCarouselSize();

							$(window).resize(function() {
								ResCarouselSize();
							});

							//this function define the size of the items
							function ResCarouselSize() {
								var incno = 0;
								var dataItems = ("data-items");
								var itemClass = ('.item');
								var id = 0;
								var btnParentSb = '';
								var itemsSplit = '';
								var sampwidth = $(itemsMainDiv).width();
								var bodyWidth = $('body').width();
								$(itemsDiv)
										.each(
												function() {
													id = id + 1;
													var itemNumbers = $(this)
															.find(itemClass).length;
													btnParentSb = $(this)
															.parent().attr(
																	dataItems);
													itemsSplit = btnParentSb
															.split(',');
													$(this).parent().attr(
															"id",
															"MultiCarousel"
																	+ id);

													if (bodyWidth >= 1200) {
														incno = itemsSplit[3];
														itemWidth = sampwidth
																/ incno;
													} else if (bodyWidth >= 992) {
														incno = itemsSplit[2];
														itemWidth = sampwidth
																/ incno;
													} else if (bodyWidth >= 768) {
														incno = itemsSplit[1];
														itemWidth = sampwidth
																/ incno;
													} else {
														incno = itemsSplit[0];
														itemWidth = sampwidth
																/ incno;
													}
													$(this)
															.css(
																	{
																		'transform' : 'translateX(0px)',
																		'width' : itemWidth
																				* itemNumbers
																	});
													$(this)
															.find(itemClass)
															.each(
																	function() {
																		$(this)
																				.outerWidth(
																						itemWidth);
																	});

													$(".leftLst").addClass(
															"over");
													$(".rightLst").removeClass(
															"over");

												});
							}

							//this function used to move the items
							function ResCarousel(e, el, s) {
								var leftBtn = ('.leftLst');
								var rightBtn = ('.rightLst');
								var translateXval = '';
								var divStyle = $(el + ' ' + itemsDiv).css(
										'transform');
								var values = divStyle.match(/-?[\d\.]+/g);
								var xds = Math.abs(values[4]);
								if (e == 0) {
									translateXval = parseInt(xds)
											- parseInt(itemWidth * s);
									$(el + ' ' + rightBtn).removeClass("over");

									if (translateXval <= itemWidth / 2) {
										translateXval = 0;
										$(el + ' ' + leftBtn).addClass("over");
									}
								} else if (e == 1) {
									var itemsCondition = $(el).find(itemsDiv)
											.width()
											- $(el).width();
									translateXval = parseInt(xds)
											+ parseInt(itemWidth * s);
									$(el + ' ' + leftBtn).removeClass("over");

									if (translateXval >= itemsCondition
											- itemWidth / 2) {
										translateXval = itemsCondition;
										$(el + ' ' + rightBtn).addClass("over");
									}
								}
								$(el + ' ' + itemsDiv).css('transform',
										'translateX(' + -translateXval + 'px)');
							}

							//It is used to get some elements from btn
							function click(ell, ee) {
								var Parent = "#" + $(ee).parent().attr("id");
								var slide = $(Parent).attr("data-slide");
								ResCarousel(ell, Parent, slide);
							}

						})
	<%-- <%@ include file="MultiItemCarouselScriptTag.jsp" %> --%>
		
	</script>

	<!-- Testing purpose carousel  -->




	<script type="text/javascript" src="js/MdbJsFiles/mdb.min.js"></script>
	<script type="text/javascript" src="js/dist/jquery.validate.min.js"></script>
</body>
</html>
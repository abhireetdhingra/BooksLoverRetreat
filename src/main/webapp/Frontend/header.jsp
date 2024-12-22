<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<!-- Container wrapper -->
	<div class="container-fluid">
		<!-- Toggle button -->
		<button class="navbar-toggler" type="button"
			data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fas fa-bars"></i>
		</button>

		<a class="navbar-brand mt-2 mt-lg-0"
			href="${pageContext.request.contextPath}"> <img
			src="images/BookLogo.jpg" height="200" alt="MDB Logo" loading="lazy" />
		</a>


		<!-- Collapsible wrapper -->
		<div class="collapse justify-content-center navbar-collapse"
			id="navbarSupportedContent">
			<!-- Navbar brand -->

			<!-- Left links -->

			<!-- Left links -->
			<form class="d-flex input-group w-50" action="search" method="post">
				<div class="input-group">
					<input type="search" class="form-control rounded inputField "
						name="keyword" placeholder="Search By Title, Author or ISBN"
						aria-label="Search" aria-describedby="search-addon" />
					<button type="submit" class="btn ">
						<i class="fas fa-search color"></i>
					</button>
				</div>

			</form>

		</div>
		<!-- Collapsible wrapper -->

		<!-- Right elements -->
		<div class="d-flex align-items-center">

			<c:if test="${loggedCustomer!=null}">
				<a href="view_customer_profile" class="mx-2 px-2" id="blackCol"><b>Welcome
						${loggedCustomer.getCustomerFullName()}</b></a>
			</c:if>

			<c:set var="cart" value="${sessionScope['cart']}"></c:set>
			<!-- Cart -->
				<a class="text-reset me-3" href="view_cart"> <i
				class="fas fa-shopping-cart color"><span
					class="badge rounded-pill badge-notification bg-dark">${cart.getTotalQuantity()}</span></i>
				</a>
				
			<!-- Notifications -->
			<!-- Avatar -->
			<div class="dropdown">
				<a class="dropdown-toggle d-flex align-items-center hidden-arrow"
					href="#" id="navbarDropdownMenuAvatar" role="button"
					data-mdb-toggle="dropdown" aria-expanded="false"><i
					class="fa-solid fa-user color"></i> </a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdownMenuAvatar">

					<c:if test="${loggedCustomer==null}">
						<li><a class="dropdown-item" href="#" id="buttonInFrontEnd"
							data-mdb-toggle="modal" data-mdb-target="#logInCustomerModal">Log
								in</a></li>
						<li><a class="dropdown-item " href="#" id="signUpAnchor"
							data-mdb-toggle="modal" data-mdb-target="#registerCustomerModal"><b>New
									To Books Lover Retreat? Sign Up </b></a></li>
					</c:if>


					<li><a class="dropdown-item" href="Admin/"><b>Admin</b></a></li>
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item" href="view_customer_profile">My
							profile</a></li>
					<li><a class="dropdown-item" href="#">Settings</a></li>
					<li><a class="dropdown-item" href="view_orders"> My Orders</a></li>
					<li><a class="dropdown-item" href="#">My Wish List</a></li>
					<li><a class="dropdown-item" href="#">My Gift Certificate</a></li>
					<li><a class="dropdown-item" href="#">My Addresses</a></li>
					<li>
						
							<a class="dropdown-item list-group-item list-group-item-action" data-toggle="list"
								href="view_customer_profile#changePassword">Change
								Password</a>
						
					</li>

					<c:if test="${loggedCustomer!=null}">
						<li><a class="dropdown-item" href="logout">Logout</a></li>
					</c:if>

				</ul>
			</div>
		</div>
		<!-- Right elements -->
	</div>
	<!-- Container wrapper -->
</nav>
<!-- Navbar -->



<!-- Modal for signUp -->
<div class="modal" id="registerCustomerModal" data-mdb-backdrop="static"
	data-mdb-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header bgcolor">
				<h5 class="modal-title" id="staticBackdropLabel"
					style="color: whitesmoke;">Your Books are waiting for you....</h5>
				<button type="button" class="btn-close" data-mdb-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<!-- Form starts here -->
				<form class="mx-auto" id="customerRegistrationForm" method="post"
					action="register_customer">
					<div class="row">
						<div class="col">
							<div class="form-outline">
								<input type="email" id="email" class="form-control" name="email" />
								<label class="form-label" for="email">Email</label>
							</div>
						</div>
					</div>
					<hr />

					<div class="row">
						<div class="col">
							<div class="form-outline">
								<input type="text" id="firstName" class="form-control"
									name="firstName" /> <label class="form-label" for="firstName">First
									Name</label>
							</div>
						</div>
					</div>
					<hr />
					<div class="row">
						<div class="col">
							<div class="form-outline">
								<input type="text" id="lastName" class="form-control"
									name="lastName" /> <label class="form-label" for="lastName">Last
									Name</label>
							</div>
						</div>
					</div>
					<hr />
					<div class="row">
						<div class="col">
							<div class="form-outline">
								<input type="password" id="password" class="form-control"
									name="password" /> <label class="form-label" for="password">Password</label>
							</div>
						</div>
					</div>
					<hr />
					<div class="row">
						<div class="col">
							<div class="form-outline">
								<input type="password" id="cnPassword" class="form-control"
									name="cnPassword" value="${Customer.getPassword()}" /> <label
									class="form-label" for="cnPassword"> Confirm Password</label>
							</div>
						</div>
					</div>
					<hr />
					<!-- <div class="row">
						<div class="col">
							<div class="form-outline">
								<input type="number" id="phoneNum" class="form-control"
									name="phoneNum" /> <label class="form-label" for="phoneNum">Contact</label>
							</div>
						</div>
					</div>
					<hr />

					<div class="row">
						<div class="col">
							<div class="form-outline">
								<input type="text" id="address" class="form-control"
									name="address" /> <label class="form-label" for="address">Address</label>
							</div>
						</div>
					</div>
					<hr />

					<div class="row">
						<div class="col">
							<div class="form-outline">
								<input type="text" id="country" class="form-control"
									name="country" /> <label class="form-label" for="country">Country</label>
							</div>
						</div>
					</div>
					<hr />

					<div class="row">
						<div class="col">
							<div class="form-outline">
								<input type="text" id="state" class="form-control" name="state" />
								<label class="form-label" for="state">State</label>
							</div>
						</div>
					</div>
					<hr />

					<div class="row">
						<div class="col">
							<div class="form-outline">
								<input type="text" id="city" class="form-control" name="city" />
								<label class="form-label" for="city">City</label>
							</div>
						</div>
					</div>
					<hr />
					<div class="row">
						<div class="col">
							<div class="form-outline">
								<input type="number" id="zipCode" class="form-control"
									name="zipCode" /> <label class="form-label" for="zipCode">Zip
									Code</label>
							</div>
						</div>
					</div> -->
					<!-- <hr /> -->
					<div class="container" align=center>
						<button type="submit" class="btn btn-block" id="buttonInFrontEnd">Sign
							Up</button>

					</div>
				</form>
				<div class="modalFooter" align=center>
					<span class="color">Existing User? <a href="#"
						data-mdb-target="#logInCustomerModal" data-mdb-toggle="modal">Log
							In</a></span>
					<p class="mt-1">
						By continuing, I agree to the <b>Terms of Use</b> & <b>Privacy
							Policy</b>
					</p>
				</div>
			</div>

		</div>
	</div>
</div>

<!-- Modal for sign in -->
<div class="modal" id="logInCustomerModal" data-mdb-backdrop="static"
	data-mdb-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header bgcolor">
				<h5 class="modal-title" id="staticBackdropLabel"
					style="color: whitesmoke;">Log In to your bookstore account</h5>
				<button type="button" class="btn-close" data-mdb-dismiss="modal"
					aria-label="Close"></button>
			</div>

			<div class="modal-body">

				<!--Form starts here -->

				<form class="mx-auto" id="loginCustomerForm" action="login_customer"
					method="post">
					<!-- Email input -->
					<div class="form-outline mb-4">
						<input type="email" id="customerEmail" class="form-control"
							name="email" /> <label class="form-label" for="customerEmail">Email
							address</label>
					</div>

					<!-- Password input -->
					<div class="form-outline mb-4">
						<input type="password" id="customerPassword" class="form-control"
							name="password" /> <label class="form-label"
							for="customerPassword">Password</label>
					</div>

					<!-- 2 column grid layout for inline styling -->
					<div class="row mb-4">
						<div class="col d-flex justify-content-center">
							<!-- Checkbox -->
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="form2Example31" checked /> <label class="form-check-label"
									for="form2Example31"> Remember me </label>
							</div>
						</div>

						<div class="col">
							<!-- Simple link -->
							<b><a href="#!" class="color">Forgot password?</a></b>
						</div>
					</div>
					<div class="row mb-4">
						<div class="col d-flex justify-content-center">
							<span class="color"> New Customer? <b>Register</b> <a
								data-mdb-target="#registerCustomerModal" data-mdb-toggle="modal"
								href="#">here</a></span>
						</div>
					</div>

					<!-- Submit button -->
					<button type="submit" class="btn btn-block mb-4"
						id="buttonInFrontEnd">Sign in</button>

					<!-- Register buttons -->
					<div class="text-center">
						<p>or sign up with:</p>
						<a href="https://www.facebook.com/" type="button"
							class="btn btn-link btn-floating mx-1"> <i
							class="fab fa-facebook-f color"></i>
						</a> <a href="https://www.gmail.com/" type="button"
							class="btn btn-link btn-floating mx-1"> <i
							class="fab fa-google color"></i>
						</a> <a href="https://twitter.com/i/flow/login" type="button"
							class="btn btn-link btn-floating mx-1"> <i
							class="fab fa-twitter color"></i>
						</a> <a href="https://github.com/" type="button"
							class="btn btn-link btn-floating mx-1"> <i
							class="fab fa-github color"></i>
						</a>
					</div>

				</form>

				<!-- Form ends here -->
			</div>
		</div>
	</div>

</div>

<!-- Modal for  empty cart -->
<div class="modal" id="cartModal" data-mdb-backdrop="static"
	data-mdb-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header bgcolor">
				<h5 class="modal-title" id="staticBackdropLabel"
					style="color: whitesmoke;">Empty Cart</h5>
				<button type="button" class="btn-close" data-mdb-dismiss="modal"
					aria-label="Close"></button>
			</div>

			<div class="modal-body">
				<h1>You are in empty cart</h1>
				<!--Form starts here -->
				
				<!-- Form ends here -->
			</div>
		</div>
	</div>

</div>

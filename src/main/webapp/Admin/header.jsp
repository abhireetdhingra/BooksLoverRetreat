<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="../">The books lover retreat</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="${pageContext.request.contextPath}/Admin/">Admin Home</a></li>
				<li class="nav-item"><a class="nav-link" href="Users_list">Users</a></li>
				<li class="nav-item"><a class="nav-link" href="Categories_list">Categories</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="SubCategories_list">Sub Category</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="Books_list">Books</a></li>
				<li class="nav-item"><a class="nav-link" href="Customers_list">Customers</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="Reviews_list">Reviews</a></li>
				<li class="nav-item "><a class="nav-link " href="Orders_list">Orders</a>
				</li>
			</ul>
		</div>
		<!-- Right Elements -->
		<div class="d-flex align-items-center">
			<div class="navbar-nav " id="navbar-ul">
				<a class="nav-link disabled active" id="navbar-anchor"
					aria-current="page" href="#"> Welcome <c:out
						value="${sessionScope.useremail}" />
				</a> 
				<a class="nav-link active" id="navbar-anchor" aria-current="page"
					href="logout">Logout </a>

			</div>
		</div>


		<!--  <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form> -->

	</div>
</nav>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Second Navbar is for displaying category and stuff -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<!-- Container wrapper -->
	<div class="container-fluid">
		<!-- Collapsible wrapper -->
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<!-- Left links -->
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<!-- Books Category Dropdown -->
				<!-- Navbar dropdown -->

				<!-- Dropdown -->

				<!-- Dropdown -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button"
					data-mdb-toggle="dropdown" aria-expanded="false">Categories </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					
						<%-- <c:forEach var="category" items="${categoryList}">
						
							<li><a class="dropdown-item"
								href="view_category?catId=${category.getCategoryId()}">${category.getCategoryName()} </a>
								<ul class="dropdown-menu dropdown-submenu">
									<li><a class="dropdown-item" href="#">Submenu item 1</a></li>
									<li><a class="dropdown-item" href="#">Submenu item 2</a></li>
									<li><a class="dropdown-item" href="#">Submenu item 4</a></li>
									<li><a class="dropdown-item" href="#">Submenu item 5</a></li>
								</ul>
							</li>
							
						</c:forEach> --%>
						
						<!-- for each to display sub categories -->
						 <c:forEach var="subCategoryMap" items="${SubCategoriesMap}">
							<li>
								<a class="dropdown-item" href="view_category?catId=${subCategoryMap.key.getCategoryId()}">
									${subCategoryMap.key.getCategoryName()} &raquo;
								</a>
								<c:if test="${subCategoryMap.value!=null}">
									<ul class="dropdown-menu dropdown-submenu">
									<c:forEach var="subCategory" items="${subCategoryMap.value}">
										<li><a class="dropdown-item" href="#">${subCategory.getSubCategoryName()}</a></li>
									</c:forEach>
									</ul>
								</c:if>
							</li>
						</c:forEach> 
						
					</ul>
					</li> 

				 <%--  <li class="nav-item dropdown "><a
					class="nav-link dropdown-toggle blackCol" href="#"
					id="navbarDropdown" role="button" data-mdb-toggle="dropdown"
					aria-expanded="false"> Categories </a> <!-- Dropdown menu -->
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">

						<!-- Code here -->
						<c:forEach var="category" items="${categoryList}">
							<li><a class="dropdown-item"
								href="view_category?catId=${category.getCategoryId()}">${category.getCategoryName()}</a>
							</li>
						</c:forEach>
					</ul>
				</li>   --%>

				<li class="nav-item"><a class="nav-link" id="blackCol"
					href="#NewArrivalBooks">New Arrivals</a></li>
				<li class="nav-item"><a class="nav-link" id="blackCol"
					href="#BoxSetBooks">Box Sets</a></li>
				<li class="nav-item"><a class="nav-link" id="blackCol"
					href="#BestSellerBooks">Best Sellers</a></li>
				<li class="nav-item"><a class="nav-link " id="blackCol"
					href="#FictionBooks">Fiction Books</a></li>
				<li class="nav-item"><a class="nav-link " id="blackCol"
					href="#">Award Winners</a></li>
				<li class="nav-item"><a class="nav-link " id="blackCol"
					href="#featuredAuthors">Featured Authors</a></li>


			</ul>
			<!-- Left links -->
		</div>
		<!-- Collapsible wrapper -->
	</div>
	<!-- Container wrapper -->
</nav>
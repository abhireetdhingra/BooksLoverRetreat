<div class="col">
	<div class="card h-100">
		<img src="data:img/jpg;base64,${book.getBase64Image()}"
			class="card-img-top img-fluid mx-auto" alt="Skyscrapers"
			style="height: 224px; width: 222px" />
		<div class="card-body pb-0">
			<h5 class="card-title">
				<a href="view_book?bookId=${book.getBookId()}">${book.getBookTitle()}</a>
			</h5>
			<%@ include file="book_rating.jsp"%>
			<h6 style="font-size: x-small;" class="card-subtitle mb-2 text-muted">by
				${book.getBookAuthor()}</h6>

			<h5 class="color">$${book.getBookPrice()}</h5>

		</div>
		<div class="card-footer pt-0">
			<a class="btn btn-block" id="buttonInFrontEnd"
				href="add_to_cart?bookId=${book.getBookId()}"> Add to cart</a>
		</div>
	</div>
</div>

<%-- <div class="col">
	<div class="card ">
		<div class="bg-image hover-overlay ripple"
			data-mdb-ripple-color="light">
			<div class="ratio ratio-16x9">
				<img src="data:img/jpg;base64,${book.getBase64Image()}"
					class="card-img-top" alt="Book Image" />
			</div>
			<a href="view_book?bookId=${book.getBookId()}"><div class="mask"
					style="background-color: rgba(251, 251, 251, 0.15);"></div> </a>

		</div>
		<div class="card-body">
			<h5 class="card-title">
				<a href="view_book?bookId=${book.getBookId()}">${book.getBookTitle()}</a>
			</h5>

			<!-- Space for book rating stars -->
			<%@ include file="book_rating.jsp"%>


			<h6 style="font-size: x-small;" class="card-subtitle mb-2 text-muted">by
				${book.getBookAuthor()}</h6>
			<h5 class="color">$${book.getBookPrice()}</h5>
			
			<div class="card-footer">
				<a class="btn btn-block" id="buttonInFrontEnd"
					href="add_to_cart?bookId=${book.getBookId()}"> Add to cart</a>
			</div>

		</div>
	</div>
</div> --%>
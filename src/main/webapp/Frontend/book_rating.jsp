<div>
	<c:forTokens items="${book.getRatingStars()}" delims="," var="star">
		<c:if test="${star eq 'on' }">
			<i class="fas fa-star starColor"></i>
		</c:if>
		<c:if test="${star eq 'off' }">
			<i class="far fa-star"></i>
		</c:if>
		<c:if test="${star eq 'half' }">
			<i class="fas fa-star-half starColor"></i>
		</c:if>
	</c:forTokens>
</div>
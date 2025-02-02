<style>
carousel-showmanymoveone .carousel-control {
	width: 4%;
	background-image: none;
}

.carousel-showmanymoveone .carousel-control.left {
	margin-left: 0;
}

.carousel-showmanymoveone .carousel-control.right {
	margin-right: 0;
}

.carousel-showmanymoveone .cloneditem-1, .carousel-showmanymoveone .cloneditem-2,
	.carousel-showmanymoveone .cloneditem-3 {
	display: none;
}

.carousel .item .col-xs-12 {
	padding: 0;
}

/* Medium Devices, Desktops */
@media only screen and (max-width: 992px) {
	.carousel .item .col-xs-12:nth-last-child(-n+2) {
		display: none;
	}
}

@media all and (min-width: 768px) {
	.carousel-showmanymoveone .carousel-inner>.active.left,
		.carousel-showmanymoveone .carousel-inner>.prev {
		left: -50%;
	}
	.carousel-showmanymoveone .carousel-inner>.active.right,
		.carousel-showmanymoveone .carousel-inner>.next {
		left: 50%;
	}
	.carousel-showmanymoveone .carousel-inner>.left,
		.carousel-showmanymoveone .carousel-inner>.prev.right,
		.carousel-showmanymoveone .carousel-inner>.active {
		left: 0;
	}
	.carousel-showmanymoveone .carousel-inner .cloneditem-1 {
		display: block;
	}
}

@media all and (min-width: 768px) and (transform-3d) , all and
	(min-width: 768px) and (-webkit-transform-3d) {
	.carousel-showmanymoveone .carousel-inner>.item.active.right,
		.carousel-showmanymoveone .carousel-inner>.item.next {
		-webkit-transform: translate3d(50%, 0, 0);
		transform: translate3d(50%, 0, 0);
		left: 0;
	}
	.carousel-showmanymoveone .carousel-inner>.item.active.left,
		.carousel-showmanymoveone .carousel-inner>.item.prev {
		-webkit-transform: translate3d(-50%, 0, 0);
		transform: translate3d(-50%, 0, 0);
		left: 0;
	}
	.carousel-showmanymoveone .carousel-inner>.item.left,
		.carousel-showmanymoveone .carousel-inner>.item.prev.right,
		.carousel-showmanymoveone .carousel-inner>.item.active {
		-webkit-transform: translate3d(0, 0, 0);
		transform: translate3d(0, 0, 0);
		left: 0;
	}
}

@media all and (min-width: 992px) {
	.carousel-showmanymoveone .carousel-inner>.active.left,
		.carousel-showmanymoveone .carousel-inner>.prev {
		left: -16.6%;
	}
	.carousel-showmanymoveone .carousel-inner>.active.right,
		.carousel-showmanymoveone .carousel-inner>.next {
		left: 16.6%;
	}
	.carousel-showmanymoveone .carousel-inner>.left,
		.carousel-showmanymoveone .carousel-inner>.prev.right,
		.carousel-showmanymoveone .carousel-inner>.active {
		left: 0;
	}
	.carousel-showmanymoveone .carousel-inner .cloneditem-2,
		.carousel-showmanymoveone .carousel-inner .cloneditem-3 {
		display: block;
	}
}

@media all and (min-width: 992px) and (transform-3d) , all and
	(min-width: 992px) and (-webkit-transform-3d) {
	.carousel-showmanymoveone .carousel-inner>.item.active.right,
		.carousel-showmanymoveone .carousel-inner>.item.next {
		-webkit-transform: translate3d(16.6%, 0, 0);
		transform: translate3d(16.6%, 0, 0);
		left: 0;
	}
	.carousel-showmanymoveone .carousel-inner>.item.active.left,
		.carousel-showmanymoveone .carousel-inner>.item.prev {
		-webkit-transform: translate3d(-16.6%, 0, 0);
		transform: translate3d(-16.6%, 0, 0);
		left: 0;
	}
	.carousel-showmanymoveone .carousel-inner>.item.left,
		.carousel-showmanymoveone .carousel-inner>.item.prev.right,
		.carousel-showmanymoveone .carousel-inner>.item.active {
		-webkit-transform: translate3d(0, 0, 0);
		transform: translate3d(0, 0, 0);
		left: 0;
	}
}
</style>
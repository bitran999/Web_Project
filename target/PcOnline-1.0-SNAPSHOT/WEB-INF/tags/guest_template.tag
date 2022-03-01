<%@ tag language="java" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ attribute name="tittle" required="true" type="java.lang.String" %>
<%@ attribute name="content" fragment="true" %>
<!doctype html>
<html class="no-js" lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="x-ua-compatible" content="ie=edge">
		<title>${tittle}</title>
		<meta name="description" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<%--Google Sign In--%>
		<meta name="google-signin-scope" content="profile email">
		<meta name="google-signin-client_id" content="641342109621-ku4sp2tqo4cm9lad2mi5o1ehfmud3l7g.apps.googleusercontent.com">


		<!-- Favicon -->
		<link rel="shortcut icon" type="image/x-icon" href="<c:url value='/assets/guest/images/favicon.png'/>">

		<%@include file="/views/Guest/components/css.jsp" %>

		<!-- Modernizr js -->
		<script src="${pageContext.request.contextPath}/assets/guest/js/vendor/modernizr-2.8.3.min.js"></script>
		<!-- jQuery-V1.12.4 -->
		<script src="${pageContext.request.contextPath}/assets/guest/js/vendor/jquery-1.12.4.min.js"></script>
	</head>

	<style>
        /*Home Two | Slider Background Image*/
        .bg-4, .bg-5, .bg-6 {
            background-image: url(${pageContext.request.contextPath}/assets/guest/images/slider/bg_1.jpg);
            background-repeat: no-repeat;
            background-position: center center;
            background-size: cover;
            min-height: 475px;
            width: 100%;
        }

        .bg-5 {
            background-image: url(${pageContext.request.contextPath}/assets/guest/images/slider/bg_2.jpg);
        }

        .bg-6 {
            background-image: url(${pageContext.request.contextPath}/assets/guest/images/slider/bg_3.jpg);
        }
        /*----------------------------------------VN_pay Bank-------------------------------------------------*/
        .banking-methods {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .banking-methods:after {
            content: "";
            clear: both;
        }

        .banking-method {
            border: 1px solid #ccc;
            box-sizing: border-box;
            position: relative;
            float: left;
            height: 52px;
            width: 200px;
            margin-top: 5px;
        }

        .banking-method label {
            background: #fff no-repeat center center;
            bottom: 1px;
            left: 1px;
            right: 1px;
            top: 1px;
            cursor: pointer;
            display: block;
            font-size: 0;
            position: absolute;
            text-indent: 100%;
            white-space: nowrap;
            margin-bottom: 0;
        }
        .banking-method input {
            margin: 4px 1px 0;
        }

        .banking-method + .payment-method {
            margin: 0px;
            padding: 0px;
        }
        .banking-methods input:focus + label {
            outline: 2px dotted #21b4d0;
        }

        .banking-methods input:checked + label {
            outline: 4px solid #21b4d0;
        }

        @-moz-document url-prefix() {
            .banking-methods input:checked + label:after {
                bottom: 0;
                right: 0;
                background-color: #21b4d0;
            }
        }
        .SACOMBANK label {
            background-image: url(	https://sandbox.vnpayment.vn/paymentv2/images/bank/sacombank_logo.png);
        }

        .NCB label {
            background-image: url(https://sandbox.vnpayment.vn/paymentv2/images/bank/ncb_logo.png);
        }
        .BIDV label {
            background-image: url(	https://sandbox.vnpayment.vn/paymentv2/images/bank/bidv_logo.png);
        }

        .AGRIBANK label {
            background-image: url(https://sandbox.vnpayment.vn/paymentv2/images/bank/agribank_logo.png);
        }
        .ACB label {
            background-image: url(	https://sandbox.vnpayment.vn/paymentv2/images/bank/acb_logo.png);
        }

        .SCB label {
            background-image: url(https://sandbox.vnpayment.vn/paymentv2/images/bank/scb_logo.png);
        }
        .EXIMBANK label {
            background-image: url(	https://sandbox.vnpayment.vn/paymentv2/images/bank/eximbank_logo.png);
        }

        .NAMABANK label {
            background-image: url(https://sandbox.vnpayment.vn/paymentv2/images/bank/namabank_logo.png);
        }
	</style>

	<body>
		<!-- Begin Header Area -->
		<header>
			<!-- Begin Header Top Area -->
			<div class="header-top">
				<div class="container">
					<div class="row">
						<!-- Begin Header Top Left Area -->
						<div class="col-lg-3 col-md-4">
							<div class="header-top-left">
								<ul class="phone-wrap">
									<li><span>Group 9 - Java Web</span></li>
								</ul>
							</div>
						</div>
						<!-- Header Top Left Area End Here -->
						<!-- Begin Header Top Right Area -->
						<div class="col-lg-9 col-md-8">
							<div class="header-top-right">
								<ul class="ht-menu">
									<c:choose>
										<c:when test="${sessionScope.user != null}">
											<!-- Begin Setting Area -->
											<li>
												<a href="#">${sessionScope.user.name}</a>
												<div class="ht-setting-trigger"><span></span></div>
												<div class="setting ht-setting">
													<ul class="ht-setting-list">
														<li><a href="#">My Account</a></li>
													</ul>
												</div>
											</li>
											<!-- Setting Area End Here -->
											<!-- Begin Currency Area -->
											<li>
												<a href="<c:url value='/home/login/signout'/>">Sign out</a>
											</li>
											<!-- Currency Area End Here -->
										</c:when>
										<c:otherwise>
											<li>
												<a href="<c:url value='/home/login/'/>">Sign in</a>
											</li>
											<li>
												<span class="language-selector-wrapper">Time:</span>
												<div class="ht-language-trigger"><span>English</span></div>
											</li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
						</div>
						<!-- Header Top Right Area End Here -->
					</div>
				</div>
			</div>
			<!-- Header Top Area End Here -->

			<!-- Begin Header Middle Area -->
			<div class="header-middle pl-sm-0 pr-sm-0 pl-xs-0 pr-xs-0">
				<div class="container">
					<div class="row">
						<!-- Begin Header Logo Area -->
						<div class="col-lg-2">
							<div class="logo pb-sm-30 pb-xs-30">
								<a href="<c:url value='/home'/>">
									<img src="${pageContext.request.contextPath}/assets/guest/images/menu/logo/1.jpg"
										 alt="">
								</a>
							</div>
						</div>
						<!-- Header Logo Area End Here -->
						<!-- Begin Header Middle Right Area -->
						<div class="col-lg-10">
							<!-- Begin Header Middle Searchbox Area -->
							<div class="col-lg-10">
								<form action="#" class="hm-searchbox">
									<select class="nice-select select-search-category">
										<option value="0">All</option>
										<option value="10">Laptops</option>
										<option value="17">- - Prime Video</option>
									</select>
									<input type="text" placeholder="Enter your search key ...">
									<button class="li-btn" type="submit"><i class="fa fa-search"></i></button>
								</form>
							</div>
							<!-- Header Middle Searchbox Area End Here -->

							<!-- Begin Header Middle Right Area -->
							<div class="header-middle-right">
								<ul class="hm-menu">
									<!-- Begin Header Middle Wishlist Area -->
									<li class="hm-wishlist">
										<a href="<c:url value='/home/cart/checkout'/>">
											<span class="cart-item-count wishlist-item-count">0</span>
											<i class="fa fa-heart-o"></i>
										</a>
									</li>
									<!-- Header Middle Wishlist Area End Here -->

									<!-- Begin Header Mini Cart Area -->
									<li class="hm-minicart">
										<%@include file="../../views/Guest/components/minicart.jsp" %>
									</li>


									<%--<li class="hm-wishlist" id="minicart">
										<a href="<c:url value='/home/cart/'/>">
											<span class="cart-item-count wishlist-item-count" id="cartcount">${cart.ordersById.size()}</span>
											<i class="fa fa-shopping-cart"></i>
										</a>
									</li>--%>
									<!-- Header Mini Cart Area End Here -->
								</ul>
							</div>
							<!-- Header Middle Right Area End Here -->
						</div>
						<!-- Header Middle Right Area End Here -->
					</div>
				</div>
			</div>
			<!-- Header Middle Area End Here -->

			<!-- Begin Header Bottom Area -->
			<%@include file="../../views/Guest/components/navbar.jsp" %>
			<!-- Header Bottom Area End Here -->


			<!-- Begin Mobile Menu Area -->
			<%@include file="../../views/Guest/components/mobile-menu.jsp" %>
			<!-- Mobile Menu Area End Here -->
		</header>
		<!-- Header Area End Here -->

		<!-- Begin Body Wrapper -->
		<div class="body-wrapper">
			<jsp:doBody/>

		</div>
		<!-- Body Wrapper End Here -->

		<!-- Begin Footer Area -->
		<div class="footer">
			<!-- Begin Footer Static Top Area -->
			<div class="footer-static-top footer-static-top-3 pt-xs-50 pb-xs-10">
				<div class="container">
					<!-- Begin Footer Shipping Area -->
					<div class="footer-shipping pb-xs-0">
						<div class="row">
							<!-- Begin Li's Shipping Inner Box Area -->
							<div class="col-lg-3 col-md-3 col-sm-6 pb-xs-45">
								<div class="li-shipping-inner-box">
									<div class="shipping-icon">
										<img src="${pageContext.request.contextPath}/assets/guest/images/shipping-icon/1.png"
											 alt="Shipping Icon">
									</div>
									<div class="shipping-text">
										<h2>Free Delivery</h2>
										<p>And free returns. See checkout for delivery dates.</p>
									</div>
								</div>
							</div>
							<!-- Li's Shipping Inner Box Area End Here -->
							<!-- Begin Li's Shipping Inner Box Area -->
							<div class="col-lg-3 col-md-3 col-sm-6 pb-xs-45">
								<div class="li-shipping-inner-box">
									<div class="shipping-icon">
										<img src="${pageContext.request.contextPath}/assets/guest/images/shipping-icon/2.png"
											 alt="Shipping Icon">
									</div>
									<div class="shipping-text">
										<h2>Safe Payment</h2>
										<p>Pay with the world's most popular and secure payment methods.</p>
									</div>
								</div>
							</div>
							<!-- Li's Shipping Inner Box Area End Here -->
							<!-- Begin Li's Shipping Inner Box Area -->
							<div class="col-lg-3 col-md-3 col-sm-6 pb-xs-45">
								<div class="li-shipping-inner-box">
									<div class="shipping-icon">
										<img src="${pageContext.request.contextPath}/assets/guest/images/shipping-icon/3.png"
											 alt="Shipping Icon">
									</div>
									<div class="shipping-text">
										<h2>Shop with Confidence</h2>
										<p>Our Buyer Protection covers your purchasefrom click to delivery.</p>
									</div>
								</div>
							</div>
							<!-- Li's Shipping Inner Box Area End Here -->
							<!-- Begin Li's Shipping Inner Box Area -->
							<div class="col-lg-3 col-md-3 col-sm-6">
								<div class="li-shipping-inner-box last-child">
									<div class="shipping-icon">
										<img src="${pageContext.request.contextPath}/assets/guest/images/shipping-icon/4.png"
											 alt="Shipping Icon">
									</div>
									<div class="shipping-text">
										<h2>24/7 Help Center</h2>
										<p>Have a question? Call a Specialist or chat online.</p>
									</div>
								</div>
							</div>
							<!-- Li's Shipping Inner Box Area End Here -->
						</div>
					</div>
					<!-- Footer Shipping Area End Here -->
				</div>
			</div>
			<!-- Footer Static Top Area End Here -->
			<!-- Begin Footer Static Middle Area -->
			<div class="footer-static-middle">
				<div class="container">
					<div class="footer-logo-wrap pt-50 pb-35">
						<div class="row">
							<!-- Begin Footer Logo Area -->
							<div class="col-lg-4 col-md-6">
								<div class="footer-logo">
									<img src="${pageContext.request.contextPath}/assets/guest/images/menu/logo/1.jpg"
										 alt="Footer Logo">
									<p class="info">
										We are a team of designers and developers that create high quality HTML Template
										& Woocommerce, Shopify Theme.
									</p>
								</div>
								<ul class="des">

									<li>
										<span>Phone: </span>
										<a href="#">(+123) 123 321 345</a>
									</li>
									<li>
										<span>Email: </span>
										<a href="mailto://info@yourdomain.com">info@yourdomain.com</a>
									</li>
								</ul>
							</div>
							<!-- Footer Logo Area End Here -->
							<!-- Begin Footer Block Area -->
							<div class="col-lg-2 col-md-3 col-sm-6">
								<div class="footer-block">
									<h3 class="footer-block-title">Product</h3>
									<ul>
										<li><a href="#">Prices drop</a></li>
										<li><a href="#">New products</a></li>
										<li><a href="#">Best sales</a></li>
										<li><a href="#">Contact us</a></li>
									</ul>
								</div>
							</div>
							<!-- Footer Block Area End Here -->
							<!-- Begin Footer Block Area -->
							<div class="col-lg-2 col-md-3 col-sm-6">
								<div class="footer-block">
									<h3 class="footer-block-title">Our company</h3>
									<ul>
										<li><a href="#">Delivery</a></li>
										<li><a href="#">Legal Notice</a></li>
										<li><a href="#">About us</a></li>
										<li><a href="#">Contact us</a></li>
									</ul>
								</div>
							</div>
							<!-- Footer Block Area End Here -->
							<!-- Begin Footer Block Area -->
							<div class="col-lg-4">
								<div class="footer-block">
									<h3 class="footer-block-title">Follow Us</h3>
									<ul class="social-link">
										<li class="twitter">
											<a href="https://twitter.com/" data-toggle="tooltip" target="_blank"
											   title="Twitter">
												<i class="fa fa-twitter"></i>
											</a>
										</li>
										<li class="rss">
											<a href="https://rss.com/" data-toggle="tooltip" target="_blank"
											   title="RSS">
												<i class="fa fa-rss"></i>
											</a>
										</li>
										<li class="google-plus">
											<a href="https://www.plus.google.com/discover" data-toggle="tooltip"
											   target="_blank" title="Google +">
												<i class="fa fa-google-plus"></i>
											</a>
										</li>
										<li class="facebook">
											<a href="https://www.facebook.com/" data-toggle="tooltip" target="_blank"
											   title="Facebook">
												<i class="fa fa-facebook"></i>
											</a>
										</li>
										<li class="youtube">
											<a href="https://www.youtube.com/" data-toggle="tooltip" target="_blank"
											   title="Youtube">
												<i class="fa fa-youtube"></i>
											</a>
										</li>
										<li class="instagram">
											<a href="https://www.instagram.com/" data-toggle="tooltip" target="_blank"
											   title="Instagram">
												<i class="fa fa-instagram"></i>
											</a>
										</li>
									</ul>
								</div>
								<!-- Begin Footer Newsletter Area -->
								<div class="footer-newsletter">
									<h4>Sign up to newsletter</h4>
									<form action="#" method="post" id="mc-embedded-subscribe-form"
										  name="mc-embedded-subscribe-form" class="footer-subscribe-form validate"
										  target="_blank" novalidate>
										<div id="mc_embed_signup_scroll">
											<div id="mc-form" class="mc-form subscribe-form form-group">
												<input id="mc-email" type="email" autocomplete="off"
													   placeholder="Enter your email"/>
												<button class="btn" id="mc-submit">Subscribe</button>
											</div>
										</div>
									</form>
								</div>
								<!-- Footer Newsletter Area End Here -->
							</div>
							<!-- Footer Block Area End Here -->
						</div>
					</div>
				</div>
			</div>
			<!-- Footer Static Middle Area End Here -->
			<!-- Begin Footer Static Bottom Area -->
			<div class="footer-static-bottom">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<!-- Begin Footer Links Area -->
							<div class="footer-links">
								<ul>
									<li><a href="#">Online Shopping</a></li>
									<li><a href="#">Promotions</a></li>
									<li><a href="#">My Orders</a></li>
									<li><a href="#">Help</a></li>
									<li><a href="#">Customer Service</a></li>
									<li><a href="#">Support</a></li>
									<li><a href="#">Most Populars</a></li>
									<li><a href="#">New Arrivals</a></li>
									<li><a href="#">Special Products</a></li>
									<li><a href="#">Manufacturers</a></li>
									<li><a href="#">Our Stores</a></li>
									<li><a href="#">Shipping</a></li>
									<li><a href="#">Payments</a></li>
									<li><a href="#">Warantee</a></li>
									<li><a href="#">Refunds</a></li>
									<li><a href="#">Checkout</a></li>
									<li><a href="#">Discount</a></li>
									<li><a href="#">Refunds</a></li>
									<li><a href="#">Policy Shipping</a></li>
								</ul>
							</div>
							<!-- Footer Links Area End Here -->
							<!-- Begin Footer Payment Area -->
							<div class="payment text-center">
								<a href="#">
									<img src="${pageContext.request.contextPath}/assets/guest/images/payment/1.png"
										 alt="">
								</a>
							</div>
							<!-- Footer Payment Area End Here -->
							<!-- Begin Copyright Area -->
							<div class="copyright text-center pt-30 pb-50">
								<span><a href="https://www.templatespoint.net"
										 target="_blank">Templates Point</a></span>
							</div>
							<!-- Copyright Area End Here -->
						</div>
					</div>
				</div>
			</div>
			<!-- Footer Static Bottom Area End Here -->
		</div>
		<!-- Footer Area End Here -->

		<!-- Begin Quick View | Modal Area -->
		<div class="modal fade modal-wrapper" id="exampleModalCenter">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-body">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<div class="modal-inner-area row">
							<div class="col-lg-5 col-md-6 col-sm-6">
								<!-- Product Details Left -->
								<div class="product-details-left">
									<div class="product-details-images slider-navigation-1">
										<div class="lg-image">
											<img src="${pageContext.request.contextPath}/assets/guest/images/product/large-size/1.jpg"
												 alt="product image">
										</div>
										<div class="lg-image">
											<img src="${pageContext.request.contextPath}/assets/guest/images/product/large-size/2.jpg"
												 alt="product image">
										</div>
										<div class="lg-image">
											<img src="${pageContext.request.contextPath}/assets/guest/images/product/large-size/3.jpg"
												 alt="product image">
										</div>
										<div class="lg-image">
											<img src="${pageContext.request.contextPath}/assets/guest/images/product/large-size/4.jpg"
												 alt="product image">
										</div>
										<div class="lg-image">
											<img src="${pageContext.request.contextPath}/assets/guest/images/product/large-size/5.jpg"
												 alt="product image">
										</div>
										<div class="lg-image">
											<img src="${pageContext.request.contextPath}/assets/guest/images/product/large-size/6.jpg"
												 alt="product image">
										</div>
									</div>
									<div class="product-details-thumbs slider-thumbs-1">
										<div class="sm-image"><img
												src="${pageContext.request.contextPath}/assets/guest/images/product/small-size/1.jpg"
												alt="product image thumb"></div>
										<div class="sm-image"><img
												src="${pageContext.request.contextPath}/assets/guest/images/product/small-size/2.jpg"
												alt="product image thumb"></div>
										<div class="sm-image"><img
												src="${pageContext.request.contextPath}/assets/guest/images/product/small-size/3.jpg"
												alt="product image thumb"></div>
										<div class="sm-image"><img
												src="${pageContext.request.contextPath}/assets/guest/images/product/small-size/4.jpg"
												alt="product image thumb"></div>
										<div class="sm-image"><img
												src="${pageContext.request.contextPath}/assets/guest/images/product/small-size/5.jpg"
												alt="product image thumb"></div>
										<div class="sm-image"><img
												src="${pageContext.request.contextPath}/assets/guest/images/product/small-size/6.jpg"
												alt="product image thumb"></div>
									</div>
								</div>
								<!--// Product Details Left -->
							</div>

							<div class="col-lg-7 col-md-6 col-sm-6">
								<div class="product-details-view-content pt-60">
									<div class="product-info">
										<h2>Today is a good day Framed poster</h2>
										<span class="product-details-ref">Reference: demo_15</span>
										<div class="rating-box pt-20">
											<ul class="rating rating-with-review-item">
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li class="no-star"><i class="fa fa-star-o"></i></li>
												<li class="no-star"><i class="fa fa-star-o"></i></li>
												<li class="review-item"><a href="#">Read Review</a></li>
												<li class="review-item"><a href="#">Write Review</a></li>
											</ul>
										</div>
										<div class="price-box pt-20">
											<span class="new-price new-price-2">$57.98</span>
										</div>
										<div class="product-desc">
											<p>
                                                    <span>100% cotton double printed dress. Black and white striped top and orange high waisted skater skirt bottom. Lorem ipsum dolor sit amet, consectetur adipisicing elit. quibusdam corporis, earum facilis et nostrum dolorum accusamus similique eveniet quia pariatur.
                                                    </span>
											</p>
										</div>
										<div class="product-variants">
											<div class="produt-variants-size">
												<label>Dimension</label>
												<select class="nice-select">
													<option value="1" title="S" selected="selected">40x60cm</option>
													<option value="2" title="M">60x90cm</option>
													<option value="3" title="L">80x120cm</option>
												</select>
											</div>
										</div>
										<div class="single-add-to-cart">
											<form action="#" class="cart-quantity">
												<div class="quantity">
													<label>Quantity</label>
													<div class="cart-plus-minus">
														<input class="cart-plus-minus-box" value="1" type="text">
														<div class="dec qtybutton"><i class="fa fa-angle-down"></i>
														</div>
														<div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>
													</div>
												</div>
												<button class="add-to-cart" type="submit">Add to cart</button>
											</form>
										</div>
										<div class="product-additional-info pt-25">
											<a class="wishlist-btn" href="wishlist.html"><i class="fa fa-heart-o"></i>Add
												to wishlist</a>
											<div class="product-social-sharing pt-25">
												<ul>
													<li class="facebook"><a href="#"><i class="fa fa-facebook"></i>Facebook</a>
													</li>
													<li class="twitter"><a href="#"><i class="fa fa-twitter"></i>Twitter</a>
													</li>
													<li class="google-plus"><a href="#"><i
															class="fa fa-google-plus"></i>Google +</a></li>
													<li class="instagram"><a href="#"><i class="fa fa-instagram"></i>Instagram</a>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Quick View | Modal Area End Here -->
	</body>


	<footer>
		<%@include file="/views/Guest/components/js.jsp" %>
		<script>
            function updateCart() {
                var inputqty = $(this).val();
                alert(inputqty)

            }

            //Edit Cart
            $(document).on("click", ".qtybutton", function () {
                var inputqty = $(this).closest('.cart-plus-minus').find('input');
                var closettr = $(this).closest('tr');
                var oqty = inputqty.val();
                var oid = inputqty.attr('data-id');
                var qtyid = inputqty.attr('data-qtyid');
                var orpid = inputqty.attr('data-orpid');
                var trtotalid = 'trtotal';
                var carturl = inputqty.attr('data-url');

                var $button = $(this);
                var oldValue = $button.parent().find("input").val();
                var newVal = 0;
                if ($button.hasClass('inc')) {
                    newVal = parseFloat(oldValue) + 1;
                    $.ajax({
                        type: "POST",
                        url: inputqty.attr('data-url'),
                        data: {qty: newVal, id: oid},
                        success: function (responseXml) {
                            inputqty.val($(responseXml).find(qtyid).children().val())
                            closettr.find(orpid).html($(responseXml).find(orpid).html());
                            $(document).find(trtotalid).html($(responseXml).find(trtotalid).html());
                        },
                        error: function (data) {
                            alert("Lỗi");
                        }
                    });
                } else {
                    if (oldValue >> 1) {
                        newVal = parseFloat(oldValue) - 1;
                        $.ajax({
                            type: "POST",
                            url: carturl,
                            data: {qty: newVal, id: oid},
                            success: function (responseXml) {
                                //$('#formCart').html($(responseXml).html());
                                //$(".cart-plus-minus").append('<div class="dec qtybutton"><i class="fa fa-angle-down"></i></div><div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>');
                                inputqty.val($(responseXml).find(qtyid).children().val())
                                closettr.find(orpid).html($(responseXml).find(orpid).html());
                                $(document).find(trtotalid).html($(responseXml).find(trtotalid).html());
                            },
                            error: function (data) {
                                alert("Lỗi");
                            }
                        });
                    } else {
                        //newVal = 1;
                        carturl = '<c:url value='/home/cart/delete'/>';
                        $.ajax({
                            type: "POST",
                            url: carturl,
                            data: {qty: newVal, id: oid},
                            success: function (responseXml) {
                                closettr.html("");
                                $(document).find(trtotalid).html($(responseXml).find(trtotalid).html());
                            },
                            error: function (data) {
                                alert("Lỗi");
                            }
                        });
                    }
                }
                $button.parent().find("input").val(newVal);
            });

            $(document).ready(function () {
                $('.hm-minicart').click(function () {
                    window.location.replace("<c:url value='/home/cart/'/>");
                });

                //Thêm giỏ hàng
                $('.addcart').click(function () {
                    var href = '<c:url value='/home/cart/add?id='/>' + $(this).attr('data-id');
                    $.ajax({
                        type: "POST",
                        url: href,
                        success: function (responseXml) {
                            alert("Success");
                            $('.hm-minicart').html($(responseXml).html());
                        },
                        error: function (data) {
                            alert("Lỗi");
                        }
                    });
                });
                $('.add-to-cart').click(function(){
                    var href = $('#addcart').attr('action');
                    $.ajax({
                        type: "POST",
                        url: href,
                        success: function (responseXml) {
                            alert("Success");
                            $('.hm-minicart').html($(responseXml).html());
                        },
                        error: function (data) {
                            alert("Lỗi");
                        }
                    });
				});

                //ajax sửa số lượng đơn hàng (Tạm không dùng - Nhưng đừng xóa)
                $('.inc.qtybuttoni').click(function () {
                    var inputqty = $(this).closest('.cart-plus-minus').find('input');
                    var closettr = $(this).closest('tr');
                    var oqty = inputqty.val();
                    var oid = inputqty.attr('data-id');
                    var qtyid = inputqty.attr('data-qtyid');
                    var orpid = inputqty.attr('data-orpid');
                    var trtotalid = 'trtotal';
                    $.ajax({
                        type: "POST",
                        url: inputqty.attr('data-url'),
                        data: {qty: oqty, id: oid},
                        success: function (responseXml) {
                            inputqty.val($(responseXml).find(qtyid).children().val())
                            closettr.find(orpid).html($(responseXml).find(orpid).html());
                            $(document).find(trtotalid).html($(responseXml).find(trtotalid).html());
                        },
                        error: function (data) {
                            alert("Lỗi");
                        }
                    });
                });
                $('.dec.qtybuttoni').click(function () {
                    var inputqty = $(this).closest('.cart-plus-minus').find('input');
                    var closettr = $(this).closest('tr');
                    var button = $(this);
                    var oqty = inputqty.val();
                    var oid = inputqty.attr('data-id');
                    var qtyid = inputqty.attr('data-qtyid');
                    var orpid = inputqty.attr('data-orpid');
                    var trtotalid = 'trtotal';
                    var carturl = inputqty.attr('data-url');

                    if (oqty == 0) {
                        carturl = '<c:url value='/home/cart/delete'/>';
                        $.ajax({
                            type: "POST",
                            url: carturl,
                            data: {qty: oqty, id: oid},
                            success: function (responseXml) {
                                closettr.html("");
                                $(document).find(trtotalid).html($(responseXml).find(trtotalid).html());
                            },
                            error: function (data) {
                                alert("Lỗi");
                            }
                        });
                        //console.log(carturl);
                    } else {
                        $.ajax({
                            type: "POST",
                            url: carturl,
                            data: {qty: oqty, id: oid},
                            success: function (responseXml) {
                                //$('#formCart').html($(responseXml).html());
                                //$(".cart-plus-minus").append('<div class="dec qtybutton"><i class="fa fa-angle-down"></i></div><div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>');
                                inputqty.val($(responseXml).find(qtyid).children().val())
                                closettr.find(orpid).html($(responseXml).find(orpid).html());
                                $(document).find(trtotalid).html($(responseXml).find(trtotalid).html());
                            },
                            error: function (data) {
                                alert("Lỗi");
                            }
                        });
                    }
                });

                //ajax xóa sản phẩm trong đơn hàng
                $('.delete-cart').click(function () {
                    var closettr = $(this).closest('tr');
                    var trtotalid = 'trtotal';
                    $.ajax({
                        type: "POST",
                        url: $(this).attr('data-url'),
                        success: function (responseXml) {
                            closettr.html("");
                            $(document).find(trtotalid).html($(responseXml).find(trtotalid).html());
                        },
                        error: function (data) {
                            alert("Lỗi");
                        }
                    });
                });
            });

            //Login Google
            function onSignIn(googleUser) {
                var profile = googleUser.getBasicProfile();
                console.log('ID: ' + profile.getId());
                console.log('Name: ' + profile.getName());
                console.log('Image URL: ' + profile.getImageUrl());
                console.log('Email: ' + profile.getEmail());
                console.log('id_token: ' + googleUser.getAuthResponse().id_token);

                //do not post above info to the server because that is not safe.
                //just send the id_token

                var redirectUrl = 'login';

                //using jquery to post data dynamically
                var form = $('<form action="' + redirectUrl + '" method="post">' +
                    '<input type="text" name="id_token" value="' +
                    googleUser.getAuthResponse().id_token + '" />' +
                    '</form>');
                $('body').append(form);
                form.submit();
            }
		</script>
	</footer>
</html>



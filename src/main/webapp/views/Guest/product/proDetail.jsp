<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<mt:guest_template tittle="${product.proname}">
	<jsp:body>
		<!-- Begin Li's Breadcrumb Area -->
		<div class="breadcrumb-area">
			<div class="container">
				<div class="breadcrumb-content">
					<ul>
						<li><a href="/home">Home</a></li>
						<li>
							<a href="<c:url value = "/home/product/list?cid=${product.categoriesByProcategoryid.id}"/>">${product.categoriesByProcategoryid.cname}</a>
						</li>
						<li class="active">${product.proname}</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- Li's Breadcrumb Area End Here -->
		<!-- content-wraper start -->
		<div class="content-wraper">
			<div class="container">
				<div class="row single-product-area">
					<div class="col-lg-5 col-md-6">
						<!-- Product Details Left -->
						<div class="product-details-left">
							<div class="product-details-images sslider-navigation-1">
								<div class="lg-image" style="width: 470px; height: 470px">
									<img src="<c:url value='/public/images/${product.proavatar}'/>" alt="product image">
								</div>
							</div>
						</div>
						<!--// Product Details Left -->
					</div>

					<div class="col-lg-7 col-md-6">
						<div class="product-details-view-content sp-affiliate-content pt-60">
							<div class="product-info">
								<h2>${product.proname}</h2>
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
									<span class="new-price new-price-2">
										<fmt:setLocale value="vi_VN"/>
										<fmt:formatNumber value="${product.proprice}" type="currency"/>
									</span>
								</div>
								<div class="product-desc">
									<p>
                                            <span>
													${product.prodescription}
											</span>
									</p>
								</div>
								<div class="single-add-to-cart">
									<form method="post" action="<c:url value='/home/cart/add?id=${product.id}'/>" class="cart-quantity" id="addcart">
										<button class="add-to-cart" type="button" data-id="${product.id}">Add to cart</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- content-wraper end -->
		<!-- Begin Product Area -->
		<div class="product-area pt-35">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="li-product-tab">
							<ul class="nav li-product-menu">
								<li><a class="active" data-toggle="tab" href="#description"><span>Description</span></a>
								</li>
								<li><a data-toggle="tab" href="#product-details"><span>Product Details</span></a></li>
								<li><a data-toggle="tab" href="#reviews"><span>Reviews</span></a></li>
							</ul>
						</div>
						<!-- Begin Li's Tab Menu Content Area -->
					</div>
				</div>
				<div class="tab-content">
					<div id="description" class="tab-pane active show" role="tabpanel">
						<div class="product-description">
							<span>The best is yet to come! Give your walls a voice with a framed poster. This aesthethic, optimistic poster will look great in your desk or in an open-space office. Painted wooden frame with passe-partout for more depth.</span>
						</div>
					</div>
					<div id="product-details" class="tab-pane" role="tabpanel">
						<div class="product-details-manufacturer">
								${product.procontent}
						</div>
					</div>
					<div id="reviews" class="tab-pane" role="tabpanel">
						<div class="product-reviews">
							<div class="product-details-comment-block">
								<div class="comment-review">
									<span>Grade</span>
									<ul class="rating">
										<li><i class="fa fa-star-o"></i></li>
										<li><i class="fa fa-star-o"></i></li>
										<li><i class="fa fa-star-o"></i></li>
										<li class="no-star"><i class="fa fa-star-o"></i></li>
										<li class="no-star"><i class="fa fa-star-o"></i></li>
									</ul>
								</div>
								<div class="comment-author-infos pt-25">
									<span>HTML 5</span>
									<em>01-12-18</em>
								</div>
								<div class="comment-details">
									<h4 class="title-block">Demo</h4>
									<p>Plaza</p>
								</div>
								<div class="review-btn">
									<a class="review-links" href="#" data-toggle="modal" data-target="#mymodal">Write
										Your
										Review!</a>
								</div>
								<!-- Begin Quick View | Modal Area -->
								<div class="modal fade modal-wrapper" id="mymodal">
									<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="modal-body">
												<h3 class="review-page-title">Write Your Review</h3>
												<div class="modal-inner-area row">
													<div class="col-lg-6">
														<div class="li-review-product">
															<img src="images/product/large-size/3.jpg"
																 alt="Li's Product">
															<div class="li-review-product-desc">
																<p class="li-product-name">Today is a good day Framed
																	poster</p>
																<p>
																	<span>Beach Camera Exclusive Bundle - Includes Two Samsung Radiant 360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire Room With Exquisite Sound via Ring Radiator Technology. Stream And Control R3 Speakers Wirelessly With Your Smartphone. Sophisticated, Modern Design </span>
																</p>
															</div>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="li-review-content">
															<!-- Begin Feedback Area -->
															<div class="feedback-area">
																<div class="feedback">
																	<h3 class="feedback-title">Our Feedback</h3>
																	<form action="#">
																		<p class="your-opinion">
																			<label>Your Rating</label>
																			<span>
                                                                                    <select class="star-rating">
                                                                                      <option value="1">1</option>
                                                                                      <option value="2">2</option>
                                                                                      <option value="3">3</option>
                                                                                      <option value="4">4</option>
                                                                                      <option value="5">5</option>
                                                                                    </select>
                                                                                </span>
																		</p>
																		<p class="feedback-form">
																			<label for="feedback">Your Review</label>
																			<textarea id="feedback" name="comment"
																					  cols="45"
																					  rows="8"
																					  aria-required="true"></textarea>
																		</p>
																		<div class="feedback-input">
																			<p class="feedback-form-author">
																				<label for="author">Name<span
																						class="required">*</span>
																				</label>
																				<input id="author" name="author"
																					   value=""
																					   size="30" aria-required="true"
																					   type="text">
																			</p>
																			<p class="feedback-form-author feedback-form-email">
																				<label for="email">Email<span
																						class="required">*</span>
																				</label>
																				<input id="email" name="email" value=""
																					   size="30" aria-required="true"
																					   type="text">
																				<span class="required"><sub>*</sub> Required fields</span>
																			</p>
																			<div class="feedback-btn">
																				<a href="#" class="close"
																				   data-dismiss="modal"
																				   aria-label="Close">Close</a>
																				<a href="#">Submit</a>
																			</div>
																		</div>
																	</form>
																</div>
															</div>
															<!-- Feedback Area End Here -->
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- Quick View | Modal Area End Here -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Product Area End Here -->
		<!-- Begin Li's 15 other Product Area -->
		<section class="product-area li-laptop-product pt-30 pb-50">
			<div class="container">
				<div class="row">
					<!-- Begin Li's Section Area -->
					<div class="col-lg-12">
						<div class="li-section-title">
							<h2>
								<span>Các sản phẩm cùng danh mục:</span>
							</h2>
						</div>
						<div class="row">
							<div class="product-active owl-carousel">
								<c:forEach var="p" items="${products}" varStatus="status">
									<div class="col-lg-12">
										<!-- single-product-wrap start -->
										<div class="single-product-wrap">
											<div class="product-image" style="width: 206px; height: 206px">
												<a href="single-product.html">
													<img src="<c:url value='/public/images/${p.proavatar}'/>"
														 alt="Li's Product Image">
												</a>
												<span class="sticker">New</span>
											</div>
											<div class="product_desc">
												<div class="product_desc_info">
													<div class="product-review">
														<h5 class="manufacturer">
															<a href="product-details.html"></a>
														</h5>
														<div class="rating-box">
															<ul class="rating">
																<li><i class="fa fa-star-o"></i></li>
																<li><i class="fa fa-star-o"></i></li>
																<li><i class="fa fa-star-o"></i></li>
																<li class="no-star"><i class="fa fa-star-o"></i></li>
																<li class="no-star"><i class="fa fa-star-o"></i></li>
															</ul>
														</div>
													</div>
													<h4>
														<a class="product_name"
														   href="single-product.html">${p.proname}</a>
													</h4>
													<div class="price-box">
														<span class="new-price">
															<fmt:setLocale value="vi_VN"/>
															<fmt:formatNumber value="${p.proprice}" type="currency"/>
														</span>
													</div>
												</div>
												<div class="add-actions">
													<ul class="add-actions-link">
														<li class="add-cart active">
															<a class="addcart" data-id="${p.id}">Add to cart</a>
														</li>
														<li><a href="#" title="quick view" class="quick-view-btn"
															   data-toggle="modal" data-target="#exampleModalCenter"><i
																class="fa fa-eye"></i></a></li>
														<li><a class="links-details" href="wishlist.html"><i
																class="fa fa-heart-o"></i></a></li>
													</ul>
												</div>
											</div>
										</div>
										<!-- single-product-wrap end -->
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<!-- Li's Section Area End Here -->
				</div>
			</div>
		</section>
		<!-- Li's Laptop Product Area End Here -->
	</jsp:body>
</mt:guest_template>

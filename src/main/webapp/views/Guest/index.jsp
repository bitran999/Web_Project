<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="categories" scope="request" type="java.util.List<entity.Categories>"/>
<jsp:useBean id="categorieshome" scope="request" type="java.util.List<entity.Categories>"/>
<mt:guest_template tittle="Guest">
	<jsp:body>
		<!-- Begin Slider With Category Menu Area -->
		<div class="Begin Slider With Category Menu Area ">
			<div class="container">
				<div class="row">
					<!-- Begin Category Menu Area -->
					<div class="col-lg-3">
						<!--Category Menu Start-->
						<div class="category-menu">
							<div class="category-heading">
								<h2 class="categories-toggle"><span>categories</span></h2>
							</div>
							<c:choose>
								<c:when test="${categories.size() == 0}">
									<div class="card-body">
										<p class="card-text">Không có dữ liệu</p>
									</div>
								</c:when>
								<c:otherwise>
									<div id="cate-toggle" class="category-menu-list">
										<ul>
											<c:forEach var="c" items="${categories}" varStatus="status">
												<li class="${status.count >= 9 ? "rx-child" : ""}"><a
														href="<c:url value = "/home/product/list?cid=${c.id}"/>">${c.cname}</a>
												</li>
											</c:forEach>
											<li class="rx-parent">
												<a class="rx-default">More Categories</a>
												<a class="rx-show">Less Categories</a>
											</li>
										</ul>
									</div>
								</c:otherwise>
							</c:choose>

						</div>
						<!--Category Menu End-->
					</div>
					<!-- Category Menu Area End Here -->
					<!-- Begin Slider Area -->
					<div class="col-lg-9">
						<div class="slider-area pt-sm-30 pt-xs-30">
							<div class="slider-active owl-carousel">
								<!-- Begin Single Slide Area -->
								<div class="single-slide align-center-left animation-style-02 bg-4">
									<div class="slider-progress"></div>
									<div class="slider-content">

									</div>
								</div>
								<!-- Single Slide Area End Here -->
								<!-- Begin Single Slide Area -->
								<div class="single-slide align-center-left animation-style-01 bg-5">
									<div class="slider-progress"></div>
									<div class="slider-content">

									</div>
								</div>
								<!-- Single Slide Area End Here -->
								<!-- Begin Single Slide Area -->
								<div class="single-slide align-center-left animation-style-02 bg-6">
									<div class="slider-progress"></div>
									<div class="slider-content">

									</div>
								</div>
								<!-- Single Slide Area End Here -->
							</div>
						</div>
					</div>
					<!-- Slider Area End Here -->
				</div>
			</div>
		</div>
		<!-- Slider With Category Menu Area End Here -->

		<!-- Begin Li's Static Banner Area -->
		<div class="li-static-banner pt-20 pt-sm-30">
			<div class="container">
				<div class="row">
					<!-- Begin Single Banner Area -->
					<div class="col-lg-4 col-md-4 text-center">
						<div class="single-banner pb-xs-30" >
							<a href="#">
								<img src="${pageContext.request.contextPath}/assets/guest/images/banner/4_1.jpg"
									 alt="Li's Static Banner">
							</a>
						</div>
					</div>
					<!-- Single Banner Area End Here -->
					<!-- Begin Single Banner Area -->
					<div class="col-lg-4 col-md-4 text-center">
						<div class="single-banner pb-xs-30">
							<a href="#">
								<img src="${pageContext.request.contextPath}/assets/guest/images/banner/4_2.jpg"
									 alt="Li's Static Banner">
							</a>
						</div>
					</div>
					<!-- Single Banner Area End Here -->
					<!-- Begin Single Banner Area -->
					<div class="col-lg-4 col-md-4 text-center">
						<div class="single-banner">
							<a href="#">
								<img src="${pageContext.request.contextPath}/assets/guest/images/banner/4_1.jpg"
									 alt="Li's Static Banner">
							</a>
						</div>
					</div>
					<!-- Single Banner Area End Here -->
				</div>
			</div>
		</div>
		<!-- Li's Static Banner Area End Here -->

		<c:choose>
			<c:when test="${categorieshome.size() == 0}">
				<div class="card-body">
					<p class="card-text">Không có dữ liệu</p>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="catehome" items="${categorieshome}" varStatus="status">
					<!-- Begin Li's ${catehome.cname} Product Area -->
					<section class="product-area li-laptop-product li-tv-audio-product pt-60 pb-45">
						<div class="container">
							<div class="row">
								<div class="col-lg-12">
									<div class="li-section-title">
										<h2>
											<span>${catehome.cname}</span>
										</h2>
										<ul class="li-sub-category-list">
											<li class="active"><a href="<c:url value = "/home/product/list?cid=${catehome.id}"/>">Xem tất cả</a></li>
										</ul>
									</div>
									<div class="row">
										<div class="product-active owl-carousel">
											<c:forEach var="p" items="${catehome.productsById}" varStatus="status">
												<div class="col-lg-12">
													<!-- single-product-wrap start -->
													<div class="single-product-wrap">
														<div class="product-image" style="width: 206px; height: 206px">
															<a href="<c:url value='/home/product/detail?id=${p.id}'/>">
																<img src="<c:url value='/public/images/${p.proavatar}'/>"
																	 alt="${p.proslug}">
															</a>
															<span class="sticker">New</span>
														</div>
														<div class="product_desc">
															<div class="product_desc_info">
																<div class="product-review">
																	<h5 class="manufacturer">
																		<a href="">MSI</a>
																	</h5>
																	<div class="rating-box">
																		<ul class="rating">
																			<li><i class="fa fa-star-o"></i></li>
																			<li><i class="fa fa-star-o"></i></li>
																			<li><i class="fa fa-star-o"></i></li>
																			<li class="no-star"><i
																					class="fa fa-star-o"></i></li>
																			<li class="no-star"><i
																					class="fa fa-star-o"></i></li>
																		</ul>
																	</div>
																</div>
																<h4><a class="product_name"
																	   href="<c:url value='/home/product/detail?id=${p.id}'/>">${p.proname}</a></h4>
																<div class="price-box">
																	<span class="new-price">
																		<fmt:setLocale value="vi_VN"/>
																		<fmt:formatNumber value="${p.proprice}"
																						  type="currency"/>
																	</span>
																</div>
															</div>
															<div class="add-actions">
																<ul class="add-actions-link">
																	<li class="add-cart active">
																		<a class="addcart" data-id="${p.id}">Add to cart</a>
																	</li>
																	<li>
																		<a class="links-details"
																		   href=""><i class="fa fa-heart-o"></i></a>
																	</li>
																	<li>
																		<a class="quick-view" data-toggle="modal"
																		   data-target="#exampleModalCenter" href="#"><i
																			class="fa fa-eye"></i></a>
																	</li>
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
							</div>
						</div>
					</section>
					<!-- Li's ${ch.cname} Area End Here -->
				</c:forEach>
			</c:otherwise>
		</c:choose>

	</jsp:body>
</mt:guest_template>

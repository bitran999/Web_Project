<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="products" scope="request" type="java.util.List<entity.Products>"/>
<mt:guest_template tittle="Guest">
	<jsp:body>
		<!-- Begin Li's Breadcrumb Area -->
		<div class="breadcrumb-area">
			<div class="container">
				<div class="breadcrumb-content">
					<ul>
						<li><a href="/home">Home</a></li>
						<li class="active">${category.cname}</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- Li's Breadcrumb Area End Here -->
		<!-- Begin Li's Content Wraper Area -->
		<div class="content-wraper pb-60">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<!-- Li's Banner Area End Here -->
						<!-- shop-top-bar start -->
						<div class="shop-top-bar mt-30">
							<div class="shop-bar-inner">
								<div class="product-view-mode">
									<!-- shop-item-filter-list start -->
									<ul class="nav shop-item-filter-list" role="tablist">
										<li class="active" role="presentation"><a aria-selected="true"
																				  class="active show" data-toggle="tab"
																				  role="tab" aria-controls="grid-view"
																				  href="#grid-view"><i
												class="fa fa-th"></i></a></li>
										<li role="presentation"><a data-toggle="tab" role="tab"
																   aria-controls="list-view" href="#list-view"><i
												class="fa fa-th-list"></i></a></li>
									</ul>
									<!-- shop-item-filter-list end -->
								</div>
								<div class="toolbar-amount">
									<span>Showing 1 to 9 of 15</span>
								</div>
							</div>
							<!-- product-select-box start -->
							<div class="product-select-box">
								<div class="product-short">
									<p>Sort By:</p>
									<select class="nice-select">
										<option value="trending">Default</option>
										<option value="sales">Name (A - Z)</option>
										<option value="sales">Name (Z - A)</option>
										<option value="rating">Price (Low &gt; High)</option>
									</select>
								</div>
							</div>
							<!-- product-select-box end -->
						</div>
						<!-- shop-top-bar end -->
						<!-- shop-products-wrapper start -->
						<div class="shop-products-wrapper">
							<div class="tab-content">
								<div id="grid-view" class="tab-pane fade active show" role="tabpanel">
									<div class="product-area shop-product-area">
										<div class="row">
											<c:choose>
												<c:when test="${products.size() == 0}">
													<div class="col-lg-3 col-md-4 col-sm-6 mt-40">
														<h6>Tạm chưa có sản phẩm</h6>
													</div>
												</c:when>
												<c:otherwise>
													<c:forEach var="p" items="${products}" varStatus="status">
														<div class="col-lg-3 col-md-4 col-sm-6 mt-40">
															<!-- single-product-wrap start -->
															<div class="single-product-wrap">
																<div class="product-image">
																	<a href="<c:url value='/home/product/detail?id=${p.id}'/>">
																		<div style="width: 250px; height: 250px">
																			<img class="img mx-auto d-block"
																				 style="width: auto; height: auto; max-width: 100%; max-height: 100%"
																				 src="<c:url value='/public/images/${p.proavatar}'/>"
																				 alt="${p.proslug}">
																		</div>
																	</a>
																	<span class="sticker">New</span>
																</div>
																<div class="product_desc">
																	<div class="product_desc_info">
																		<div class="product-review">
																			<h5 class="manufacturer">
																				<a href="#">Graphic Corner</a>
																			</h5>
																			<div class="rating-box">
																				<ul class="rating">
																					<li><i class="fa fa-star-o"></i>
																					</li>
																					<li><i class="fa fa-star-o"></i>
																					</li>
																					<li><i class="fa fa-star-o"></i>
																					</li>
																					<li class="no-star"><i
																							class="fa fa-star-o"></i>
																					</li>
																					<li class="no-star"><i
																							class="fa fa-star-o"></i>
																					</li>
																				</ul>
																			</div>
																		</div>
																		<h4><a class="product_name"
																			   href="<c:url value='/home/product/detail?id=${p.id}'/>">${p.proname}</a>
																		</h4>
																		<div class="price-box">
																			<span class="new-price">
																				<fmt:setLocale value = "vi_VN"/>
																				<fmt:formatNumber value = "${p.proprice}" type = "currency"/>
																			</span>
																		</div>
																	</div>
																	<div class="add-actions">
																		<ul class="add-actions-link">
																			<li class="add-cart active">
																				<form method="post" action="<c:url value='/home/cart/add?id=${p.id}'/>" id="addcart-${p.id}"> </form>
																				<a class="addcart" data-id="${p.id}">Add to cart</a>
																			</li>
																			<li><a href="#" title="quick view"
																				   class="quick-view-btn"
																				   data-toggle="modal"
																				   data-target="#exampleModalCenter"><i
																					class="fa fa-eye"></i></a></li>
																			<li><a class="links-details" href="3"><i
																					class="fa fa-heart-o"></i></a></li>
																		</ul>
																	</div>
																</div>
															</div>
															<!-- single-product-wrap end -->
														</div>
													</c:forEach>
												</c:otherwise>
											</c:choose>

										</div>
									</div>
								</div>
								<div id="list-view" class="tab-pane product-list-view fade" role="tabpanel">
									<div class="row">
										<div class="col">
											<c:choose>
												<c:when test="${categories.size() == 0}">
													<h3>Tạm chưa có sản phẩm</h3>
												</c:when>
												<c:otherwise>
													<c:forEach var="p" items="${products}" varStatus="status">
														<div class="row product-layout-list">
															<div class="col-lg-3 col-md-5 ">
																<div class="product-image">
																	<a href="<c:url value='/home/product/detail?id=${p.id}'/>">
																		<div style="width: 250px; height: 250px">
																			<img class="img mx-auto d-block"
																				 style="width: auto; height: auto; max-width: 100%; max-height: 100%"
																				 src="<c:url value='/public/images/${p.proavatar}'/>"
																				 alt="${p.proslug}">
																		</div>
																	</a>
																	<span class="sticker">New</span>
																</div>
															</div>
															<div class="col-lg-5 col-md-7">
																<div class="product_desc">
																	<div class="product_desc_info">
																		<div class="product-review">
																			<h5 class="manufacturer">
																				<a href="#">Graphic Corner</a>
																			</h5>
																			<div class="rating-box">
																				<ul class="rating">
																					<li><i class="fa fa-star-o"></i>
																					</li>
																					<li><i class="fa fa-star-o"></i>
																					</li>
																					<li><i class="fa fa-star-o"></i>
																					</li>
																					<li class="no-star"><i
																							class="fa fa-star-o"></i>
																					</li>
																					<li class="no-star"><i
																							class="fa fa-star-o"></i>
																					</li>
																				</ul>
																			</div>
																		</div>
																		<h4><a class="product_name"
																			   href="<c:url value='/home/product/detail?id=${p.id}'/>">${p.proname}</a>
																		</h4>
																		<div class="price-box">
																			<span class="new-price"><fmt:formatNumber value="${p.proprice}" type="currency"/></span>
																		</div>
																		<p>${p.prodescription}</p>
																	</div>
																</div>
															</div>
															<div class="col-lg-4">
																<div class="shop-add-action mb-xs-30">
																	<ul class="add-actions-link">
																		<li class="add-cart">
																			<a class="addcart" data-id="${p.id}">Add to cart</a>
																		</li>
																		<li class="wishlist">
																			<a href="wishlist.html">
																				<i class="fa fa-heart-o"></i>Add to wishlist</a>
																		</li>
																		<li>
																			<a class="quick-view" data-toggle="modal"
																			   data-target="#exampleModalCenter"
																			   href="#"><i class="fa fa-eye"></i>Quick view</a>
																		</li>
																	</ul>
																</div>
															</div>
														</div>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
								<div class="paginatoin-area">
									<div class="row">
										<div class="col-lg-6 col-md-6">
											<p>Showing 1-12 of 13 item(s)</p>
										</div>
										<div class="col-lg-6 col-md-6">
											<ul class="pagination-box">
												<li><a href="#" class="Previous"><i class="fa fa-chevron-left"></i>
													Previous</a>
												</li>
												<li class="active"><a href="#">1</a></li>
												<li><a href="#">2</a></li>
												<li><a href="#">3</a></li>
												<li>
													<a href="#" class="Next"> Next <i
															class="fa fa-chevron-right"></i></a>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- shop-products-wrapper end -->
					</div>
				</div>
			</div>
		</div>
		<!-- Content Wraper Area End Here -->
	</jsp:body>
</mt:guest_template>

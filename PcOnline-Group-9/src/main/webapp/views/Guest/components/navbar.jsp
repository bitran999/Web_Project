<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<div class="header-bottom header-sticky stick d-none d-lg-block d-xl-block">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<!-- Begin Header Bottom Menu Area -->
				<div class="hb-menu hb-menu-2">
					<nav>
						<ul>
							<li><a href="<c:url value='/home'/>">Home</a></li>
							<li class="dropdown-holder"><a href="#">Categories</a>
								<ul class="hb-dropdown">
									<c:choose>
										<c:when test="${categories.size() == 0}">
											<div class="card-body">
												<p class="card-text">Không có dữ liệu</p>
											</div>
										</c:when>
										<c:otherwise>
											<c:forEach var="c" items="${categories}" varStatus="status">
												<li><a href="<c:url value = "/home/product/list?cid=${c.id}"/>">${c.cname}</a></li>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</ul>
							</li>


							<li><a href="https://hcmute-group-9-assignment-link.herokuapp.com/">About Us</a></li>
							<li><a href="<c:url value='/contact'/>">Contact</a></li>
							<!-- Begin Header Bottom Menu Information Area -->

							<!-- Header Bottom Menu Information Area End Here -->
						</ul>
					</nav>
				</div>
				<!-- Header Bottom Menu Area End Here -->
			</div>
		</div>
	</div>
</div>
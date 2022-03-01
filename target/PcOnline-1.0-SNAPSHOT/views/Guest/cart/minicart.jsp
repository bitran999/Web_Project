<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
	<div class="hm-minicart-trigger">
		<span class="item-icon"></span>
		<span class="item-text">
		<fmt:formatNumber value="${cart.trtotal}" type="currency"/>
		<span class="cart-item-count">
			${cart.ordersById.size()}
		</span>
	</span>
	</div>
	<span></span>
	<%--
	<div class="minicart">
		<ul class="minicart-product-list">
			<c:choose>
				<c:when test="${cart.ordersById.size() == 0}">
					<div class="col-lg-3 col-md-4 col-sm-6 mt-40">
						<h6>Nothing in here</h6>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="order" items="${cart.ordersById}"
							   varStatus="status">
						<li>
							<a href="<c:url value='/home/product/detail?id=${order.productsByOrproductid.id}'/>"
							   class="minicart-product-image">
								<img src="<c:url value='/public/images/${order.productsByOrproductid.proavatar}'/>"
									 alt="${order.productsByOrproductid.proslug}">
							</a>
							<div class="minicart-product-details">
								<h6>
									<a href="<c:url value='/home/product/detail?id=${order.productsByOrproductid.id}'/>">
											${order.productsByOrproductid.proname}
									</a>
								</h6>
								<span><fmt:formatNumber
										value="${order.productsByOrproductid.proprice}"
										type="currency"/> x ${order.orqty}</span>
							</div>
							<button class="close">
								<i class="fa fa-close"></i>
							</button>
						</li>
					</c:forEach>
				</c:otherwise>
			</c:choose>

		</ul>
		<p class="minicart-total">SUBTOTAL:
			<span>
				<fmt:formatNumber value="${cart.trtotal}" type="currency"/>
			</span>
		</p>
		<div class="minicart-button">
			<a href="<c:url value='/home/cart/'/>"
			   class="li-button li-button-dark li-button-fullwidth li-button-sm">
				<span>View Full Cart</span>
			</a>
			<a href="<c:url value='/home/cart/checkout'/>"
			   class="li-button li-button-fullwidth li-button-sm">
				<span>Checkout</span>
			</a>
		</div>
	</div>--%>
</div>


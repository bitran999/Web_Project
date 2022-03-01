<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
	<div class="col-12">
		<form action="<c:url value='/home/cart/update'/>" method="post">
			<div class="table-content table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th class="li-product-remove">remove</th>
							<th class="li-product-thumbnail">images</th>
							<th class="cart-product-name">Product</th>
							<th class="li-product-price">Unit Price</th>
							<th class="li-product-quantity">Quantity</th>
							<th class="li-product-subtotal">Total</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="order" items="${cart.ordersById}">
							<tr>
								<td class="li-product-remove">
										<%--<form method="post" action="<c:url value='/home/cart/delete?id=${order.id}'/>" id="del-${order.id}" ></form>--%>
									<p class="btn btn-danger delete-cart"
									   data-url="<c:url value='/home/cart/delete?id=${order.id}'/>">
										<i class="fa fa-times"></i>
									</p>
								</td>
								<td class="li-product-thumbnail">
									<a href="#">
										<div style="width: 150px; height: 150px">
											<img class="img img-thumbnail mx-auto d-block"
												 style="width: auto; height: auto; max-width: 100%; max-height: 100%"
												 src="<c:url value='/public/images/${order.productsByOrproductid.proavatar}'/>"
												 alt="${order.productsByOrproductid.proslug}">
										</div>
									</a>
								</td>
								<td class="li-product-name"><a
										href="#">${order.productsByOrproductid.proname}</a></td>
								<td class="li-product-price"><span
										class="amount"><fmt:formatNumber
										value="${order.productsByOrproductid.proprice}"/> VNĐ</span></td>
								<td class="quantity">
									<div class="cart-plus-minus">
										<quality-${order.id}>
											<input class="cart-plus-minus-box" value="${order.orqty}" name="qty"
												   data-id="${order.id}" data-url="<c:url value='/home/cart/update'/>"
												   data-qtyid="quality-${order.id}" data-orpid="orderprice-${order.id}"
												   type="text" onchange="updateCart()" readonly>
											<div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>
											<div class="dec qtybutton"><i class="fa fa-angle-down"></i></div>
										</quality-${order.id}>

									</div>
								</td>
								<td class="product-subtotal">
									<span class="amount">
										<orderprice-${order.id}>
											<fmt:formatNumber value="${order.orprice}"/> VNĐ
										</orderprice-${order.id}>
									</span>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="row">
				<div class="col-12">
					<%--<div class="coupon-all">
						<div class="coupon2">
							<input class="button" name="update_cart" value="Update cart" type="submit">
						</div>
					</div>--%>
				</div>
			</div>
			<div class="row">
				<div class="col-md-5 ml-auto">
					<div class="cart-page-total">
						<h2>Cart totals</h2>
						<ul>
							<li>
								Total
								<span>
									<trtotal>
										<fmt:formatNumber value="${cart.trtotal}"/> VNĐ
									</trtotal>
								</span>
							</li>
						</ul>
						<a href="<c:url value='/home/cart/checkout'/>">Proceed to checkout</a>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>


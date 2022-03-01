<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<mt:guest_template tittle="Guest">
	<jsp:body>
		<!-- Begin Li's Breadcrumb Area -->
		<div class="breadcrumb-area">
			<div class="container">
				<div class="breadcrumb-content">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li class="active">Checkout</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- Li's Breadcrumb Area End Here -->
		<!--Checkout Area Strat-->
		<div class="checkout-area pt-60 pb-30">
			<div class="container">
				<form action="<c:url value='/home/cart/checkout/placeorder'/>" method="post" id="trform">
					<div class="row">
						<div class="col-lg-6 col-12">
							<div class="checkbox-form">
								<h3>Billing Details</h3>
								<div class="row">
									<div class="col-md-12">
										<div class="checkout-form-list">
											<label>Họ và tên người nhận<span class="required">*</span></label>
											<input placeholder="Full name" type="text" name="name"
												   value="${sessionScope.user.name}" required>
										</div>
									</div>
									<div class="col-md-12">
										<div class="checkout-form-list">
											<label>Địa chỉ <span class="required">*</span></label>
											<input placeholder="Địa chỉ giao hàng" type="text" name="address" required>
										</div>
									</div>
									<div class="col-md-12">
										<div class="checkout-form-list">
											<label> Email liên lạc <span class="required">*</span></label>
											<input placeholder="" type="email" name="email"
												   value="${sessionScope.user.email}" disabled>
										</div>
									</div>
									<div class="col-md-12">
										<div class="checkout-form-list">
											<label>Số điện thoại <span class="required">*</span></label>
											<input type="number" name="phone" required>
										</div>
									</div>
								</div>
								<div class="different-address">
									<div class="order-notes">
										<div class="checkout-form-list">
											<label>Order Notes</label>
											<textarea id="checkout-mess" cols="30" rows="10" name="note"
													  placeholder="Notes about your order, e.g. special notes for delivery."></textarea>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-12">
							<div class="your-order">
								<h3>Your order</h3>
								<div class="your-order-table table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th class="cart-product-name">Sản phẩm</th>
												<th class="cart-product-total">Giá trị</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="order" items="${cart.ordersById}">
												<tr class="cart_item">
													<td class="cart-product-name"> ${order.productsByOrproductid.proname}<strong
															class="product-quantity"> × ${order.orqty}</strong></td>
													<td class="cart-product-total">
													<span class="amount">
														<fmt:formatNumber value="${order.orprice}" type="currency"/>
													</span>
													</td>
												</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr class="order-total">
												<th>Tổng giá trị đơn hàng:</th>
												<td>
													<strong>
														<input name="amount" value="${sessionScope.cart.trtotal}" hidden>
														<span class="amount">
															<fmt:formatNumber value="${sessionScope.cart.trtotal}" type="currency"/>
														</span>
													</strong>
												</td>
											</tr>
										</tfoot>
									</table>
								</div>
								<div class="payment-method">
									<div class="payment-accordion">
										<div id="accordion">
											<div class="card">
												<div class="card-header" id="#payment-1">
													<h5 class="panel-title">
														<a class="" data-toggle="collapse" data-target="#collapseOne"
														   aria-expanded="true" aria-controls="collapseOne" id="placeorder">
															Đặt hàng
														</a>
													</h5>
												</div>
												<div id="collapseOne" class="collapse show" data-parent="#accordion">
													<div class="card-body">
														<br>
														<div class="order-button-payment">
															<input style="margin: 0" value="Place order" type="submit">
														</div>
													</div>
												</div>
											</div>
											<br>
											<p style="text-align: center; border-bottom: 1px solid #898989; line-height: 0.1em; margin: 10px 0 20px;">
												<span style=" background:#f2f2f2; padding:0 10px;">Or</span>
											</p>

											<div class="card">
												<div class="card-header" id="#payment-2">
													<h5 class="panel-title">
														<a class="collapsed" data-toggle="collapse"
														   data-target="#collapseTwo" aria-expanded="false"
														   aria-controls="collapseTwo" id="banktranfer">
															Thanh toán thông qua chuyển khoản.
														</a>
													</h5>
												</div>
												<div id="collapseTwo" class="collapse" data-parent="#accordion">
													<div class="card-body">
														<ul class="banking-methods row">
															<div class="col-sm-6">
																<li class="banking-method NCB ">
																	<input name="bankcode" type="radio" id="NCB"
																		   value="NCB">
																	<label for="NCB">NCB</label>
																</li>
															</div>
															<div class="col-sm-6">
																<li class="banking-method SACOMBANK ">
																	<input name="bankcode" type="radio" id="SACOMBANK"
																		   value="SACOMBANK">
																	<label for="SACOMBANK">SACOMBANK</label>
																</li>
															</div>
															<div class="col-md-6">
																<li class="banking-method BIDV ">
																	<input name="bankcode" type="radio" id="BIDV"
																		   value="BIDV">
																	<label for="BIDV">BIDV</label>
																</li>
															</div>
															<div class="col-md-6">
																<li class="banking-method AGRIBANK ">
																	<input name="bankcode" type="radio" id="AGRIBANK"
																		   value="AGRIBANK">
																	<label for="AGRIBANK">AGRIBANK</label>
																</li>
															</div>
															<div class="col-md-6">
																<li class="banking-method ACB ">
																	<input name="bankcode" type="radio" id="ACB"
																		   value="ACB">
																	<label for="ACB">ACB</label>
																</li>
															</div>
															<div class="col-md-6">
																<li class="banking-method SCB ">
																	<input name="bankcode" type="radio" id="SCB"
																		   value="SCB">
																	<label for="SCB">SCB</label>
																</li>
															</div>
															<div class="col-md-6">
																<li class="banking-method EXIMBANK ">
																	<input name="bankcode" type="radio" id="EXIMBANK"
																		   value="EXIMBANK">
																	<label for="EXIMBANK">EXIMBANK</label>
																</li>
															</div>
															<div class="col-md-6">
																<li class="banking-method NAMABANK ">
																	<input name="bankcode" type="radio" id="NAMABANK"
																		   value="NAMABANK">
																	<label for="NAMABANK">NAMABANK</label>
																</li>
															</div>

														</ul>
														<br>
														<div class="order-button-payment">
															<input style="margin: 0" value="Thanh toán" type="submit" id="vnpay">
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
				</form>
			</div>
		</div>
		<!--Checkout Area End-->
		<script type="text/javascript">
            $("#banktranfer").click(function () {
                $("#trform").attr("action", "/home/cart/checkout/vnpay");
            });
            $("#placeorder").click(function () {
                $("#trform").attr("action", "/home/cart/checkout/palaceorder");
            });
            /*$("#vnpay").click(function () {
                var postData = $("#trform").serialize();
                var submitUrl = "/home/cart/checkout/vnpay";
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            location.href = x.data;
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                return false;
            });*/
		</script>
	</jsp:body>
</mt:guest_template>

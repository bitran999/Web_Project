<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="transaction" scope="request" type="entity.Transactions"/>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Thông tin đơn hàng</title>
		<!-- Required meta tags -->
		<meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
			  integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
			  crossorigin="anonymous"/>
	</head>
	<style>
        body {
            font-family: Helvetica Neue, sans-serif;
            line-height: 1.42857143em;
            font-size: 14px;
        }

        .product-thumbnail {
            width: 50px;
            height: 50px;
            border-radius: 8px;
            background: #fff;
            position: relative;
        }


        .product_description_name,
        .product_description_property {
            display: block;
        }

        .product-table tbody th,
        .stock-table tbody th {
            padding-left: 1em;
            font-weight: 500;
            color: #333;
            padding-top: 0;
            padding-bottom: 0;
        }

        .product-thumbnail_image {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            max-width: 100%;
            max-height: 100%;
            margin: auto;
        }

        .product-thumbnail_quantity {
            color: #FFFFFF;
            background-color: #008744;
            font-size: .78em;
            white-space: nowrap;
            padding: 0 .62em;
            border-radius: 2em;
            color: #fff;
            position: absolute;
            right: -.9em;
            top: -.55em;
            z-index: 3;
            box-sizing: border-box;
            min-width: 1.75em;
            height: 1.75em;
            text-align: center;
            line-height: 1.75em;
        }

        h5 {
            font-weight: bold;
        }

        .thanks {
            font-weight: bolder;
        }

	</style>

	<%--<%
		//Begin process return from VNPAY
		Map fields = new HashMap();
		for (Enumeration params = request.getParameterNames(); params.hasMoreElements(); ) {
			String fieldName = (String) params.nextElement();
			String fieldValue = request.getParameter(fieldName);
			if ((fieldValue != null) && (fieldValue.length() > 0)) {
				fields.put(fieldName, fieldValue);
			}
		}

		String vnp_SecureHash = request.getParameter("vnp_SecureHash");
		if (fields.containsKey("vnp_SecureHashType")) {
			fields.remove("vnp_SecureHashType");
		}
		if (fields.containsKey("vnp_SecureHash")) {
			fields.remove("vnp_SecureHash");
		}
		String signValue = VnpayConst.hashAllFields(fields);

	%>--%>
	<body>
		<div class="container mt-4">
			<div class="header">
				<a href="/" class="hidden-xsx logo-big">
					<img src="<c:url value='/assets/guest/images/menu/logo/1.jpg'/>" alt="">
				</a>
			</div>
			<br>
			<div class="main">
				<div class="row">
					<div class="col-md-7">
						<div class="row">
							<div class="col-md-2 text-center">
								<img src="<c:url value='/assets/guest/images/Green-Check-Mark-PNG-Image.png'/>" class="img-fluid"
									 alt=""
									 style="width: 72px; height: 72px;">
							</div>
							<div class="col-md-10" style="font-size: 14px;">
								<h5 class="thanks">Cảm ơn bạn đã mua hàng</h5>
								<p>Một email xác nhận đã được gửi tới ${transaction.usersByTruserid.email}. <br> Xin vui lòng kiểm
									tra email của bạn</p>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-sm-6">
								<h5>Thông tin người nhận</h5>
								<p>${transaction.usersByTruserid.name}</p>
								<p>${transaction.usersByTruserid.email}</p>
								<p>${transaction.usersByTruserid.phone}</p>
							</div>
							<div class="col-sm-6">
								<h5>Thông tin giao hàng</h5>
								<p>${transaction.traddress}</p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<h5>Thông tin hóa đơn</h5>
								<p>
									Mã đơn hàng: ${transaction.id}
								</p>
								<p>
									Thời gian đặt hàng: ${transaction.createdat}
								</p>
							</div>
							<div class="col-sm-6">
								<h5>Phương thức thanh toán</h5>
								<p>Thanh toán khi nhận hàng</p>
							</div>
						</div>

					</div>
					<div class="col-md-5">
						<div class="card">
							<ul class="list-group list-group-flush">
								<li class="list-group-item">
									<strong>Đơn hàng ${transaction.id}</strong>
								</li>
								<li class="list-group-item">
									<table class="product-table">
										<tbody>
											<c:forEach var="order" items="${transaction.ordersById}">
												<tr class="product">
													<td class="product_image">
														<div class="product-thumbnail">
															<div class="product-thumbnail_wrapper">
																<img src="<c:url value='/public/images/${order.productsByOrproductid.proavatar}'/>"
																	 alt="${order.productsByOrproductid.proslug}" class="product-thumbnail_image">
															</div>
															<span
																	class="product-thumbnail_quantity unprintable">${order.orqty}
															</span>
														</div>
													</td>
													<th class="product_description">
                                                    <span class="product_description_name">
															${order.productsByOrproductid.proname}
													</span>
													</th>
													<td class="product_price text-center">
														<fmt:formatNumber
																value="${order.productsByOrproductid.proprice*order.orqty}"
																type="currency"/>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</li>
								<li class="list-group-item">
									<div class="row">
										<div class="col-sm-6">
											<h6>Tổng cộng: </h6>
										</div>
										<div class="col-sm-6 text-right ">
											<h4><fmt:formatNumber
													value="${transaction.trtotal}"
													type="currency"/></h4>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div class="text-center">
				<a href="${pageContext.request.contextPath}/home" class="btn btn-success">Tiếp tục mua hàng</a>
			</div>


		</div>

	</body>

	<footer>
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
				integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
				crossorigin="anonymous">
		</script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
				integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
				crossorigin="anonymous">
		</script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
				integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
				crossorigin="anonymous">
		</script>
	</footer>

</html>

<%@ page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="transaction" scope="request" class="entity.Transactions"/>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Document</title>
	</head>
	<body>
		<div style="font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;line-height:14pt;padding:20px 0;font-size:14px;max-width:580px;margin:0 auto">
			<div class="adM">
			</div>
			<div style="padding:0 10px;margin-bottom:25px">
				<div class="adM">
				</div>
				<p>Hello ${transaction.usersByTruserid.name}</p>
				<p>Cảm ơn Anh/chị đã đặt hàng tại <strong>PConline - Group 9</strong>!</p>
				<p>Đơn hàng của Anh/chị đã được tiếp nhận, chúng tôi sẽ nhanh chóng liên hệ với Anh/chị.</p>
			</div>
			<hr>
			<div style="padding:0 10px">

				<table style="width:100%;border-collapse:collapse;margin-top:20px">
					<thead>
						<tr>
							<th style="text-align:left;width:50%;font-size:medium;padding:5px 0">Thông tin mua hàng</th>
							<th style="text-align:left;width:50%;font-size:medium;padding:5px 0">Địa chỉ nhận hàng</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="padding-right:15px">
								<table style="width:100%">
									<tbody>
										<tr>
											<td>${transaction.usersByTruserid.name}</td>
										</tr>
										<tr>
											<td style="word-break:break-word;word-wrap:break-word">
												<a href="mailto:${transaction.usersByTruserid.email}"
												   target="_blank">${transaction.usersByTruserid.email}</a>
											</td>
										</tr>
										<tr>
											${transaction.usersByTruserid.phone}
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<table style="width:100%">
									<tbody>
										<tr>
											<td style="word-break:break-word;word-wrap:break-word">
												${transaction.traddress}
											</td>
										</tr>

									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>

			</div>
			<div style="margin-top:20px;padding:0 10px">
				<div style="padding-top:10px;font-size:medium"><strong>Order Information</strong></div>
				<table style="width:100%;margin:10px 0">
					<tbody>
						<tr>
							<td style="width:50%;padding-right:15px">Order ID: ${transaction.id}</td>
							<td style="width:50%">Date: ${transaction.createdat}</td>
						</tr>
					</tbody>
				</table>
				<ul style="padding-left:0;list-style-type:none;margin-bottom:0">
					<c:forEach var="order" items="${transaction.ordersById}">
						<li>
							<table style="width:100%;border-bottom:1px solid #e4e9eb">
								<tbody>
									<tr>
										<td style="width:100%;padding:25px 10px 0 0" colspan="2">
											<div style="float:left;width:80px;height:80px;border:1px solid #ebeff2;overflow:hidden">
												<img style="max-width:100%;max-height:100%"
													 src="http://localhost:8080/public/images/${order.productsByOrproductid.proavatar}"
													 class="CToWUd" alt="">
											</div>
											<div style="margin-left:100px">
												<a href="" style="color:#357ebd;text-decoration:none" target="_blank">${order.productsByOrproductid.proname}</a>
											</div>
										</td>
									</tr>
									<tr>
										<td style="width:70%;padding:5px 0 25px">
											<div style="margin-left:100px">
												<fmt:formatNumber value="${order.productsByOrproductid.proprice}" type="currency"/>
												<span style="margin-left:20px">x${order.orqty}</span>
											</div>
										</td>
										<td style="text-align:right;width:30%;padding:5px 0 25px">
											<fmt:formatNumber value="${order.orprice}" type="currency"/>
										</td>
									</tr>
								</tbody>
							</table>
						</li>
					</c:forEach>
				</ul>
				<table style="width:100%;border-collapse:collapse;margin-bottom:50px;margin-top:10px">
					<tbody>
						<tr>
							<td style="width:20%"></td>
							<td style="width:80%">
								<table style="width:100%;float:right">
									<tbody>
										<tr>
											<td style="padding-bottom:10px">Discount:</td>
											<td style="font-weight:bold;text-align:right;padding-bottom:10px">
												<fmt:formatNumber value="0" type="currency"/>
											</td>
										</tr>
										<tr>
											<td style="padding-bottom:10px">Price after discount:</td>
											<td style="font-weight:bold;text-align:right;padding-bottom:10px">
												<fmt:formatNumber value="${transaction.trtotal}" type="currency"/>
											</td>
										</tr>
										<tr>
											<td style="padding-bottom:10px">Delivery fee:</td>
											<td style="font-weight:bold;text-align:right;padding-bottom:10px">
												<fmt:formatNumber value="0" type="currency"/>
											</td>
										</tr>
										<tr style="border-top:1px solid #e5e9ec">
											<td style="padding-top:10px">Total</td>
											<td style="font-weight:bold;text-align:right;font-size:16px;padding-top:10px">
												<fmt:formatNumber value="${transaction.trtotal}" type="currency"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="clear:both"></div>

			<div style="padding:0 10px">

			</div>

			<div style="clear:both"></div>
			<div style="padding:0 10px">

				<p style="height:50px">
					<span style="float:left;margin-top:14px;margin-right:10px">Để kiểm tra trạng thái đơn hàng, Anh/chị vuilòng:</span>
					<span style="margin-top:25px;float:left"><span style="padding:14px 35px;background:#357ebd">
			<a href="" style="font-size:16px;text-decoration:none;color:#fff" target="_blank" data-saferedirecturl="">Đăng nhập vào tài khoản</a>
			</span></span>
				</p>

				<div style="clear:both"></div>
				<p style="margin:30px 0">
					Nếu Anh/chị có bất kỳ câu hỏi nào, xin liên hệ với chúng tôi tại:
					<a href="mailto:16110180@student.hcmute.edu.vn" style="color:#357ebd" target="_blank">16110180@student.hcmute.edu.vn</a>
				</p>
				<p style="text-align:right"><i>Best regard,</i></p>
				<p style="text-align:right"><strong>Ban quản trị cửa hàng PConline - Group 9</strong></p>
			</div>
		</div>
	</body>
</html>



<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
<jsp:useBean id="orders" scope="request" type="java.util.List<entity.Orders>"/>--%>
<form enctype="multipart/form-data" action="<c:url value='${action}'/>"
	  method="post">
	<div class="modal-body">
		<table id="dataTable" class="table table-striped projects">
			<thead>
				<tr>
					<th style="width: 5%">STT</th>
					<th style="width: 20%">Ảnh sản phẩm</th>
					<th class="product-name" >Tên sản phẩm</th>
					<th class="text-center" style="width: 10%">Đơn giá</th>
					<th class="text-center" style="width: 10%">Số lượng</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="order" varStatus="status" items="${orders}">
					<tr>
						<td>${status.count}</td>
						<td>
							<div style="width: 150px; height: 150px">
								<img class="img img-thumbnail mx-auto d-block"
									 style="width: auto; height: auto; max-width: 100%; max-height: 100%"
									 src="<c:url value='/public/images/${order.productsByOrproductid.proavatar}'/>"
									 alt="${order.productsByOrproductid.proslug}">
							</div>
						</td>
						<td class="">
							<c:out value = "${order.productsByOrproductid.proname}"/>
						</td>
						<td class="text-center">
							<fmt:formatNumber value="${order.productsByOrproductid.proprice}" type="currency"/>
						</td>
						<td class="text-center">
							<c:out value = "${order.orqty}"/>
						</td>

					</tr>
				</c:forEach>
			</tbody>

		</table>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	</div>
</form>
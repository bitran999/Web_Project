<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
<jsp:useBean id="orders" scope="request" type="java.util.List<entity.Orders>"/>--%>
<form enctype="multipart/form-data" action="<c:url value='${action}'/>"
	  method="post">
	<div class="modal-body">
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label for="trUserName">Tên Khách Hàng</label>
					<input type="text" class="form-control form-control-border modal-cName"
						   id="trUserName"
						   name="trUserName" placeholder="Tên khách hàng" required
						   value="${transaction.usersByTruserid.name}" readonly>
				</div>
				<div class="form-group">
					<label for="trAddress">Địa chỉ</label>
					<input type="text" class="form-control form-control-border modal-cName"
						   id="trAddress"
						   name="trAddress" placeholder="Địa chỉ" required value="${transaction.traddress}">
				</div>
				<div class="form-group">
					<label>Trạng thái đơn</label>
					<div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="trStatus" id="inlineRadio1"
								   value="0" ${transaction.trstatus==0?"checked":""}>
							<label class="form-check-label" for="inlineRadio1">Đang chờ</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="trStatus" id="inlineRadio2"
								   value="1" ${transaction.trstatus==1?"checked":""}>
							<label class="form-check-label" for="inlineRadio2">Đang giao hàng</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="trStatus" id="inlineRadio3"
								   value="2" ${transaction.trstatus==2?"checked":""}>
							<label class="form-check-label" for="inlineRadio3">Đã hoàn thành</label>
						</div>
					</div>

				</div>

			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="trUserMail">Email</label>
					<input type="text" class="form-control form-control-border modal-cName"
						   id="trUserMail"
						   name="trUserMail" placeholder="Tên khách hàng" required
						   value="${transaction.usersByTruserid.email}" readonly>
				</div>
				<div class="form-group">
					<label for="trPhone">Số điện thoại</label>
					<input type="text" class="form-control form-control-border modal-cName"
						   id="trPhone"
						   name="trPhone" placeholder="Số điện thoại liên lạc" required value="${transaction.trphone}">
				</div>
			</div>

		</div>
		<!-- /.row -->
		<table id="dataTable" class="table table-striped projects">
			<thead>
				<tr>
					<th style="width: 5%">ID</th>
					<th style="width: 20%">Ảnh sản phẩm</th>
					<th class="" style="width: 10%">Tên sản phẩm</th>
					<th class="text-center" style="width: 10%">Đơn giá</th>
					<th class="text-center" style="width: 10%">Số lượng</th>
					<th class="text-center" style="width: 10%">Thao Tác</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="order" items="${orders}">
					<tr>
						<td>${order.id}</td>
						<td>
							<div style="width: 100px; height: 100px">
								<img class="img img-thumbnail mx-auto d-block"
									 style="width: auto; height: auto; max-width: 100%; max-height: 100%"
									 src="<c:url value='/public/images/${order.productsByOrproductid.proavatar}'/>"
									 alt="${order.productsByOrproductid.proslug}">
							</div>
						</td>
						<td class="">
							<c:out value="${order.productsByOrproductid.proname}"/>
						</td>
						<td class="text-center">
							<fmt:formatNumber value="${order.productsByOrproductid.proprice}" type="currency"/>
						</td>
						<td class="text-center">
							<c:out value="${order.orqty}"/>
						</td>
						<td class="text-center">
							<form action="<c:url value = "/admin/order/delete?id=${order.id}"/>"
								  method="post" id="${order.id}-del" hidden>
							</form>
							<button class="btn btn-outline-danger"
									onclick="document.getElementById('${order.id}-del').submit();">
								<i class="fa fa-trash" aria-hidden="true"></i>
							</button>

						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="3" class="text-center">Tổng giá trị đơn hàng:</th>
					<th colspan="3" class="text-center"><fmt:formatNumber value="${transaction.trtotal}" type="currency"/></th>
				</tr>
			</tfoot>
		</table>
	</div>
	<div class="modal-footer">
		<input type="text" class="currentURI" name="currentURI" id="currentURI" value="${currentURI}" hidden>
		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		<button type="submit" class="btn btn-primary">Submit</button>
	</div>
</form>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<mt:admin_template tittle="${requestScope.accName}">
	<jsp:body>
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>${requestScope.accName}</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Home</a></li>
							<li class="breadcrumb-item active">Account ${requestScope.accName}</li>
						</ol>
					</div>
				</div>
			</div><!-- /.container-fluid -->
		</section>
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<!-- /.card -->
						<div class="card">
							<div class="card-header">
								<h2 class="card-title"></h2>
								<%--<button type="button" class="btn btn-outline-success float-right"
										data-toggle="modal"
										data-target="#formModal"
										data-id=""
										data-cname=""
										data-chome="0"
										data-cactive="0">Thêm mới
								</button>--%>
							</div>
							<!-- /.card-header -->
							<c:choose>

								<c:when test="${accounts.size() == 0}">
									<div class="card-body">
										<p class="card-text">Không có dữ liệu.</p>
									</div>
								</c:when>
								<c:otherwise>
									<div class="card-body">
										<table id="dataTable" class="table table-striped projects">
											<thead>
												<tr>
													<th style="width: 5%">ID</th>
													<th style="width: 20%">Họ và tên</th>
													<th style="width: 40%">Email đăng nhập</th>
													<th class="" style="width: 20%">Ngày khởi tạo</th>
													<th class="text-center" style="width: 10%">Thao Tác</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="a" items="${accounts}">
													<tr>
														<td>${a.id}</td>
														<td>${a.name}</td>
														<td>${a.email}</td>
														<td>${a.createdAt}</td>
														<td class="text-center">
															<form action="${pageContext.request.contextPath}/admin/account/${requestScope.accName}/delete?id=${a.id}"
																  method="post" id="${a.id}-del" hidden>
															</form>
															<%--<button class="btn btn-outline-success btnSelect"
																	data-toggle="modal"
																	data-target="#formModal"
																	data-id="${c.id}"
																	data-cname="${c.cname}"
																	data-chome="${c.chome }"
																	data-cactive="${c.cactive}">
																<i class="fa fa-pen" aria-hidden="true"></i>
															</button>--%>
															<button class="btn btn-outline-danger"
																	onclick="document.getElementById('${a.id}-del').submit();">
																<i class="fa fa-trash" aria-hidden="true"></i>
															</button>

														</td>
													</tr>
												</c:forEach>
											</tbody>
											<tfoot>
												<tr>
													<th>ID</th>
													<th>Tên Danh Mục</th>
													<th class="text-center">HomePage</th>
													<th class="text-center">Status</th>
													<th class="text-center">Thao Tác</th>
												</tr>
											</tfoot>
										</table>
									</div>
								</c:otherwise>
							</c:choose>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</section>

		<%--Form Model--%>
		<div class="modal fade" id="formModal" tabindex="-1" role="dialog" aria-labelledby="formModalLabel"
			 aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="formModalLabel">New Category</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div id="formData">
						<%@include file="/views/Admin/account/form.jsp"%>
					</div>
				</div>
			</div>
		</div>

		<script>
            $('#formModal').on('show.bs.modal', function (event) {        // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
                var button = $(event.relatedTarget)
                var id = button.data('id');
                var url = "";
                var modal = $(this);
                var modalTittle = modal.find('.modal-title');
                var modalcName = modal.find(' .modal-body .modal-cName');
                var modalcHome = modal.find(' .modal-body .modal-cHome');
                var modalcActive = modal.find(' .modal-body .modal-cActive');
                var modalForm = modal.find('.modal-content form');
                if (id !== "") {
                    url = "${pageContext.request.contextPath}/admin/category/update?id=" + id;
                    $.get(url, function (responseXml) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
                        $('#formData').html(responseXml);
                        modalTittle.text('Edit Category ID: ' + id);
                    });
                } else if (id === "") {
                    url = "${pageContext.request.contextPath}/admin/category/add";
                    $.get(url, function (responseXml) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
                        $('#formData').html(responseXml);
                        modalTittle.text('New Category');
                        $('#imgPreview').attr("src", "${pageContext.request.contextPath}/public/images/noimg.jpg");
                    });
                }

            });

            /*$('#formModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget) 	// Button that triggered the modal
                var id = button.data('id'); 			// Extract info from data-* attributes
                var cName = button.data('cname'); 		// Extract info from data-* attributes
                var cHome = button.data('chome'); 		// Extract info from data-* attributes
                var cActive = button.data('cactive'); 	// Extract info from data-* attributes

                //alert(data);

                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                var modal = $(this)
                var modalTittle = modal.find('.modal-title');
                var modalcName = modal.find(' .modal-body .modal-cName');
                var modalcHome = modal.find(' .modal-body .modal-cHome');
                var modalcActive = modal.find(' .modal-body .modal-cActive');
                var modalForm = modal.find('.modal-content form');
                var action = "";
                //alert(action);
                if (id !== "") {
                    action = "${pageContext.request.contextPath}/admin/category/update?id=" + id;
                } else {
                    action = "${pageContext.request.contextPath}/admin/category/add";
                }
                modalTittle.text(id === "" ? 'Create Category' : 'Edit Category ID: ' + id);
                modalcName.val(cName);
                if (cHome !== 0) {
                    modalcHome.prop('checked', true);
                } else modalcHome.prop('checked', false);
                if (cActive !== 0) {
                    modalcActive.prop('checked', true);
                } else modalcActive.prop('checked', false);
                modalForm.attr("action", action);
                /!*alert( modal.find('.modal-content form').attr("action"));*!/

                /!*modal.find('.modal-body input').val(recipient)*!/
            })*/
		</script>
	</jsp:body>
</mt:admin_template>

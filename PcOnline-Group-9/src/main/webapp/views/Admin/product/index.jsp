<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="products" scope="request" type="java.util.List<entity.Products>"/>
<jsp:useBean id="categories" scope="request" type="java.util.List<entity.Categories>"/>

<mt:admin_template tittle="Product">
	<jsp:body>
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1></h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Home</a></li>
							<li class="breadcrumb-item active">Product</li>
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
								<%--<input type="file" accept="image/*">--%>
								<h2 class="card-title" style="font-size: 2.0rem"></h2>
								<button type="button" class="btn btn-outline-success float-right"
										data-toggle="modal"
										data-target="#formModal"
										data-id=""
										data-cactive="0">Thêm mới
								</button>
							</div>
							<!-- /.card-header -->
							<c:choose>
								<c:when test="${categories.size() == 0}">
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
													<th style="width: 15%">Avatar</th>
													<th style="width: 50%">Tên sản phẩm</th>
													<th class="text-center" style="width: 10%">Số lượng</th>
													<th class="text-center" style="width: 10%">Status</th>
													<th class="text-center" style="width: 10%">Thao Tác</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="p" items="${products}">
													<tr>
														<td>${p.id}</td>
														<td>
															<div style="width: 150px; height: 150px">
																<img class="img img-thumbnail mx-auto d-block"
																	 style="width: auto; height: auto; max-width: 100%; max-height: 100%"
																	 src="<c:url value='/public/images/${p.proavatar}'/>"
																	 alt="${p.proslug}">
															</div>
														</td>
														<td>${p.proname}</td>
														<td class="text-center">${p.pronumber}</td>
														<td class="text-center">
																${p.proactive == 1 ? '<a style="font-size: 14px" class="badge badge-success" data-value="1"> Active </a>' :
																		'<a style="font-size: 14px" class="badge badge-danger" data-value="1"> Nope </a>'}
														</td>
														<td class="text-center">
															<form action="<c:url value='/admin/product/delete?id=${p.id}'/>"
																  method="post" id="${p.id}-del" hidden>
															</form>
															<button class="btn btn-outline-success btnSelect"
																	data-toggle="modal"
																	data-target="#formModal"
																	data-id="${p.id}">
																<i class="fa fa-pen" aria-hidden="true"></i>
															</button>
															<button class="btn btn-outline-danger"
																	onclick="document.getElementById('${p.id}-del').submit();">
																<i class="fa fa-trash" aria-hidden="true"></i>
															</button>

														</td>
													</tr>
												</c:forEach>
											</tbody>
											<tfoot>
												<tr>
													<th style="width: 5%">ID</th>
													<th style="width: 15%">Avatar</th>
													<th style="width: 50%">Tên sản phẩm</th>
													<th class="text-center" style="width: 10%">Số lượng</th>
													<th class="text-center" style="width: 10%">Status</th>
													<th class="text-center" style="width: 10%">Thao Tác</th>
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
			<div class="modal-dialog modal-xl rounded" role="document">
				<div class="modal-content">
					<div class="modal-header bg-gradient-primary">
						<h5 class="modal-title" id="formModalLabel">New Product</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div id="formData">
						<%@include file="/views/Admin/product/form.jsp"%>
					</div>

				</div>
			</div>
		</div>



		<script>

            /*$('#dataTable').on('click', '.btnSelect', function () {
                // get the current row
                var currentRow = $(this).closest("tr");

                var id = currentRow.find("td:eq(0)").text(); // get current row 1st TD value
                var cName = currentRow.find("td:eq(1)").text(); // get current row 2nd TD
                var cHome = currentRow.find("td:eq(2)").find("a").data('value'); // get current row 3rd TD
                var cActive = currentRow.find("td:eq(3)").find("a").data('value'); // get current row 3rd TD
                var data = id + "\n" + cName + "\n" + cHome + "\n" + cActive;

                alert(data);

            });*/
            $("input[type=file]").on("change", function () {
                var $files = $(this).get(0).files

                if ($files.length) {
                    if ($files[0].size > $(this).data("max-size") * 1024) {
                        console.log("Vui lòng chọn file có dung lượng nhỏ hơn!")
                        return false
                    }

                    console.log("Đang upload hình ảnh lên imgur...")

                    var apiUrl = "https://api.imgur.com/3/image"
                    var apiKey = "8f2645e187b4235"

                    var settings = {
                        async: false,
                        crossDomain: true,
                        processData: false,
                        contentType: false,
                        type: "POST",
                        url: apiUrl,
                        headers: {
                            Authorization: "Client-ID " + apiKey,
                            Accept: "application/json",
                        },
                        mimeType: "multipart/form-data",
                    }

                    var formData = new FormData()
                    formData.append("image", $files[0])
                    settings.data = formData

                    $.ajax(settings).done(function (response) {
                        console.log(response)
                    })
                }
            });

            $('#formModal').on('show.bs.modal', function (event) {        // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
                var button = $(event.relatedTarget)
                var id = button.data('id');
                var url = "";
                var modal = $(this);
                var modalTittle = modal.find('.modal-title');
                var modalForm = modal.find('.modal-content form');
                if (id !== "") {
                    url = "${pageContext.request.contextPath}/admin/product/update?id=" + id;
                    $.get(url, function (responseXml) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
                        $('#formData').html(responseXml);
                        modalTittle.text('Edit Product ID: ' + id);
                        CKEDITOR.replace('proContent');
                        modalForm.attr("action", url);
                    });

                } else if (id === "") {
                    url = "${pageContext.request.contextPath}/admin/product/add";
                    $.get(url, function (responseXml) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
                        $('#formData').html(responseXml);
                        modalTittle.text('New Product');
                        CKEDITOR.replace('proContent');
                        $('#imgPreview').attr("src", "${pageContext.request.contextPath}/public/images/noimg.jpg");
                    });

                }
            });

		</script>
	</jsp:body>
</mt:admin_template>

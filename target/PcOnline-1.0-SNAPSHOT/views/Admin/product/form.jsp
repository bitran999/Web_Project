<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form enctype="multipart/form-data" action="<c:url value='${action}'/>"
	  method="post">
	<div class="modal-body">
		<div class="row">
			<!-- left column -->
			<div class="col-md-6">
				<div class="form-group">
					<label for="proName">Tên sản phẩm</label>
					<input type="text" class="form-control form-control-border modal-proName"
						   id="proName"
						   name="proName" placeholder="Tên sản phẩm" value="${product.proname}">
				</div>
				<div class="form-group">
					<label for="proDescription">Mô tả ngắn gọn (Dưới 250 từ)</label>
					<textarea class="form-control form-control-border modal-proDescription"
							  id="proDescription"
							  name="proDescription" rows="2" placeholder="Enter ..."
							  style="margin-top: 0; margin-bottom: 0; height: 40px;"
							  required>${product.prodescription}</textarea>
				</div>
				<div class="form-group">
					<label for="proCategoryId" class="form-label">Danh mục:</label>
					<select id="proCategoryId" name="proCategoryId"
							class="form-control form-control-border modal-proCategoryId">
						<c:choose>
							<c:when test="${product == null}">
								<option value="" required>--Chọn loại sản phẩm--</option>
							</c:when>
							<c:otherwise>
								<option value="${product.categoriesByProcategoryid.id}">${product.categoriesByProcategoryid.cname}</option>
							</c:otherwise>
						</c:choose>
						<c:forEach var="c" items="${categories}">
							<option value="${c.id}" required>${c.cname}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="proPrice" class="form-label">Đơn giá:</label>
					<input type="number" name="proPrice"
						   class="form-control form-control-border modal-proPrice"
						   placeholder="Đơn giá" id="proPrice" min="0"
						   value="${product.proprice}" required>
				</div>

				<div class="form-group">
					<label for="proSale" class="form-label">% Khuyến mãi:</label>
					<input type="number" name="proSale"
						   class="form-control form-control-border modal-proSale"
						   placeholder="% giảm giá" id="proSale" min="0" max="90"
						   value="${product.prosale}" required>
				</div>

				<div class="row">
					<div class="form-group col-md-6">
						<div class="custom-control custom-switch">
							<input type="checkbox" class="custom-control-input modal-proActive"
								   id="proActive"
								   value="1"
								   name="proActive" ${product.proactive == 1 ? 'checked' : ''} >
							<label class="custom-control-label" for="proActive">Active</label>
						</div>
					</div>
					<div class="form-group col-md-6">
						<div class="custom-control custom-switch">
							<input type="checkbox" class="custom-control-input modal-proHot"
								   id="proHot"
								   value="1" name="proHot" ${product.prohot == 1 ? 'checked' : ''} >
							<label class="custom-control-label" for="proHot">Hot Product</label>
						</div>
					</div>
				</div>
			</div>
			<!--/.col (left) -->
			<!-- right column -->
			<div class="col-md-6">
				<div class="form-group">
					<label for="proNumber" class="form-label">Số lượng sản phẩm:</label>
					<input type="number" name="proNumber"
						   class="form-control form-control-border modal-proNumber"
						   placeholder="Số lượng" id="proNumber" min="0"
						   value="${product.pronumber}" required>
				</div>

				<div class="form-group text-center">
					<div class="kv-avatar">
						<div class="file-loading">
							<input id="proAvatar" name="proAvatar" type="file"
								   class="modal-proAvatar" >
						</div>
					</div>
					<div class="kv-avatar-hint">
						<small>Select file < 5000 KB</small>
					</div>
				</div>
			</div>
			<!--/.col (right) -->
		</div>
		<!-- /.row -->
		<div class="form-group">
			<label for="proContent">Mô tả chi tiết</label>
			<textarea class="form-control form-control-border modal-proContent"
					  id="proContent"
					  name="proContent" rows="3" placeholder="Enter ..."
					  style="margin-top: 0; margin-bottom: 0; height: 83px;" required>
				${product.procontent}
			</textarea>
		</div>

	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		<button type="submit" class="btn btn-primary">Submit</button>
	</div>
</form>
<script>
    var btnCust = '<button type="button" class="btn btn-secondary" title="Add picture tags" ' +
        'onclick="alert(\'Call your custom code here.\')">' +
        '<i class="bi-tag"></i>' +
        '</button>';
    $("#proAvatar").fileinput({
        overwriteInitial: true,
        maxFileSize: 5000,
        showClose: false,
        showCaption: false,
        browseLabel: '',
        removeLabel: '',
        browseIcon: '<i class="bi-folder2-open"></i>',
        removeIcon: '<i class="bi-x-lg"></i>',
        removeTitle: 'Cancel or reset changes',
        elErrorContainer: '#kv-avatar-errors-1',
        msgErrorClass: 'alert alert-block alert-danger',
        defaultPreviewContent:
            '<div class="kv-file-content">' +
            '<img id="imgPreview" style="width:100%; heigh:100%" src="<c:url value='/public/images/${product.proavatar}'/>" alt="Ảnh sản phẩm">' +
            '</div>',
        layoutTemplates: {main2: '{preview} ' + btnCust + ' {remove} {browse}'},
        allowedFileExtensions: ["jpg", "png", "gif"]
    });


</script>


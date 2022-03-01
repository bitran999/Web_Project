<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form enctype="multipart/form-data" action="<c:url value='${action}'/>"
	  method="post">
	<div class="modal-body">
		<div class="form-group">
			<label for="cName">Tên danh mục</label>
			<input type="text" class="form-control form-control-border modal-cName"
				   id="cName"
				   name="cName" placeholder="Tên danh mục" required value="${category.cname}">
		</div>

		<div class="row">
			<div class="form-group col-md-6">
				<div class="custom-control custom-switch">
					<input type="checkbox" class="custom-control-input modal-cHome"
						   id="cHome"
						   value="1" name="cHome" ${category.chome == 1 ? 'checked' : ''}>
					<label class="custom-control-label" for="cHome" readonly>Home</label>
				</div>
			</div>
			<div class="form-group col-md-6">
				<div class="custom-control custom-switch">
					<input type="checkbox" class="custom-control-input modal-cActive"
						   id="cActive"
						   value="1" name="cActive" ${category.cactive == 1 ? 'checked' : ''}>
					<label class="custom-control-label" for="cActive" readonly>Active</label>
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		<button type="submit" class="btn btn-primary">Submit</button>
	</div>
</form>
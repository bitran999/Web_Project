<%@ tag language="java" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ attribute name="tittle" required="true" type="java.lang.String" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="content" fragment="true" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>${tittle}</title>
		<%@include file="/views/Admin/components/css.jsp" %>
	</head>

	<body class="hold-transition sidebar-mini layout-fixed">
		<div class="wrapper">
			<!-- Preloader -->
			<%--<div class="preloader flex-column justify-content-center align-items-center">
				<img class="animation__shake" src="${pageContext.request.contextPath}/assets/admin/dist/img/AdminLTELogo.png"
					 alt="AdminLTELogo" height="60" width="60">
			</div>--%>

			<!-- Navbar -->
			<%@include file="/views/Admin/components/navbar.jsp" %>
			<!-- /.navbar -->
			<!-- Main Sidebar Container -->
			<%@include file="/views/Admin/components/sidebar.jsp" %>

			<%--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--%>
			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">

				<jsp:doBody/>

			</div>

			<%--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--%>
			<!-- Control Sidebar -->
			<aside class="control-sidebar control-sidebar-dark">
				<!-- Control sidebar content goes here -->
			</aside>
			<!-- /.control-sidebar -->
		</div>
		<!-- ./wrapper -->
	</body>

	<footer>

		<%@include file="/views/Admin/components/js.jsp" %>
	</footer>
</html>


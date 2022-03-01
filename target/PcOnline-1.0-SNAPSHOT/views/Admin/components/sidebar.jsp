<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="/admin" class="brand-link">
		<img src="${pageContext.request.contextPath}/assets/admin/dist/img/AdminLTELogo.png"
		     alt="AdminLTE Logo"
		     class="brand-image img-circle elevation-3" style="opacity: .8">
		<span class="brand-text font-weight-light">AdminLTE 3 </span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar user panel (optional) -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="image">
				<img src="${pageContext.request.contextPath}/assets/admin/dist/img/user2-160x160.jpg"
				     class="img-circle elevation-2" alt="User Image">
			</div>
			<div class="info">
				<a href="#" class="d-block" methods="post">Alexander Pierce</a>
			</div>
		</div>
		<!-- SidebarSearch Form -->
		<div class="form-inline">
			<div class="input-group" data-widget="sidebar-search">
				<input class="form-control form-control-sidebar" type="search" placeholder="Search"
				       aria-label="Search">
				<div class="input-group-append">
					<button class="btn btn-sidebar">
						<i class="fas fa-search fa-fw"></i>
					</button>
				</div>
			</div>
		</div>

		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<c:set var="url" value="${pageContext.request.getAttribute('javax.servlet.forward.request_uri')}"/>
			<c:choose>
				<c:when test="${url == '/admin'}"><c:set var="DashActive" value="active"/></c:when>
				<c:when test="${url == '/admin/category/index'}">
					<c:set var="CatOpen" value="menu-is-opening menu-open active"/>
					<c:set var="CatIndex" value="active"/>
				</c:when>
				<c:when test="${url == '/admin/category/add'}">
					<c:set var="CatOpen" value="menu-is-opening menu-open active"/>
					<c:set var="CatAdd" value="active"/>
				</c:when>
			</c:choose>
			<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
			    data-accordion="false">
				<!-- Add icons to the links using the .nav-icon class
					 with font-awesome or any other icon font library -->
				<li class="nav-item">
					<a href="${pageContext.request.contextPath}/admin" class="nav-link <c:out value="${DashActive}"/>">
						<i class="nav-icon fas fa-tachometer-alt"></i>
						<p>
							Dashboard
						</p>
					</a>
				</li>

				<%--Category--%>
				<li class="nav-item">
					<a href="${pageContext.request.contextPath}/admin/category" class="nav-link ${catActive}">
						<i class="nav-icon far fa-image"></i>
						<p>
							Category
						</p>
					</a>
				</li>
				<%--Product--%>
				<li class="nav-item">
					<a href="${pageContext.request.contextPath}/admin/product" class="nav-link ${proActive}">
						<i class="nav-icon fas fa-columns"></i>
						<p>
							Product
						</p>
					</a>
				</li>

				<%--Transaction--%>
				<li class="nav-item">
					<a href="${pageContext.request.contextPath}/admin/transaction" class="nav-link ${tranActive}">
						<i class="nav-icon fas fa-columns"></i>
						<p>
							Transaction
						</p>
					</a>
				</li>

				<%--Account--%>
				<li class="nav-item  ${accMenu}">
					<a href="#" class="nav-link" >
						<i class="nav-icon far fa-envelope"></i>
						<p>
							Account
							<i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="${pageContext.request.contextPath}/admin/account/admin" class="nav-link ${adminActive}" >
								<i class="far fa-circle nav-icon"></i>
								<p>Admin</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="${pageContext.request.contextPath}/admin/account/guest" class="nav-link ${guestActive}" >
								<i class="far fa-circle nav-icon"></i>
								<p>Guest</p>
							</a>
						</li>
					</ul>
				</li>
			</ul>
		</nav>
		<!-- /.sidebar-menu -->

		<div class="form-inline text-center">
			<form id="logoutForm" method="post" action="${pageContext.request.contextPath}/admin/login?command=logout" hidden></form>
			<a onclick="document.getElementById('logoutForm').submit();" id="adminLogout" class="btn btn-block btn-secondary nav-link">Log Out</a>
		</div>
	</div>
	<!-- /.sidebar -->
</aside>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<mt:guest_template tittle="Login">
	<jsp:body>
		<div class="breadcrumb-area">
			<div class="container">
				<div class="breadcrumb-content">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li class="active">Register</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- Li's Breadcrumb Area End Here -->
		<!-- Begin Login Content Area -->
		<div class="page-section mb-60">
			<div class="container">
				<div class="row" style="justify-content: center">

					<div class="col-sm-12 col-md-12 col-lg-8 col-xs-12">
						<form action="${pageContext.request.contextPath}/home/register" method="post">
							<div class="login-form">
								<h4 class="login-title">Register</h4>
								<div class="row">
									<div class="col-md-6 col-12 mb-20">
										<label>First Name*</label>
										<input class="mb-0" type="text" name="firstName" placeholder="First Name" required>
									</div>
									<div class="col-md-6 col-12 mb-20">
										<label>Last Name*</label>
										<input class="mb-0" type="text" name="lastName" placeholder="Last Name" required>
									</div>

									<div class="col-md-6 mb-20">
										<label>Password*</label>
										<input class="mb-0" type="password" name="pass" placeholder="Password" required>
									</div>
									<div class="col-md-6 mb-20">
										<label>Confirm Password*</label>
										<input class="mb-0" type="password" name="rePass" placeholder="Confirm Password" required>
									</div>
									<div class="col-md-6 mb-20">
										<label>Email Address*</label>
										<input class="mb-0" type="email" name="email" placeholder="Email Address" required>
									</div>
									<div class="col-md-6 mb-20">
										<label>Phone</label>
										<input class="mb-0" type="text" name="phone" placeholder="Enter Phone Number">
									</div>
									<div class="col-md-12 mb-20">
										<label>Address</label>
										<textarea class="mb-0" name="address" rows="3" placeholder="Enter Address"></textarea>
									</div>
									<p class="login-box-msg text-center" style="margin-left: 16px;color: red; ">${LoginMess}</p>
									<div class="col-12" style="display: flex; align-items: center">
										<button class="register-button mt-0 mr-5">Register</button>
										<a href="<c:url value = "/home/login/"/>" class="ml-10 mt-5"> Already have account ? Login now</a>
									</div>
								</div>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
		<!-- Login Content Area End Here -->
	</jsp:body>
</mt:guest_template>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<mt:guest_template tittle="Shopping Cart">
	<jsp:body>
		<!-- Begin Li's Breadcrumb Area -->
		<div class="breadcrumb-area">
			<div class="container">
				<div class="breadcrumb-content">
					<ul>
						<li><a href="${pageContext.request.contextPath}/home">Home</a></li>
						<li class="active">Shopping Cart</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- Li's Breadcrumb Area End Here -->
		<!--Shopping Cart Area Strat-->
		<div class="Shopping-cart-area pt-60 pb-60">
			<div class="container" id="formCart">
				<%@include file="/views/Guest/cart/cartcontainer.jsp" %>
			</div>
		</div>

		<!--Shopping Cart Area End-->



	</jsp:body>
</mt:guest_template>

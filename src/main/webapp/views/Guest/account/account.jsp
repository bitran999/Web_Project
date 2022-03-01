<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<mt:guest_template tittle="Account Infomation">
    <jsp:body>
        <div class="breadcrumb-area">
            <div class="container">
                <div class="breadcrumb-content">
                    <ul>
                        <li><a href="index.html">Home</a></li>
                        <li class="active">Account</li>
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
                        <form action="${pageContext.request.contextPath}/home/account" method="post">
                            <div class="login-form">
                                <h4 class="login-title">Account Infomation</h4>
                                <div class="row">
                                    <div class="col-md-6 col-12 mb-20">
                                        <label>Full Name</label>
                                        <input class="mb-0" type="text" name="FullName" required value="${sessionScope.user.name}" style="color: #333">
                                    </div>
                                    <div class="col-md-6 mb-20">
                                        <label>Password</label>
                                        <input
                                                class="mb-0"
                                                type="password"
                                                name="pass"
                                                readonly

                                                value="${sessionScope.user.password}"
                                        />
                                        <p id="ChangePass" style="margin-top: 10px; margin-bottom: 0; cursor: pointer">Change Password</p>
                                    </div>

                                    <div class="col-md-12" id="box-changePass" style="display: none; align-items: center">
                                        <div class="col-md-6 mb-20" style="padding-left: 0px; color: #333">
                                            <label>New Password</label>
                                            <input class="mb-0" type="password" name="newPass"  />
                                        </div>
                                        <div class="col-md-6 mb-20" style="padding-right: 0px; color: #333">
                                            <label>Retype New Password</label>
                                            <input class="mb-0" type="password" name="reNewPass"  />
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-20">
                                        <label>Email Address</label>
                                        <input class="mb-0" type="email" name="email" readonly value="${sessionScope.user.email}">
                                    </div>
                                    <div class="col-md-6 mb-20">
                                        <label>Phone</label>
                                        <input class="mb-0" type="text" name="phone" style="color: #333" value="${sessionScope.user.phone}">
                                    </div>
                                    <div class="col-md-12 mb-20">
                                        <label>Address</label>
                                        <textarea class="mb-0" name="address" rows="3" style="color: #333">${sessionScope.user.address}</textarea>
                                    </div>
                                    <p class="login-box-msg text-center" style="margin-left: 16px;color: red; ">${check}</p>
                                    <div class="col-12" style="display: flex; align-items: center">
                                        <button class="register-button mt-0 mr-5">Save</button>
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
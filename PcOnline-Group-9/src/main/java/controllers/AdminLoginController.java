package controllers;

import entity.Admins;
import models.AdminsModel;
import utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AdminLoginController", urlPatterns = {"/admin/login"})
public class AdminLoginController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rem = request.getParameter("remember");
        String action = request.getParameter("command");
        HttpSession session = request.getSession();

        Admins admin = get(email);
        switch (action) {
            case "login":
                if (admin == null) {
                    request.setAttribute("LoginMess", "Email doesn't exist");
                    ServletUtils.forward("/views/Admin/account/login.jsp", request, response);
                } else if (!AdminsModel.checkPass(password, admin.getPassword())) {
                    request.setAttribute("LoginMess", "Wrong password");
                    request.setAttribute("email", email);
                    ServletUtils.forward("/views/Admin/account/login.jsp", request, response);
                } else {
                    session.setAttribute("admin", admin);
                    Cookie aemail = new Cookie("email", email);
                    Cookie apassword = new Cookie("password", admin.getPassword());
                    if (rem != null) {
                        aemail.setMaxAge(30 * 24 * 60 * 60);
                        apassword.setMaxAge(30 * 24 * 60 * 60);
                    } else {
                        aemail.setMaxAge(0);
                        apassword.setMaxAge(0);
                    }
                    response.addCookie(aemail);
                    response.addCookie(apassword);
                    /*System.out.println("Login Successfully");
                    System.out.println(session.getAttribute("admin"));*/
                    ServletUtils.redirect("/admin", request, response);
                    //response.sendRedirect("/admin");
                }
                break;
            case "logout":
                session.setAttribute("admin", null);
                System.out.println("Log out Successfully");
                response.sendRedirect("/admin/login");
                break;
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("LoginMess", "Welcome back!!");
        request.getRequestDispatcher("/views/Admin/account/login.jsp").forward(request, response);
    }

    private Admins get(String email){
        Admins admin = null;
        try {
            admin = AdminsModel.getByEmail(email);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return admin;
    }
}

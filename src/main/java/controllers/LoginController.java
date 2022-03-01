package controllers;

import entity.Admins;
import entity.Categories;
import entity.GoogleEn;
import entity.Users;
import models.AdminsModel;
import models.TransactionsModel;
import models.UsersModel;
import org.mindrot.jbcrypt.BCrypt;
import utils.EmailUtil;
import utils.GoogleUtil;
import utils.ServletUtils;
import services.helper;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet(name = "LoginController", value = "/home/login/*")
public class LoginController extends FrontEndController {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rem = request.getParameter("remember");
        String preURI = (String) session.getAttribute("preURI");
        Timestamp timestamp = helper.getCurrentTimeStamp();

        Users user = getUserByEmail(email);
        String path = request.getPathInfo();
        switch (path) {
            case "/signin":
                if (user == null) {
                    request.setAttribute("loginMes", "Email doesn't exist");
                    ServletUtils.forward("/views/Guest/account/login.jsp", request, response);
                } else if (!UsersModel.checkPass(password, user.getPassword())) {
                    System.out.println(password);
                    request.setAttribute("loginMes", "Wrong password");
                    request.setAttribute("email", email);
                    ServletUtils.forward("/views/Guest/account/login.jsp", request, response);
                } else {
                    session.setAttribute("user", user);
                    Cookie aemail = new Cookie("email", email);
                    Cookie apassword = new Cookie("password", user.getPassword());
                    if (rem != null) {
                        aemail.setMaxAge(30 * 24 * 60 * 60);
                        apassword.setMaxAge(30 * 24 * 60 * 60);
                    } else {
                        aemail.setMaxAge(0);
                        apassword.setMaxAge(0);
                    }
                    response.addCookie(aemail);
                    response.addCookie(apassword);
                    System.out.println("Login Successfully");
                    session.setAttribute("user", user);


                    if(preURI != null) {
                        session.setAttribute("preURI", null);
                        ServletUtils.redirect(preURI, request, response);
                    } else ServletUtils.redirect("/home", request, response);
                }
                break;
            case "/signout":
                session.setAttribute("user", null);
                System.out.println("Log out Successfully");
                if(preURI != null) {
                    session.setAttribute("preURI", null);
                    ServletUtils.redirect(preURI, request, response);
                } else ServletUtils.redirect("/home", request, response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Categories> listc = getAllCate();
        HttpSession session = request.getSession();
        request.setAttribute("categories", listc);
        request.setAttribute("cart", session.getAttribute("cart"));
        request.setAttribute("LoginMess", "Welcome back!!");
        Timestamp timestamp = helper.getCurrentTimeStamp();
        String preURI = (String) session.getAttribute("preURI");
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/normal";
        }
        switch (path) {
            case "/normal":
                ServletUtils.forward("/views/Guest/account/login.jsp", request, response);
                break;
            case "/login-google":
                String code = request.getParameter("code");
                if (code == null || code.isEmpty()) {
                    request.setAttribute("wrongpass", "wrongpass");
                    ServletUtils.redirect("/home/login", request, response);
                } else {
                    String accessToken = GoogleUtil.getToken(code);
                    GoogleEn googleEn = GoogleUtil.getUserInfo(accessToken);

                    Users user = getUserByEmail(googleEn.getEmail());
                    if(user == null){
                        user = new Users();
                        user.setId(getNewUserId());
                        user.setEmail(googleEn.getEmail());
                        user.setPassword(helper.randString(10));
                        user.setName(googleEn.getName());
                        user.setAvatar(googleEn.getPicture());
                        user.setCreatedAt(timestamp);
                        UsersModel.create(user);
                    }else{
                        user.setEmail(googleEn.getEmail());
                        user.setName(googleEn.getName());
                        user.setAvatar(googleEn.getPicture());
                    }
                    user.setPassword(null);
                    session.setAttribute("user", user);

                    if(preURI != null) {
                        session.setAttribute("preURI", null);
                        ServletUtils.redirect(preURI, request, response);
                    } else ServletUtils.redirect("/home", request, response);
                }
                break;
            case "/signout":
                session.setAttribute("user", null);
                System.out.println("Log out Successfully");
                if(preURI != null) {
                    session.setAttribute("preURI", null);
                    ServletUtils.redirect(preURI, request, response);
                } else ServletUtils.redirect("/home", request, response);
                break;
        }

    }
    private int getNewUserId() {
        int id = 0;
        try {
            id = UsersModel.getNewId();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return id;
    }
}

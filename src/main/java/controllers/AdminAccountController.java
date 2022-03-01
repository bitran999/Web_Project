package controllers;

import entity.Admins;
import entity.Categories;
import entity.Transactions;
import entity.Users;
import models.AdminsModel;
import models.CategoriesModel;
import models.TransactionsModel;
import models.UsersModel;
import utils.ServletUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminAccountController", value="/admin/account/*")
public class AdminAccountController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        int id = 0;
        if(request.getParameter("id") != null)
            id = Integer.parseInt(request.getParameter("id"));
        if(path.equals("/admin/delete")){
            try {
                dellAcc("admin", id);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            ServletUtils.redirect("/admin/account/admin", request, response);
        } else if (path.equals("/guest/delete")){
            try {
                dellAcc("guest", id);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            ServletUtils.redirect("/admin/account/guest", request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        List accounts  = null;
        switch (path) {
            case "/admin":
                accounts = getAdmin();
                request.setAttribute("accounts", accounts);
                request.setAttribute("adminActive", "active");
                request.setAttribute("accMenu", "menu-open");
                request.setAttribute("accName", "admin");
                ServletUtils.forward("/views/Admin/account/index.jsp", request, response);
                break;
            case "/guest":
                accounts = getUser();

                request.setAttribute("accounts", accounts);
                request.setAttribute("guestActive", "active");
                request.setAttribute("accMenu", "menu-open");
                request.setAttribute("accName", "guest");
                ServletUtils.forward("/views/Admin/account/index.jsp", request, response);
                break;
        }
    }


    private List<Admins> getAdmin() {
        List<Admins> admins = null;
        try {
            admins = AdminsModel.getAll();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return admins;
    }
    private List<Users> getUser() {
        List<Users> Users = null;
        try {
            Users = UsersModel.getAll();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return Users;
    }

    private void dellAcc(String type, int id) throws SQLException {
        switch (type){
            case "admin":
                Admins admin = AdminsModel.getById(id);
                AdminsModel.delete(admin);
                break;
            case "guest":
                Users user = UsersModel.getById(id);
                UsersModel.delete(user);
                break;
        }
    }



}

package controllers;

import entity.Categories;
import entity.Products;
import entity.Transactions;
import entity.Users;
import models.CategoriesModel;
import models.OrdersModel;
import models.ProductsModel;
import models.UsersModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "FrontEndController")
public class FrontEndController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    String convertJspToString(String path, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        final StringWriter buffer = new StringWriter();
        RequestDispatcher rd = request.getRequestDispatcher(path);
        rd.include(request, new HttpServletResponseWrapper(response) {
            private PrintWriter writer = new PrintWriter(buffer);
            @Override
            public PrintWriter getWriter() throws IOException {
                return writer;
            }
        });
        return buffer.toString();
    }
     List<Categories> getAllCate() {
        List<Categories> list = null;
        try {
            list = CategoriesModel.getAll();
        } catch (SQLException throwables) {
            System.out.println("Lỗi lấy data rồi :D");
            throwables.printStackTrace();
        }
        return list;
    }
    Categories getCateById(int id){
        Categories cat = new Categories();
        try {
            cat = CategoriesModel.getById(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return cat;
    }

    List<Products> getAllPro(int cid){
        List<Products> list = null;
        try {
            list = ProductsModel.getByCId(cid);
        } catch (SQLException throwables) {
            System.out.println("Lỗi lấy data rồi :D");
            throwables.printStackTrace();
        }
        return list;
    }
    Products getProById(int id){
        Products pro = new Products();
        try {
            pro = ProductsModel.getById(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return pro;
    }

    int getNewOrderId() {
        int id = 0;
        try {
            id = OrdersModel.getNewId();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return id;
    }

    void setShoppingCart(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        Transactions transaction = new Transactions();
        session.setAttribute("cart", transaction);
    }
    Users getUserById(int id){
        Users user = new Users();
        try {
            user = UsersModel.getById(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }
    Users getUserByEmail(String email){
        Users user = null;
        try {
            user = UsersModel.getByEmail(email);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    String convertJSP(String path, HttpServletRequest request, HttpServletResponseWrapper response) throws ServletException, IOException {
        final StringWriter buffer = new StringWriter();
        request.getRequestDispatcher(path).include(request, new HttpServletResponseWrapper(response) {
            private PrintWriter writer = new PrintWriter(buffer);
            @Override
            public PrintWriter getWriter() throws IOException {
                return writer;
            }
        });
        return buffer.toString();
    }
}

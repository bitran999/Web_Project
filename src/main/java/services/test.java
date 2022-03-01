package services;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import controllers.FrontEndController;
import entity.*;
import models.*;
import org.apache.commons.lang3.RandomStringUtils;
import org.hibernate.Session;
import org.hibernate.Transaction;
import services.helper;
import utils.EmailUtil;
import utils.HibernateUtil;
import org.hibernate.query.Query;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.List;

public class test {
    public static void main(String[] args) throws SQLException {
        //createCate(cName, cSlug, cIcon, cActive, cHome);
        //updateCate(id, cName, cSlug, cIcon, cActive, cHome);
        //deleteCate(23);


        //CreateAdmin(name, email, password);

        /*CheckAdmin(email, password);*/


        //createPro();
        //getProByCateId(10);

        /*Categories cat = CategoriesModel.getById(10);
        System.out.println("Id: " + cat.getId() + " || " + "Name: " + cat.getcName());*/
        /*int cate = CategoriesModel.getLastId();
        System.out.println(cate);*/
        //getOrdersById(128);

        //testGetJson(10);
        //testCreateTrans();
        /*String message="<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "  <head>\n" +
                "    <meta charset=\"UTF-8\" />\n" +
                "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\n" +
                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n" +
                "    <title>Document</title>\n" +
                "  </head>\n" +
                "\n" +
                "  <body style=\"text-align: center; background-color: #c2fff9\">\n" +
                "    <h1 style=\"color: #34BE82\">Đăng ký thành công</h1>\n" +
                "    <h2 style=\"padding: 20px 0\">Chào mừng "+"nhật tín"+" đến với PC-Group-9 shop</h2>\n" +
                "    <p>Hãy mua sắm ngay nào!</p>\n" +
                "  </body>\n" +
                "</html>\n" ;
        try {
//            EmailUtil.sendHTMLMail(message, "nhattinnguyen99@gmail.com");
            EmailUtil.sendHTMLMail(message,"Xác nhận đăng ký","nhattinnguyen99@gmail.com");
        } catch (MessagingException e) {
            e.printStackTrace();
        }*/

        CreateUser();
    }
    public static String convertJspToString(String path, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
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
    public static void testCreateTrans() throws SQLException {
        Transactions transaction = new Transactions();
        Transactions trans = TransactionsModel.getById(128);
        int id = TransactionsModel.getNewId();
        System.out.println(id);
        String address = "asd";
        String phone = "123";
        String note = "qweqw e";
        Users user = UsersModel.getById(5);
        Timestamp timestamp = helper.getCurrentTimeStamp();
        transaction.setId(id);
        transaction.setUsersByTruserid(user);
        transaction.setTraddress(address);
        transaction.setTrphone(phone);
        transaction.setTrtotal(1000);
        transaction.setTrstatus((byte) 1);
        transaction.setTrpayment((byte) 0);
        transaction.setTrnote(note);
        //transaction.setCreatedat(timestamp);
        //transaction.setUpdatedat(timestamp);
        trans.setTrpayment((byte) 0);
        TransactionsModel.update(trans);
    }
    public static void CreateUser() throws SQLException {
        Users user = new Users();
        int id = UsersModel.getNewId();
        System.out.println(id);
        String email = "test1@gmail.com";
        String name = "testBot1";
        String pass = "123";
        Timestamp timestamp = helper.getCurrentTimeStamp();
        user.setId(id);
        user.setEmail(email);
        user.setName(name);
        user.setPassword(pass);
        user.setCreatedAt(timestamp);
        user.setUpdatedAt(timestamp);
        UsersModel.create(user);
    }

    public static void getOrdersById(int id) throws SQLException {
        List<Orders> listor = TransactionsModel.getById(id).getOrdersById();
        System.out.println(listor.size());
        for (Orders order : listor) {
            System.out.println("Id: " + order.getId() + " || " + "Name: " + order.getProductsByOrproductid().getProname());
        }
    }
    public static void testGetJson(int id) throws SQLException {
        Categories cate = CategoriesModel.getById(id);
        String json = new Gson().toJson(cate);
        System.out.println(json);
    }

    public static void getProByCateId(int proCategoryId) throws SQLException {
        List<Products> listp = null;
        try {
            listp = ProductsModel.getByCId(proCategoryId);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        System.out.println("success");
        for (Products pro : listp) {
            System.out.println("Id: " + pro.getId() + " || " + "Name: " + pro.getProname() + " || " + pro.getProslug());
        }
    }

    public static void CreateAdmin(String name, String email, String password) {
        Admins admins = AdminsModel.create(name, email, password);
        System.out.println("Admin:" + " " + name + " " +
                "Email:" + " " + email + " " +
                "Password:" + " " + password + " is added to the database!!!!!");
    }

    public static void CheckAdmin(String email, String password) {
        Admins admins = AdminsModel.get(email);
        System.out.println(admins.getEmail() + "||" + AdminsModel.checkPass("123", admins.getPassword()));
    }

    public static void getCate() throws SQLException {
        List<Categories> list = CategoriesModel.getAll();
        System.out.println("Success!!!!");
        for (Categories cat : list) {
            System.out.println("Id: " + cat.getId() + " || " + "Name: " + cat.getCname() + " || " + cat.getCslug());
        }
    }

    public static void updateCate() {
        System.out.println("Success!!!!");
    }







}

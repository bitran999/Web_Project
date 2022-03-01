package controllers;

import entity.Categories;
import entity.Products;
import entity.Transactions;
import models.CategoriesModel;
import models.ProductsModel;
import models.TransactionsModel;
import utils.EmailUtil;
import utils.ServletUtils;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


@WebServlet(name = "HomeController", urlPatterns = "/home")
public class HomeController extends FrontEndController {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Categories> listc = getAllCate();
        List<Categories> listch = getCateByChome((byte) 1);

        /*Transactions trans = getTransById(2);
        request.setAttribute("transaction", trans);
        String message = convertJspToString("/views/Guest/mail/Bill.jsp",request, response);
        System.out.println(message);
        try {
            EmailUtil.sendHTMLMail(message, "lvm2417@gmai.com");
        } catch (MessagingException e) {
            e.printStackTrace();
        }*/
        request.setAttribute("categories", listc);
        request.setAttribute("categorieshome", listch);
        ServletUtils.forward("/views/Guest/index.jsp", request, response);
    }


    private List<Categories> getCateByChome(byte chome){
        List<Categories> listc = null;
        try {
            listc = CategoriesModel.getByChome(chome);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return listc;
    }

    private Transactions getTransById(int id) {
        Transactions trans = new Transactions();
        try {
            trans = TransactionsModel.getById(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return trans;
    }

}

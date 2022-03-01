package controllers;

import entity.Orders;
import entity.Products;
import entity.Transactions;
import entity.Users;
import models.ProductsModel;
import models.TransactionsModel;
import utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminTransactionsController", value = "/admin/transaction/*")
@MultipartConfig(
        fileSizeThreshold = 2 * 1024 * 1024,
        maxFileSize = 50 * 1024 * 1024,
        maxRequestSize = 50 * 1024 * 1024
)
public class AdminTransactionsController extends FrontEndController {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String path = request.getPathInfo();
        switch (path) {
            case "/add":
            case "/update":
            case "/delete":
                manageTransaction(request, response, path);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String currentURI = request.getRequestURI();
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/index";
        }
        List<Transactions> list = getAllTran();

        switch (path) {
            case "/index":
                request.setAttribute("transactions", list);
                request.setAttribute("tranActive", "active");
                ServletUtils.forward("/views/Admin/transaction/index.jsp", request, response);
                break;
            case "/filter":
                byte trstatus = Byte.parseByte(request.getParameter("trstatus"));
                currentURI = currentURI + "?trstatus=" + trstatus;
                list = getTransByStatus(trstatus);
                request.setAttribute("transactions", list);
                request.setAttribute("tranActive", "active");
                request.setAttribute("select" + trstatus, "selected");
                request.setAttribute("currentURI", currentURI);
                ServletUtils.forward("/views/Admin/transaction/index.jsp", request, response);
                break;
            case "/update":
                try {
                    int id = Integer.parseInt(request.getParameter("trid"));
                    String URI = request.getRequestURI() + "?trid=" + id;
                    Transactions tran = TransactionsModel.getById(id);
                    List<Products> listp = getAllPro();
                    List<Orders> listor = (List<Orders>) tran.getOrdersById();
                    request.setAttribute("transaction", tran);
                    request.setAttribute("products", listp);
                    request.setAttribute("orders", listor);
                    request.setAttribute("action", URI);
                    ServletUtils.forward("/views/Admin/transaction/form.jsp", request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "/add":
                String URI = request.getRequestURI();
                //System.out.println(URI);
                request.setAttribute("action", URI);
                ServletUtils.forward("/views/Admin/transaction/form.jsp", request, response);
                break;
            default:
                ServletUtils.redirect("/notfound", request, response);
                break;
        }
    }

    private void manageTransaction(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
        int trid = 0;
        if (request.getParameter("trid") != null)
            trid = Integer.parseInt(request.getParameter("trid"));
        byte trStatus = 0;
        if (request.getParameter("trStatus") != null)
            trStatus = Byte.parseByte(request.getParameter("trStatus"));
        byte trPayment = 0;
        if (trStatus == 2)
            trPayment = 1;
        String trAddress = request.getParameter("trAddress");
        String trUserMail = request.getParameter("trUserMail");
        String trPhone = request.getParameter("trPhone");
        Transactions transaction = getTransById(trid);
        Users user = getUserByEmail(trUserMail);
        switch (path) {
            case "/update":
                transaction.setTraddress(trAddress);
                transaction.setTrphone(trPhone);
                transaction.setTrstatus(trStatus);
                transaction.setTrpayment(trPayment);
                TransactionsModel.update(transaction);
                ServletUtils.redirect("/admin/transaction", request, response);
                break;
            case "/updateorder":

                break;
            case "/add":

                break;
            case "/delete":
                TransactionsModel.delete(transaction);
                ServletUtils.redirect("/admin/transaction/", request, response);
                break;
            default:
                ServletUtils.redirect("/notfound", request, response);
                break;
        }
    }

    private List<Transactions> getAllTran() {
        List<Transactions> list = null;
        try {
            list = TransactionsModel.getAll();
        } catch (SQLException throwables) {
            System.out.println("Lỗi lấy data rồi :D");
            throwables.printStackTrace();
        }
        return list;
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

    private List<Transactions> getTransByStatus(byte trstatus) {
        List<Transactions> trans = null;
        try {
            trans = TransactionsModel.getByStatus(trstatus);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return trans;
    }

    private List<Products> getAllPro() throws SQLException {
        return ProductsModel.getAll();
    }

}

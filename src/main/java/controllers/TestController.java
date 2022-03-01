package controllers;

import entity.Categories;
import entity.Products;
import models.CategoriesModel;
import models.ProductsModel;
import utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductListController", value = "/home/product/lista")
public class TestController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String path = request.getPathInfo();
        int cid = Integer.parseInt(request.getParameter("cid"));
        if (path == null || path.equals("/")) {
            path = "/index";
        }
        List<Categories> listc = getCate();
        List<Products> listp = getPro(cid);
        Categories cat = getCateById(cid);
        switch (path) {
            case "/index":
                request.setAttribute("categories", listc);
                request.setAttribute("products", listp);
                request.setAttribute("category", cat);
                ServletUtils.forward("/views/Guest/product/index.jsp", request, response);
                break;
            case "/update":
                /*try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    String URI = request.getRequestURI() + "?id=" + id;
                    //System.out.println(URI);
                    Products pro = ProductsModel.getById(id);
                    //String json = new Gson().toJson(pro);
                    //response.setContentType("application/json");
                    //response.getWriter().write(json);
                    //System.out.println(json);
                    request.setAttribute("product", pro);
                    request.setAttribute("categories", listc);
                    request.setAttribute("action", URI);
                    ServletUtils.forward("/views/Admin/product/form.jsp", request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }*/
                break;
            case "/add":
               /* String URI = request.getRequestURI();
                //System.out.println(URI);
                request.setAttribute("categories", listc);
                request.setAttribute("action", URI);
                ServletUtils.forward("/views/Admin/product/form.jsp", request, response);*/
                break;
            default:
                ServletUtils.redirect("/notfound", request, response);
                break;
        }
    }
    private List<Categories> getCate(){
        List<Categories> list = null;
        try {
            list = CategoriesModel.getAll();
        } catch (SQLException throwables) {
            System.out.println("Lỗi lấy data rồi :D");
            throwables.printStackTrace();
        }
        return list;
    }
    private List<Products> getPro(int cid){
        List<Products> list = null;
        try {
            list = ProductsModel.getByCId(cid);
        } catch (SQLException throwables) {
            System.out.println("Lỗi lấy data rồi :D");
            throwables.printStackTrace();
        }
        return list;
    }
    private Categories getCateById(int id){
        Categories cat = new Categories();
        try {
            cat = CategoriesModel.getById(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return cat;
    }
}

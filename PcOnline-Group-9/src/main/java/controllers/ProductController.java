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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/home/product/*")
public class ProductController extends FrontEndController {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String path = request.getPathInfo();

        if (path == null || path.equals("/")) {
            ServletUtils.redirect("/home", request, response);
        }
        List<Categories> listc = getAllCate();
        List<Products> listpc  = null;
        Categories cat = new Categories();
        switch (path) {
            case "/list":
                int page = 1;
                if(request.getParameter("page") != null)
                    page = Integer.parseInt(request.getParameter("page"));
                int cid = Integer.parseInt(request.getParameter("cid"));
                int position = (page - 1) * 10;
                listpc = getAllProPaginate(cid, position);
                cat = getCateById(cid);
                request.setAttribute("categories", listc);
                request.setAttribute("products", listpc);
                request.setAttribute("category", cat);
                ServletUtils.forward("/views/Guest/product/index.jsp", request, response);
                break;
            case "/detail":
                int id = Integer.parseInt(request.getParameter("id"));
                Products pro  = getProById(id);
                cat = getCateById(pro.getCategoriesByProcategoryid().getId());
                listpc = getAllPro(pro.getCategoriesByProcategoryid().getId());
                request.setAttribute("categories", listc);
                request.setAttribute("products", listpc);
                request.setAttribute("category", cat);
                request.setAttribute("product", pro);
                ServletUtils.forward("/views/Guest/product/proDetail.jsp", request, response);
                break;
            default:
                ServletUtils.redirect("/home", request, response);
                break;
        }
    }

    List<Products> getAllProPaginate(int cid, int position){
        List<Products> list = null;
        list = ProductsModel.getByCidPagination(cid, position, 6);
        return list;
    }


}

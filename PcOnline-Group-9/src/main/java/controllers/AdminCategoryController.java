package controllers;

import entity.Categories;
import models.CategoriesModel;
import services.helper;
import utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminCategoryController", urlPatterns = "/admin/category/*")
@MultipartConfig(
        fileSizeThreshold = 2 * 1024 * 1024,
        maxFileSize = 50 * 1024 * 1024,
        maxRequestSize = 50 * 1024 * 1024
)
public class AdminCategoryController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String path = request.getPathInfo();
        switch (path) {
            case "/add":
            case "/update":
            case "/delete":
                try {
                    manageCategory(request, response, path);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            /*default:
                ServletUtils.redirect("/notfound", request, response);
                break;*/
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/index";
        }
        switch (path) {
            case "/index":
                List<Categories> list = null;
                try {
                    list = CategoriesModel.getAll();
                } catch (SQLException throwables) {
                    System.out.println("Lỗi lấy data rồi :D");
                    throwables.printStackTrace();
                }
                request.setAttribute("categories", list);
                request.setAttribute("catActive", "active");
                ServletUtils.forward("/views/Admin/category/index.jsp", request, response);
                break;
            case "/update":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    String URI = request.getRequestURI() + "?id=" + id;
                    System.out.println(id);
                    Categories cat = CategoriesModel.getById(id);
                    request.setAttribute("category", cat);
                    request.setAttribute("action", URI);
                    ServletUtils.forward("/views/Admin/category/form.jsp", request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "/add":
                String URI = request.getRequestURI();
                //System.out.println(URI);
                request.setAttribute("action", URI);
                ServletUtils.forward("/views/Admin/category/form.jsp", request, response);
                break;
            default:
                ServletUtils.redirect("/notfound", request, response);
                break;
        }
    }

    private void manageCategory(HttpServletRequest request, HttpServletResponse response, String path) throws IOException, SQLException {
        int id = 0;
        if (request.getParameter("id") != null)
            id = Integer.parseInt(request.getParameter("id"));
        String cname = request.getParameter("cName");
        String cslug = helper.createSlug(cname);

        byte cactive = 0;
        if (request.getParameter("cActive") != null)
            cactive = Byte.parseByte(request.getParameter("cActive"));

        byte chome = 0;
        if (request.getParameter("cHome") != null)
            chome = Byte.parseByte(request.getParameter("cHome"));

        Categories cat = new Categories();
        Categories catUp = CategoriesModel.getById(id);
        switch (path) {
            case "/add":

                id = CategoriesModel.getLastId() + 1;cat.setId(id);
                cat.setCname(cname);
                cat.setCslug(cslug);
                cat.setCactive(cactive);
                cat.setChome(chome);
                CategoriesModel.create(cat);
                response.sendRedirect("/admin/category/");
                break;
            case "/update":
                catUp.setCname(cname);
                catUp.setCslug(cslug);
                catUp.setCactive(cactive);
                catUp.setChome(chome);
                System.out.println(cactive);
                CategoriesModel.update(catUp);
                response.sendRedirect("/admin/category/");
                break;
            case "/delete":
                CategoriesModel.delete(catUp);
                response.sendRedirect("/admin/category/");
                break;
        }
    }



}

package controllers;

import entity.Categories;
import entity.Products;
import models.CategoriesModel;
import models.ProductsModel;
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

@WebServlet(name = "AdminProductController", value = "/admin/product/*")
@MultipartConfig(
        fileSizeThreshold = 2 * 1024 * 1024,
        maxFileSize = 50 * 1024 * 1024,
        maxRequestSize = 50 * 1024 * 1024
)
public class AdminProductController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String path = request.getPathInfo();
        switch (path) {
            case "/add":
            case "/update":
            case "/delete":
                try {
                    manageProduct(request, response, path);
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
        List<Products> list = null;
        List<Categories> listc = null;
        try {
            list = ProductsModel.getAll();
            listc = CategoriesModel.getAll();
        } catch (SQLException throwables) {
            System.out.println("Lỗi lấy data rồi :D");
            throwables.printStackTrace();
        }
        switch (path) {
            case "/index":
                request.setAttribute("products", list);
                request.setAttribute("categories", listc);
                request.setAttribute("proActive", "active");
                ServletUtils.forward("/views/Admin/product/index.jsp", request, response);
                break;
            case "/update":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    String URI = request.getRequestURI() + "?id=" + id;
                    Products pro = ProductsModel.getById(id);
                    request.setAttribute("product", pro);
                    request.setAttribute("categories", listc);
                    request.setAttribute("action", URI);
                    ServletUtils.forward("/views/Admin/product/form.jsp", request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "/add":
                String URI = request.getRequestURI();
                //System.out.println(URI);
                request.setAttribute("categories", listc);
                request.setAttribute("action", URI);
                ServletUtils.forward("/views/Admin/product/form.jsp", request, response);
                break;
            default:
                ServletUtils.redirect("/notfound", request, response);
                break;
        }
       /* if ("/index".equals(path)) {
            request.setAttribute("products", list);
            request.setAttribute("categories", listc);
            request.setAttribute("proActive", "active");
            ServletUtils.forward("/views/Admin/product/index.jsp", request, response);

        } else if ("/update".equals(path)) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                System.out.println(id);
                Products pro = ProductsModel.getById(id);
                //String json = new Gson().toJson(pro);
                //response.setContentType("application/json");
                //response.getWriter().write(json);
                //System.out.println(json);
                request.setAttribute("product", pro);
                request.setAttribute("categories", listc);
                ServletUtils.forward("/views/Admin/product/form.jsp", request, response);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        } else {
            ServletUtils.redirect("/notfound", request, response);
        }*/
    }

    private void manageProduct(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException, SQLException {
        int id = 0;
        if (request.getParameter("id") != null)
            id = Integer.parseInt(request.getParameter("id"));
        String proName = request.getParameter("proName");
        String proSlug = helper.createSlug(proName);

        int proCategoryId = 0;
        if (request.getParameter("proCategoryId") != null)
            proCategoryId = Integer.parseInt(request.getParameter("proCategoryId"));

        byte proNumber = 0;
        if (request.getParameter("proNumber") != null)
            proNumber = Byte.parseByte(request.getParameter("proNumber"));

        byte proSale = 0;
        if (request.getParameter("proSale") != null)
            proSale = Byte.parseByte(request.getParameter("proSale"));

        byte proActive = 0;
        if (request.getParameter("proActive") != null)
            proActive = Byte.parseByte(request.getParameter("proActive"));

        byte proHot = 0;
        if (request.getParameter("proHot") != null)
            proHot = Byte.parseByte(request.getParameter("proHot"));

        int proPrice = 0;
        if (request.getParameter("proPrice") != null)
            proPrice = Integer.parseInt(request.getParameter("proPrice"));
        int proAuthorId = 1;
        String proDescription = request.getParameter("proDescription");
        String proContent = request.getParameter("proContent");
        String proAvatar = "noimg.jpg";

        Products pro = new Products();
        Products proUp = ProductsModel.getById(id);
        Categories cate = CategoriesModel.getById(proCategoryId);
        switch (path) {
            case "/add":
                if (!request.getPart("proAvatar").getSubmittedFileName().equals(""))
                    /*System.out.println("Không có file");*/
                    proAvatar = upload_image(request);
                id = ProductsModel.getLastId() + 1;
                pro.setId(id);
                pro.setProname(proName);
                pro.setProslug(proSlug);
                pro.setCategoriesByProcategoryid(cate);
                pro.setProprice(proPrice);
                pro.setProauthorid(proAuthorId);
                pro.setProsale(proSale);
                pro.setProactive(proActive);
                pro.setProhot(proHot);
                pro.setProdescription(proDescription);
                pro.setProavatar(proAvatar);
                pro.setProcontent(proContent);
                pro.setPronumber(proNumber);
                ProductsModel.create(pro);
                response.sendRedirect("/admin/product/");
                break;
            case "/update":
                if (request.getPart("proAvatar").getSubmittedFileName() != "")
                    proAvatar = upload_image(request);
                else {
                    proAvatar = proUp.getProavatar();
                    System.out.println(proAvatar);
                }
                proUp.setProname(proName);
                proUp.setProslug(proSlug);
                proUp.setCategoriesByProcategoryid(cate);
                proUp.setProprice(proPrice);
                proUp.setProauthorid(proAuthorId);
                proUp.setProsale(proSale);
                proUp.setProactive(proActive);
                proUp.setProhot(proHot);
                proUp.setProdescription(proDescription);
                proUp.setProavatar(proAvatar);
                proUp.setProcontent(proContent);
                proUp.setPronumber(proNumber);
                ProductsModel.update(proUp);
                response.sendRedirect("/admin/product/");
                break;
            case "/delete":
                ProductsModel.delete(proUp);
                response.sendRedirect("/admin/product/");
                break;
        }

    }

    private String upload_image(HttpServletRequest request) throws ServletException, IOException {
        Part imgPart = request.getPart("proAvatar");
        String uploadFolder = request.getServletContext().getRealPath("/public/images");
        Path uploadPath = Paths.get(uploadFolder);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }
        String imgName = Paths.get(imgPart.getSubmittedFileName()).getFileName().toString();

        /*System.out.println(imgName);*/
       /* try {
            File file;
            FileOutputStream fos = new FileOutputStream(uploadFolder);
            InputStream is = imgPart.getInputStream();
            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }*/
        imgPart.write(Paths.get(uploadPath.toString(), imgName).toString());
        return imgName;

    }
}

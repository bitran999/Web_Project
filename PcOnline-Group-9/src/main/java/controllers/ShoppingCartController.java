package controllers;

import entity.Categories;
import entity.Orders;
import entity.Products;
import entity.Transactions;
import utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ShoppingCartController", value = "/home/cart/*")
public class ShoppingCartController extends FrontEndController {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        byte qty = 1;
        if (request.getParameter("qty") != null)
            qty = Byte.parseByte(request.getParameter("qty"));

        int id = Integer.parseInt(request.getParameter("id"));
        if (request.getParameter("id") != null)
            id = Integer.parseInt(request.getParameter("id"));

        int trtotal = 0;
        HttpSession session = request.getSession();
        String path = request.getPathInfo();
        switch (path) {
            case "/add":
                Products product = getProById(id);
                if (product != null) {
                    if (session.getAttribute("cart") == null) {
                        Transactions transaction = new Transactions();
                        List<Orders> listo = new ArrayList<Orders>();
                        Orders order = new Orders();
                        int orderId = getNewOrderId();
                        order.setId(orderId);
                        order.setOrprice(product.getProprice() * qty);
                        order.setOrqty(qty);
                        order.setProductsByOrproductid(product);
                        listo.add(order);
                        trtotal = order.getOrprice();

                        transaction.setOrdersById(listo);
                        transaction.setTrtotal(trtotal);
                        session.setAttribute("cart", transaction);
                    } else {
                        Transactions transaction = (Transactions) session.getAttribute("cart");
                        List<Orders> listo = transaction.getOrdersById();
                        int orderId = 0;
                        boolean check = false;
                        for (Orders order : listo) {
                            if (order.getProductsByOrproductid().getId() == product.getId()) {
                                order.setOrqty((byte) (order.getOrqty() + qty));
                                order.setOrprice(order.getProductsByOrproductid().getProprice() * order.getOrqty());
                                check = true;
                            }
                            orderId = order.getId();
                        }
                        if (!check) {
                            Orders order = new Orders();
                            orderId = orderId + 1;
                            order.setId(orderId);
                            order.setOrprice(product.getProprice() * qty);
                            order.setOrqty(qty);
                            order.setProductsByOrproductid(product);
                            listo.add(order);
                        }
                        for (Orders order : listo) {
                            trtotal = trtotal + order.getOrprice();
                        }
                        transaction.setTrtotal(trtotal);
                        session.setAttribute("cart", transaction);
                    }
                }
                //ServletUtils.redirect("/home/cart", request, response);
                ServletUtils.forward("/views/Guest/cart/minicart.jsp", request, response);
                break;
            case "/update":
                Transactions transaction = (Transactions) session.getAttribute("cart");
                List<Orders> listo = transaction.getOrdersById();
                trtotal = transaction.getTrtotal();
                for (Orders order : listo) {
                    if (order.getId() == id) {
                        trtotal = trtotal - order.getOrprice();
                        order.setOrqty(qty);
                        order.setOrprice(order.getProductsByOrproductid().getProprice() * qty);
                        trtotal = trtotal + order.getOrprice();
                        break;
                    }
                }
                transaction.setTrtotal(trtotal);
                session.setAttribute("cart", transaction);
                ServletUtils.forward("/views/Guest/cart/cartcontainer.jsp", request, response);
                break;
            case "/delete":
                transaction = (Transactions) session.getAttribute("cart");
                listo = transaction.getOrdersById();
                trtotal = transaction.getTrtotal();
                for (Orders order : listo) {
                    if (order.getId() == id) {
                        trtotal = trtotal - order.getOrprice();
                        boolean del = listo.remove(order);
                        if (del)
                            System.out.println("deleted");
                        break;
                    }
                }
                transaction.setTrtotal(trtotal);
                session.setAttribute("cart", transaction);
                ServletUtils.forward("/views/Guest/cart/cartcontainer.jsp", request, response);
                break;
        }
        //ServletUtils.redirect("/home/cart", request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/index";
        }
        List<Categories> listc = getAllCate();
        HttpSession session = request.getSession();
        request.setAttribute("categories", listc);
        request.setAttribute("cart", session.getAttribute("cart"));
        if ("/index".equals(path)) {
            ServletUtils.forward("/views/Guest/cart/index.jsp", request, response);
        }
    }


}

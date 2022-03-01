package controllers;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import entity.Categories;
import entity.Orders;
import entity.Transactions;
import entity.Users;
import models.OrdersModel;
import models.TransactionsModel;
import org.hibernate.Transaction;
import services.VnpayConst;
import services.helper;
import utils.EmailUtil;
import utils.ServletUtils;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(name = "TransactionController", value = "/home/cart/checkout/*")
public class TransactionController extends FrontEndController {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/index";
        }
        switch (path) {
            case "/placeorder":
                break;
            case "/vnpay":
                manageTransaction(request, response, path);
                break;
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Transactions transaction = (Transactions) session.getAttribute("transaction");
        Timestamp timestamp = helper.getCurrentTimeStamp();
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/index";
        }
        List<Categories> listc = getAllCate();
        request.setAttribute("categories", listc);
        switch (path){
            case "/index":
                ServletUtils.forward("/views/Guest/cart/checkout.jsp", request, response);
                break;
            case "/vnpay_return":
                int id = getNewTransId();
                List<Orders> listo = transaction.getOrdersById();
                if(request.getParameter("vnp_ResponseCode").equals("00")){
                    transaction.setTrstatus((byte) 1);
                    transaction.setTrpayment((byte) 2);
                    transaction.setCreatedat(timestamp);
                    transaction.setUpdatedat(timestamp);
                    TransactionsModel.create(transaction);
                    for (Orders order : listo) {
                        System.out.println(order.getProductsByOrproductid().getProname());
                        order.setTransactionsByOrtransactionid(transaction);
                        OrdersModel.create(order);
                    }
                }
                request.setAttribute("transaction", transaction);
                sendMail(request, response, transaction.getUsersByTruserid().getEmail());
                session.removeAttribute("cart");
                ServletUtils.forward("/views/Guest/vnpay/vnpay_return.jsp", request, response);
                break;
            case "/checkout_return":
                request.setAttribute("transaction", transaction);
                ServletUtils.forward("/views/Guest/cart/checkout_return.jsp", request, response);
                break;
        }
    }
    private void manageTransaction(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Transactions transaction = (Transactions) session.getAttribute("cart");
        List<Orders> listo = transaction.getOrdersById();
        int id = getNewTransId();
        Users user = (Users) session.getAttribute("user");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String note = request.getParameter("note");
        Timestamp timestamp = helper.getCurrentTimeStamp();
        switch (path) {
            case "/placeorder":
                transaction.setId(id);
                transaction.setUsersByTruserid(user);
                transaction.setTraddress(address);
                transaction.setTrphone(phone);
                transaction.setTrnote(note);
                transaction.setCreatedat(timestamp);
                transaction.setUpdatedat(timestamp);
                System.out.println(transaction.getTrtotal());
                TransactionsModel.create(transaction);
                for (Orders order : listo) {
                    System.out.println(order.getProductsByOrproductid().getProname());
                    order.setTransactionsByOrtransactionid(transaction);
                    OrdersModel.create(order);
                }
                session.setAttribute("transaction", transaction);
                session.removeAttribute("cart");
                request.setAttribute("transaction", transaction);
                sendMail(request, response, transaction.getUsersByTruserid().getEmail());
                ServletUtils.redirect("/home/cart/checkout/checkout_return", request, response);
                break;
            case "/vnpay":
                transaction.setId(id);
                transaction.setUsersByTruserid(user);
                transaction.setTraddress(address);
                transaction.setTrphone(phone);
                transaction.setTrnote(note);
                transaction.setCreatedat(timestamp);
                transaction.setUpdatedat(timestamp);
                for (Orders order : listo) {
                    System.out.println(order.getProductsByOrproductid().getProname());
                    order.setTransactionsByOrtransactionid(transaction);
                }
                session.setAttribute("transaction", transaction);
                vnpay(request, response, transaction);
                break;
        }
    }

    private void vnpay(HttpServletRequest request, HttpServletResponse response, Transactions transaction) throws IOException, ServletException {
        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        //Khai báo const
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String vnp_TmnCode = VnpayConst.vnp_TmnCode;
        int amount = Integer.parseInt(request.getParameter("amount")) * 100;
        String bank_code = request.getParameter("bankcode");
        String vnp_CreateDate = formatter.format(cld.getTime());
        String vnp_CurrCode = "VND";
        String vnp_IpAddr = helper.getIpAddress(request);
        String locate = request.getParameter("language");
        String vnp_OrderInfo = "Thanh toán đơn hàng";
        String orderType = "billpayment";
        String vnp_TxnRef = helper.randString(8);

        //Tạo json param
        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", vnp_CurrCode);
        if (bank_code != null && !bank_code.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bank_code);
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
        vnp_Params.put("vnp_OrderType", orderType);
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        //URl trả về sau khi thanh toán
        vnp_Params.put("vnp_ReturnUrl", VnpayConst.vnp_Returnurl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        //Add Params of 2.0.1 Version
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);



        //Build data to hash and querystring
        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = VnpayConst.hmacSHA512(VnpayConst.vnp_HashSecret, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = VnpayConst.vnp_PayUrl + "?" + queryUrl;
        JsonObject job = new JsonObject();
        job.addProperty("code", "00");
        job.addProperty("message", "success");
        job.addProperty("data", paymentUrl);


        //Chuyển đến trang thanh toán
        ServletUtils.redirect(paymentUrl, request, response);
        //Gson gson = new Gson();
        //response.getWriter().write(gson.toJson(job));

    }



    private int getNewTransId() {
        int id = 0;
        try {
            id = TransactionsModel.getNewId();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return id;
    }
    private void sendMail(HttpServletRequest request, HttpServletResponse response, String email) throws ServletException, IOException {
        String message = convertJspToString("/views/Guest/mail/Bill.jsp",request, response); /*buffer.toString();*/
        try {
            EmailUtil.sendHTMLMail(message, "Pconline - Group 9 - Order Information", email);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
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

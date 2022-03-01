package controllers;

import entity.Users;
import models.UsersModel;
import services.helper;
import utils.EmailUtil;
import utils.ServletUtils;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static services.test.convertJspToString;
import static utils.EmailUtil.*;

@WebServlet(name = "RegisterController",urlPatterns = "/home/register")
public class RegisterController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            String fistName=request.getParameter("firstName");
            String lastName=request.getParameter("lastName");
            String pass=request.getParameter("pass");
            String rePass=request.getParameter("rePass");
            String phone=request.getParameter("phone");
            String email=request.getParameter("email");
            String address=request.getParameter("address");
            if(!pass.equals(rePass))
            {
                request.setAttribute("LoginMess", "Password doesn't match");
                ServletUtils.forward("/views/Guest/account/register.jsp", request, response);
                return;
            }
        try {
                Users user = new Users();
               int id = UsersModel.getNewId();
                System.out.println(id);
                // check đã có user nào sử dụng email chưa
                if(UsersModel.getByEmail(email)!=null) {
                    request.setAttribute("LoginMess", "Email already in use");
                    ServletUtils.forward("/views/Guest/account/register.jsp", request, response);
                    return;
                }
                // check phone
                if(phone.length()!=0)
                {
                    if(!validatePhoneNumber(phone)){
                        request.setAttribute("LoginMess", "Wrong Phone Number");
                        ServletUtils.forward("/views/Guest/account/register.jsp", request, response);
                        return;
                    }
                    else{
                        user.setPhone(phone);
                    }
                }
                String name = lastName+" "+fistName;
                Timestamp timestamp = helper.getCurrentTimeStamp();
                user.setId(id);
                user.setEmail(email);
                user.setName(name);
                user.setPassword(pass);
                user.setAddress(address);
                user.setCreatedAt(timestamp);
                user.setUpdatedAt(timestamp);
                UsersModel.create(user);
                String message = convertJspToString("/views/Guest/Mail/ConfirmRegister.jsp",request, response); /*buffer.toString();*/
                System.out.println(message);
                try {
                     EmailUtil.sendHTMLMail(message,"Xác nhận đăng ký","nhattinnguyen99@gmail.com");
                } catch (MessagingException e) {
                e.printStackTrace();
            }
            response.sendRedirect("/home/login");
            } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/Guest/account/register.jsp").forward(request, response);
    }

    private static boolean validatePhoneNumber(String phoneNo) {
        //validate phone numbers of format "1234567890"
        if (phoneNo.matches("\\d{10}")) return true;
            //validating phone number with -, . or spaces
        else if(phoneNo.matches("\\d{3}[-\\.\\s]\\d{3}[-\\.\\s]\\d{4}")) return true;
            //validating phone number with extension length from 3 to 5
        else if(phoneNo.matches("\\d{3}-\\d{3}-\\d{4}\\s(x|(ext))\\d{3,5}")) return true;
            //validating phone number where area code is in braces ()
        else if(phoneNo.matches("\\(\\d{3}\\)-\\d{3}-\\d{4}")) return true;
            //return false if nothing matches the input
        else return false;

    }


}

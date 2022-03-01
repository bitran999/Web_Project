package controllers;

import entity.Users;
import models.UsersModel;
import services.helper;
import utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;

@WebServlet(name = "UpdateAccountController", value = "/home/account")
public class UpdateAccountController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("FullName");
        String pass=request.getParameter("pass");
        String rePass=request.getParameter("newPass");
        String reNewPass=request.getParameter("reNewPass");
        String phone=request.getParameter("phone");
        String email=request.getParameter("email");
        String address=request.getParameter("address");
        HttpSession session = request.getSession();
        try {
            Users user = new Users();
            user=UsersModel.getByEmail(email);
            //check repass
            if(rePass.length()!=0&&reNewPass.length()!=0)
            {
                if(!rePass.equals(reNewPass))
                {
                    request.setAttribute("check", "New password doesn't match");
                    ServletUtils.forward("/views/Guest/account/account.jsp", request, response);
                    return;
                }
                user.setPassword(UsersModel.encryptPass(rePass));

            }
            // check phone
            phone=phone.trim();
            if(phone.length()!=0)
            {

                if(!validatePhoneNumber(phone)){
                    request.setAttribute("check", "Wrong Phone Number");
                    ServletUtils.forward("/views/Guest/account/account.jsp", request, response);
                    return;
                }
            }
            Timestamp timestamp = helper.getCurrentTimeStamp();
            user.setName(name);
            user.setAddress(address);
            user.setPhone(phone);
            user.setCreatedAt(timestamp);
            user.setUpdatedAt(timestamp);
            UsersModel.update(user);
            //reload lại thông tin tự thay đổi
            session.setAttribute("user", user);
            Cookie aemail = new Cookie("email", email);
            Cookie apassword = new Cookie("password", user.getPassword());
            aemail.setMaxAge(0);
            apassword.setMaxAge(0);
            response.addCookie(aemail);
            response.addCookie(apassword);
            System.out.println("change Successfully");
            session.setAttribute("user", user);
            ServletUtils.redirect("/home/account", request, response);


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/Guest/account/account.jsp").forward(request, response);
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

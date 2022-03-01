package filters;

import entity.Admins;
import utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "AdminFilter", urlPatterns = {"/admina/*"})
public class AdminFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        String cpath = request.getContextPath();
        String reqAction = request.getRequestURI().replace(cpath, "");

        HttpSession session = request.getSession();

        Admins admin = (Admins) session.getAttribute("admin");
        /*if (admin == null){
            session.setAttribute("reqAction", reqAction);
            session.setAttribute("checkLogin", "fail");
            response.sendRedirect("admin/login");
        } else
            chain.doFilter(req, resp);*/

        if (admin == null && !request.getRequestURI().endsWith("admin/login")) {
            /*req.getRequestDispatcher("/WEB-INF/views/Admin/account/login.jsp").forward(req, resp);*/
            ServletUtils.redirect("/admin/login", request, response);
        } else {
            chain.doFilter(req, resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}

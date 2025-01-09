package hcmuaf.nlu.edu.vn.quanlyxemphim.filter;

import hcmuaf.nlu.edu.vn.quanlyxemphim.model.Users;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;

@WebFilter(filterName = "admin-filter", urlPatterns = {"/add-account", "/delete-account", "/accounts", "/status-account",
"/add-promotional", "/delete-promotional", "/promotional-list", "/update-status-pro","/list-rating" ,"/delete-rating",
"/category", "/add-delete-category" ,"/add-product","/products-list","/delete-product","/edit-product"})
public class AdminFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false); // nếu chưa đăng nhập thì ko tạo ra session mới
        Users user = (session != null) ? (Users) session.getAttribute("user") : null;

        if (user == null || !user.getRole().equals("admin")) {
            // Lưu URL hiện tại
            String currentUrl = req.getRequestURI();
            String queryString = req.getQueryString();
            if (queryString != null) {
                currentUrl += "?" + queryString; // Gắn query string nếu có
            }
            req.getSession(true).setAttribute("redirectUrl", currentUrl);

            // Chuyển đến trang đăng nhập
            req.getRequestDispatcher("/users/page/login-signup.jsp").forward(req, res);
            return;
        }

        chain.doFilter(request, response); // Tiếp tục xử lý nếu là admin
    }
    @Override
    public void destroy() {

    }
}

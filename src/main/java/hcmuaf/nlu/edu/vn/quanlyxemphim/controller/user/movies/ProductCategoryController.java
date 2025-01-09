//package hcmuaf.nlu.edu.vn.quanlyxemphim.controller.user.products;
//
//import hcmuaf.nlu.edu.vn.model.Product;
//import hcmuaf.nlu.edu.vn.service.ProductService;
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.*;
//
//import java.io.IOException;
//import java.sql.SQLException;
//import java.util.List;
//
//@WebServlet(name = "ProductControllerCategory", value = "/product-category")
//public class ProductCategoryController extends HttpServlet {
//    private ProductService productService = new ProductService();
//
//    public ProductCategoryController() {
//        this.productService = new ProductService();
//    }
//
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Lấy categoryId từ request
//        String categoryIdParam = request.getParameter("categoryId");
//        // Nếu categoryId không hợp lệ, chuyển hướng về trang chủ
//        int categoryId = parseCategoryId(categoryIdParam, response);
//        if (categoryId == -1) return;
//        try {
//            List<Product> products = productService.getAllProductsCategory(categoryId);
//            // Gửi dữ liệu sản phẩm và categoryId đến JSP để hiển thị
//            request.setAttribute("products", products);
//            request.setAttribute("categoryId", categoryId);
//            request.getRequestDispatcher("/users/page/movie.jsp").forward(request, response);
//        } catch (SQLException e) {
//            // Xử lý lỗi truy vấn cơ sở dữ liệu
//            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
//        }
//    }
//
//    private int parseCategoryId(String categoryIdParam, HttpServletResponse response) throws IOException {
//        int categoryId;
//        try {
//            categoryId = Integer.parseInt(categoryIdParam);
//        } catch (NumberFormatException | NullPointerException e) {
//            // Nếu categoryId không hợp lệ, trả về -1 và gửi thông báo lỗi
//            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid categoryId");
//            return -1;
//        }
//        return categoryId;
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    }
//
//}
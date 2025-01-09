//package hcmuaf.nlu.edu.vn.quanlyxemphim.controller.admin.movies;
//
//
//import hcmuaf.nlu.edu.vn.quanlyxemphim.dao.DBConnect;
//import hcmuaf.nlu.edu.vn.quanlyxemphim.model.Movie;
//import hcmuaf.nlu.edu.vn.quanlyxemphim.service.MovieService;
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.*;
//
//import java.io.File;
//import java.io.IOException;
//import java.nio.file.Paths;
//
//@MultipartConfig
//@WebServlet(name = "EditProductController ", value = "/edit-product")
//public class EditProductController extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Lấy ID sản phẩm cần sửa
//        MovieService movieService = new MovieService();
//        try {
//            int productId = Integer.parseInt(request.getParameter("id"));
//            Movie movie = movieService.getProductById(productId);
//            // Gửi sản phẩm tới JSP
//            request.setAttribute("product", movie);
//
//            request.getRequestDispatcher("/products-list?action=show").forward(request, response);
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//
//        }
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        DBConnect dbConnect = new DBConnect();
//        try {
//            int productId = Integer.parseInt(request.getParameter("id"));
//            String name = request.getParameter("name");
//            double price = Double.parseDouble(request.getParameter("price"));
//            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
//            String discountPercent = request.getParameter("discountPercent");
//            int quantity = Integer.parseInt(request.getParameter("quantity"));
//            String status = request.getParameter("status");
//            String supplier = request.getParameter("supplier");
//            String color = request.getParameter("color");
//            String size = request.getParameter("size");
//            String unit = request.getParameter("unit");
//            String description = request.getParameter("description");
//            String imageUrl = request.getParameter("imageUrl");
//
//            // Kiểm tra và gán giá trị mặc định cho các trường nếu là null hoặc rỗng
//            if (supplier == null || supplier.trim().isEmpty()) {
//                supplier = "";
//            }
//            if (color == null || color.trim().isEmpty()) {
//                color = "";
//            }
//            if (size == null || size.trim().isEmpty()) {
//                size = "";
//            }
//            if (description == null || description.trim().isEmpty()) {
//                description = "";
//            }
//            if (unit == null || unit.trim().isEmpty()) {
//                unit = "";
//            }
//
//            if (discountPercent == null || discountPercent.trim().isEmpty()) {
//                discountPercent = "0"; // Mặc định là 0 nếu không nhập
//            }
//            double discountPercents = Double.parseDouble(discountPercent.trim());
//
//
//            // Lấy phần hình ảnh nếu có
//            Part imagePart = request.getPart("imageUrl");
//            double discountPrice = discountPercents * price;
//            Movie updateProduct = new Movie(productId, name, price, quantity, imageUrl, description, categoryId, status, supplier, color, size, unit, discountPercents, discountPrice);
//
//
//            // Kiểm tra và lưu ảnh nếu có
//            if (imagePart != null && imagePart.getSize() > 0) {
//                // Nếu có file mới, lưu file và lấy đường dẫn
//                String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
//                String uploadPath = getServletContext().getRealPath("") + File.separator + "users" + File.separator + "img"; // Thư mục lưu ảnh
//                File uploadDir = new File(uploadPath);
//                if (!uploadDir.exists()) uploadDir.mkdirs(); // Tạo thư mục nếu chưa tồn tại
//
//                // Lưu file lên thư mục uploads
//                File file = new File(uploadPath + File.separator + fileName);
//                imagePart.write(file.getAbsolutePath());
//                imageUrl = "users/img/" + fileName; // Đường dẫn ảnh để lưu vào cơ sở dữ liệu
//            } else {
//                // Nếu không có hình ảnh mới, sử dụng hình ảnh cũ
//                imageUrl = request.getParameter("currentImageUrl");
//            }
//
//            ProductService productService = new ProductService();
//            try {
//                // Cập nhật sản phẩm với hình ảnh mới (hoặc cũ nếu không có hình ảnh mới)
//                updateProduct.setImageUrl(imageUrl);
//
//                // Cập nhật sản phẩm
//                boolean isUpdated = productService.updateProduct(productId, updateProduct);
//                System.out.println("Update product status: " + isUpdated);
//                if (isUpdated) {
//                    response.sendRedirect(request.getContextPath() + "/products-list");
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//                response.sendRedirect(request.getContextPath() + "/products-list");
//            }
//        } finally {
//            dbConnect.closeConnection();
//        }
//    }
//}
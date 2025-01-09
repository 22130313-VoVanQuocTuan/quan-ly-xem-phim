//package hcmuaf.nlu.edu.vn.quanlyxemphim.controller.user.products;
//
//import hcmuaf.nlu.edu.vn.model.Product;
//import hcmuaf.nlu.edu.vn.service.ProductService;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.util.List;
//
//
//@WebServlet(name = "product", value = "/product-detail")
//public class GetProductDetailController extends HttpServlet {
//    private  final  ProductService productService ;
//    public GetProductDetailController() {
//        productService = new ProductService();
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        int id = Integer.parseInt(req.getParameter("id"));
//        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
//
//
//        // nếu có đánh giá
//        String ratingStatus = req.getParameter("rating");
//        if ("success".equals(ratingStatus)) {
//            req.setAttribute("rating", "Đánh giá thành công");
//        } else if ("fail".equals(ratingStatus)) {
//            req.setAttribute("rating", "Đánh giá thất bại");
//        }
//        //KHÔNG CÓ ĐÁNH GIÁ
//        try {
//            Product product = productService.getProductById(id);
//            List<Product> allProductsCategory = productService.getAllProductsCategory(categoryId);
//            productService.updateViewProduct(id);
//            req.setAttribute("product", product);
//            req.setAttribute("productCategory", allProductsCategory);
//            req.getRequestDispatcher("/users/page/product-detail.jsp").forward(req, resp);
//
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        doGet(req, resp);
//    }
//}
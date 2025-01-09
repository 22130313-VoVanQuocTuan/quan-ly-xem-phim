package hcmuaf.nlu.edu.vn.quanlyxemphim.controller.user.rating;


import hcmuaf.nlu.edu.vn.quanlyxemphim.model.Rating;
import hcmuaf.nlu.edu.vn.quanlyxemphim.service.RatingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "CreateRating", value = "/create-rating")
public class CreateRatingController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {


        int productId = Integer.parseInt(req.getParameter("productId"));
        int userId = Integer.parseInt(req.getParameter("userId"));
        String content = req.getParameter("content");

        int categoryId = Integer.parseInt(req.getParameter("categoryId"));

        RatingService ratingService = new RatingService();
        Rating rating = new Rating(productId,userId,content);

        if(ratingService.addRating(rating)){
            req.setAttribute("productId", productId);
            req.setAttribute("categoryId", categoryId);
            req.setAttribute("rating", "Đánh giá thành công");
            req.getRequestDispatcher( "/product-detail?id=" + productId + "&categoryId=" + categoryId + "&rating=success").forward(req, resp);
        }else{
            req.setAttribute("rating", "Đánh giá thất bại");
            req.getRequestDispatcher( "/product-detail?id=" + productId + "&categoryId=" + categoryId + "&rating=fail").forward(req, resp);

        }


    }
    catch(Exception e){
        req.setAttribute("rating", "lỗi hệ thống");
        resp.sendRedirect(req.getContextPath() + "/home-page");
      }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}

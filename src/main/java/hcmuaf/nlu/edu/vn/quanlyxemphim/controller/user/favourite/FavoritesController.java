package hcmuaf.nlu.edu.vn.quanlyxemphim.controller.user.favourite;

import hcmuaf.nlu.edu.vn.quanlyxemphim.model.Movie;
import hcmuaf.nlu.edu.vn.quanlyxemphim.model.Users;
import hcmuaf.nlu.edu.vn.quanlyxemphim.service.FavouriteService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/favorites")
public class FavoritesController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin người dùng từ session
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");  // Lấy đối tượng User từ session
        String action = request.getParameter("action");
        String movieId = request.getParameter("movieId");
        FavouriteService favouriteService = new FavouriteService();

        if(action.equals("remove")){
            favouriteService.removeFavorite(user.getId(), movieId);

        }
        // Lấy danh sách phim yêu thích từ DAO

            List<Movie> favoriteMovies = favouriteService.getFavoritesByUserId(user.getId());

            // Gửi danh sách phim yêu thích lên trang JSP
            request.setAttribute("favoriteMovies", favoriteMovies);

            // Chuyển hướng tới trang yêu thích
            RequestDispatcher dispatcher = request.getRequestDispatcher("users/page/favorites.jsp");
            dispatcher.forward(request, response);
        }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

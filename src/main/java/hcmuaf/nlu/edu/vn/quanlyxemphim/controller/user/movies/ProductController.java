package hcmuaf.nlu.edu.vn.quanlyxemphim.controller.user.movies;


import hcmuaf.nlu.edu.vn.quanlyxemphim.model.Movie;
import hcmuaf.nlu.edu.vn.quanlyxemphim.service.MovieService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/product")
public class ProductController extends HttpServlet {
    private final MovieService movieService;

    public ProductController() {
        this.movieService = new MovieService();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Movie> movies = null;

        String search = request.getParameter("search");
        String name = request.getParameter("name");
        try {
            movies = movieService.getAllMovies();

            if(search != null && !search.isEmpty()) {
                movies = movieService.getListMoviesByName(name);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        HttpSession session = request.getSession();
        // Truyền danh sách sản phẩm vào request để hiển thị trong JSP

        request.setAttribute("products", movies);
        request.getRequestDispatcher("users/page/product.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

}
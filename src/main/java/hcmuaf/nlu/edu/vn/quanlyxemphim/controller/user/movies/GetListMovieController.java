package hcmuaf.nlu.edu.vn.quanlyxemphim.controller.user.movies;


import hcmuaf.nlu.edu.vn.quanlyxemphim.model.Movie;
import hcmuaf.nlu.edu.vn.quanlyxemphim.service.MovieService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "home-page", value = "/home-page")
public class GetListMovieController extends HttpServlet {
    private  final MovieService movieService ;
    public GetListMovieController() {
        movieService = new MovieService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {


            List<Movie> movieList = movieService.getAllMovies();

            // Gửi dữ liệu sản phẩm và categoryId đến JSP để hiển thị
            List<String> posterUrlList = movieService.getListPoster();


            req.setAttribute("poster", posterUrlList);

            req.setAttribute("movieList", movieList);
            req.getRequestDispatcher("home.jsp").forward(req, resp);

        }catch (Exception e){
            e.printStackTrace();
        }
    }

  }

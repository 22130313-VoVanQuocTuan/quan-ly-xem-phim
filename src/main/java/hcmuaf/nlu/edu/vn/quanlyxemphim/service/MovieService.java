package hcmuaf.nlu.edu.vn.quanlyxemphim.service;


import hcmuaf.nlu.edu.vn.quanlyxemphim.dao.movies.*;
import hcmuaf.nlu.edu.vn.quanlyxemphim.model.Movie;


import java.sql.SQLException;
import java.util.List;

public class MovieService {


    private final MovieDao movieDao = new MovieDao();


    private final GetMovieDao getMovieDao;

    public MovieService() {

        this.getMovieDao = new GetMovieDao();

    }


    // Lấy ra danh sách tát cả phim
    public List<Movie> getAllMovies() throws SQLException {
        return movieDao.getAllMovies();
    }

    // Lấy ra danh sách tát cả phim của danh mục
    public List<Movie> getAllMovieGenre(int categoryId) throws SQLException {
        return movieDao.getAllMoviesByGenre(categoryId);
    }

    // Lấy ra phim theo id
    public Movie getMoviesById(int id) {
        return getMovieDao.getMovie(id);
    }

    //Hàm thêm phim
    public boolean addMovies(Movie product) {
        return movieDao.addMovie(product);
    }

    // Phương thức cập nhật thông tin phim
    public boolean updateMovies(int id, Movie product) {
        return movieDao.updateMovie(id, product);
    }

    // Hàm xóa phim
    public boolean deleteMovie(String id) {
        return movieDao.deleteMovie(id);
    }

    // -------------------Các phương thức filter sản phẩm-------------------------





    //Lấy danh sách sản phẩm theo tên tìm kiếm
    public List<Movie> getListMoviesByName(String name) throws SQLException {
        return movieDao.getListMoviesByName(name);
    }


    public List<String> getListPoster() {
        return movieDao.getListPoster();
    }

    public double getTicketPriceById(String id) {
        return movieDao.getTicketPrice(id);
    }
}


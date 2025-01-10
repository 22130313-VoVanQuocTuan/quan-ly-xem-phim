package hcmuaf.nlu.edu.vn.quanlyxemphim.dao.favourite;

import hcmuaf.nlu.edu.vn.quanlyxemphim.dao.DBConnect;
import hcmuaf.nlu.edu.vn.quanlyxemphim.model.Movie;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FavouriteDao {
    private final DBConnect dbConnect;
    public FavouriteDao() {
        dbConnect = new DBConnect();
    }


    public void addToFavorites(long movieId, long userId) {
        String query = "INSERT INTO Favorites (userId, movieId) VALUES (?, ?)";

        try (PreparedStatement stmt = dbConnect.preparedStatement(query)) {

            stmt.setLong(1, userId);
            stmt.setLong(2, movieId);

            stmt.executeUpdate();
       // Có thể ném một exception hoặc thông báo lỗi cho người dùng
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Lấy danh sách phim yêu thích của người dùng
    public List<Movie> getFavoritesByUserId(long userId) {
        List<Movie> favoriteMovies = new ArrayList<>();
        String query = "SELECT m.id, m.title, m.posterUrl " +
                "FROM Movies m " +
                "JOIN Favorites f ON m.id = f.movieId " +
                "WHERE f.userId = ?";

        try (PreparedStatement stmt = dbConnect.preparedStatement(query)) {

            stmt.setLong(1, userId);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                // Lấy thông tin bộ phim từ kết quả truy vấn
                Movie movie = new Movie();
                movie.setId(rs.getInt("id"));
                movie.setTitle(rs.getString("title"));
                movie.setPosterUrl(rs.getString("posterUrl"));


                // Thêm bộ phim vào danh sách yêu thích
                favoriteMovies.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Có thể ném một exception hoặc thông báo lỗi cho người dùng
        }

        return favoriteMovies;
    }

    // Xóa phim khỏi yêu thích
    public boolean removeFavorite(int userId, String movieId) {
        String query = "DELETE FROM Favorites WHERE userId = ? AND movieId = ?";

        try (PreparedStatement stmt = dbConnect.preparedStatement(query)) {

            stmt.setInt(1, userId);
            stmt.setString(2, movieId);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;  // Trả về true nếu xóa thành công, false nếu không
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}


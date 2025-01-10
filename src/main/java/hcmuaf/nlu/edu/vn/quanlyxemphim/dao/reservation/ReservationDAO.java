package hcmuaf.nlu.edu.vn.quanlyxemphim.dao.reservation;

import hcmuaf.nlu.edu.vn.quanlyxemphim.dao.DBConnect;
import hcmuaf.nlu.edu.vn.quanlyxemphim.model.Room;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class ReservationDAO {
    private  final DBConnect dbConnect;
    public ReservationDAO() {
        dbConnect = new DBConnect();
    }
    public boolean createReservation(int userId, String roomId, String timeSlotId, int movieId, String customerName, String customerPhone, int seatNumber) {
        // Kết nối cơ sở dữ liệu
        String query = "INSERT INTO reservations (userId,roomId, timeSlotId, movieId, customerName, customerPhone, seats, status) " +
                "VALUES (?, ?, ?, ?, ?,?,?, ?)";

        try (PreparedStatement preparedStatement = dbConnect.preparedStatement(query)) {

            // Thiết lập các tham số cho truy vấn
            preparedStatement.setInt(1, userId);
            preparedStatement.setString(2, roomId);
            preparedStatement.setString(3, timeSlotId);
            preparedStatement.setInt(4, movieId);
            preparedStatement.setString(5, customerName);
            preparedStatement.setString(6, customerPhone);
            preparedStatement.setInt(7, seatNumber); // Số ghế đặt
            preparedStatement.setString(8, "chưa thanh toán");

            // Thực thi truy vấn
            int result = preparedStatement.executeUpdate();

            if (result > 0) {
              return true;
            } else {
               return false;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Lấy phòng theo id
    public Room getRoomById(String roomId) {
        String sql = "SELECT * FROM rooms WHERE id = ?";
        Room room = null;
        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ptm.setString(1, roomId);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                room = new Room();
                room.setId(rs.getInt("id"));
                room.setName(rs.getString("name"));
                room.setCapacity(rs.getInt("capacity"));


            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return room;
    }

    //Cập nhật trang thái đặt chỗ khi thanh toán thành công
    public void updateReservationsStatus(int userId) {
        // Cập nhật trạng thái đặt chỗ trong cơ sở dữ liệu
        String updateQuery = "UPDATE reservations SET status = ? WHERE userId = ?";

        try ( PreparedStatement stmt = dbConnect.preparedStatement(updateQuery)) {
            stmt.setString(1, "Đã thanh toán");  // "PAID" là trạng thái thành công
            stmt.setInt(2, userId);
            stmt.executeUpdate();  // Thực hiện cập nhật

            } catch (SQLException e) {
            e.printStackTrace();
        }
    }



}


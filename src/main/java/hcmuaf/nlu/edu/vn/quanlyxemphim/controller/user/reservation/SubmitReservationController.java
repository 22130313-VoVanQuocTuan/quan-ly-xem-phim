package hcmuaf.nlu.edu.vn.quanlyxemphim.controller.user.reservation;

import hcmuaf.nlu.edu.vn.quanlyxemphim.dao.reservation.ReservationDAO;
import hcmuaf.nlu.edu.vn.quanlyxemphim.model.Movie;
import hcmuaf.nlu.edu.vn.quanlyxemphim.model.Room;
import hcmuaf.nlu.edu.vn.quanlyxemphim.model.TimeSlot;
import hcmuaf.nlu.edu.vn.quanlyxemphim.model.Users;
import hcmuaf.nlu.edu.vn.quanlyxemphim.service.EmailUtilService;
import hcmuaf.nlu.edu.vn.quanlyxemphim.service.MovieService;
import hcmuaf.nlu.edu.vn.quanlyxemphim.service.ReservationService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.format.DateTimeFormatter;

@WebServlet("/submitReservation")
public class SubmitReservationController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ form
        String roomId = request.getParameter("roomId");
        String timeSlotId = request.getParameter("timeSlotId");
        String customerName = request.getParameter("customerName");
        String customerPhone = request.getParameter("customerPhone");
        String seat = request.getParameter("seats");
        String startTime = request.getParameter("startTime");
        System.out.println(seat);
        int seatNumber = Integer.parseInt(seat);


        // Lấy thông tin của phim
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("movieId");
        int movieId = Integer.parseInt(id);

        // Tạo đối tượng ReservationService để xử lý
        ReservationService reservationService = new ReservationService();
        // Giả sử bạn có phương thức tạo đặt chỗ trong service
        reservationService.createReservation(roomId, timeSlotId,movieId, customerName, customerPhone, seatNumber);




        MovieService movieService = new MovieService();
        Movie movie = movieService.getMoviesById(movieId);

        // Lấy thông tin phòng và khung giờ từ cơ sở dữ liệu
        Room room = reservationService.getRoomById(roomId);

        // Truyền thông tin sang trang confirmation.jsp
        request.setAttribute("startTime", startTime);
        request.setAttribute("seats", seatNumber);
        request.setAttribute("movie", movie);
        request.setAttribute("room", room);
        request.setAttribute("seatNumber", seatNumber);
        request.setAttribute("customerName", customerName);
        request.setAttribute("customerPhone", customerPhone);

        // Chuyển hướng tới trang xác nhận
        request.getRequestDispatcher("users/page/confirmation.jsp").forward(request, response);
    }
}

package hcmuaf.nlu.edu.vn.quanlyxemphim.service;

import hcmuaf.nlu.edu.vn.quanlyxemphim.dao.reservation.ReservationDAO;
import hcmuaf.nlu.edu.vn.quanlyxemphim.model.Room;
import hcmuaf.nlu.edu.vn.quanlyxemphim.model.TimeSlot;

import java.sql.Time;
import java.time.LocalTime;

public class ReservationService {
    private final ReservationDAO reservationDAO;
    public ReservationService() {
        reservationDAO = new ReservationDAO();

    }

    public boolean createReservation(int userId,String roomId, String timeSlotId, int movieId, String customerName, String customerPhone, int seatNumber) {
            return  reservationDAO.createReservation(userId, roomId, timeSlotId, movieId, customerName, customerPhone, seatNumber);
    }

    public Room getRoomById(String roomId) {
        return reservationDAO.getRoomById(roomId);
    }

    public void updateReservationsStatus(int userId) {
        reservationDAO.updateReservationsStatus(userId);
    }




}

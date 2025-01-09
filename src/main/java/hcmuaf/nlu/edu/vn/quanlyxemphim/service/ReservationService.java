package hcmuaf.nlu.edu.vn.quanlyxemphim.service;

import hcmuaf.nlu.edu.vn.quanlyxemphim.dao.reservation.ReservationDAO;
import hcmuaf.nlu.edu.vn.quanlyxemphim.model.Room;
import hcmuaf.nlu.edu.vn.quanlyxemphim.model.TimeSlot;

public class ReservationService {
    private final ReservationDAO reservationDAO;
    public ReservationService() {
        reservationDAO = new ReservationDAO();

    }

    public boolean createReservation(String roomId, String timeSlotId, int movieId, String customerName, String customerPhone, int seatNumber) {
            return  reservationDAO.createReservation(roomId, timeSlotId, movieId, customerName, customerPhone, seatNumber);
    }

    public Room getRoomById(String roomId) {
        return reservationDAO.getRoomById(roomId);
    }

    public void updateReservationsStatus(String id, String status) {
        reservationDAO.updateReservationsStatus(id, status);
    }


}

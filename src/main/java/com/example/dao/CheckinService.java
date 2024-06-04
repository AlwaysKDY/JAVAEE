package com.example.dao;

import com.example.model.Attraction;
import com.example.model.CheckinRecord;
import com.example.model.Reservation;
import com.example.model.User;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Stateless
public class CheckinService {

    @PersistenceContext(unitName = "tourismPU")
    private EntityManager em;

    public List<CheckinRecord> getAllCheckinRecords() {
        return em.createQuery("SELECT c FROM CheckinRecord c", CheckinRecord.class).getResultList();
    }

    public boolean validateAndCheckin(int userId, Integer attractionId) {
        TypedQuery<Reservation> query;
        if (attractionId == 0) {  // if attractionId is 0, treat it as main entrance
            query = em.createQuery(
                    "SELECT r FROM Reservation r WHERE r.user.userId = :userId AND r.attraction.attractionId IS NULL AND r.date = CURRENT_DATE",
                    Reservation.class);
        } else {
            query = em.createQuery(
                    "SELECT r FROM Reservation r WHERE r.user.userId = :userId AND r.attraction.attractionId = :attractionId AND r.date = CURRENT_DATE",
                    Reservation.class);
            query.setParameter("attractionId", attractionId);
        }
        query.setParameter("userId", userId);
        List<Reservation> reservations = query.getResultList();

        String status;
        boolean checkedIn = false;

        if (reservations.isEmpty()) {
            status = "check-in failed: no valid reservation";
        } else {
            // Check time slot
            Reservation reservation = reservations.get(0);
            String timeSlot = reservation.getTimeSlot();
            if (isValidTimeSlot(timeSlot)) {
                status = "checked in";
                checkedIn = true;
            } else {
                status = "check-in failed: reservation expired";
            }
        }

        // Record the check-in result
        CheckinRecord record = new CheckinRecord();
        record.setUser(em.find(User.class, userId));
        record.setAttraction(attractionId != null ? em.find(Attraction.class, attractionId) : em.find(Attraction.class, 0));  // Setting attractionId to 0
        record.setCheckinTime(new Timestamp(System.currentTimeMillis()));
        record.setStatus(status);

        em.persist(record);

        return checkedIn;
    }

    private boolean isValidTimeSlot(String timeSlot) {
        try {
            String[] times = timeSlot.split("-");
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
            Date startTime = sdf.parse(times[0]);
            Date endTime = sdf.parse(times[1]);
            Date now = sdf.parse(sdf.format(new Date()));
            return now.after(startTime) && now.before(endTime);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}

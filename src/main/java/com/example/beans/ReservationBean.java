package com.example.beans;

import com.example.model.Reservation;
import com.example.model.User;
import jakarta.ejb.Stateful;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Stateful
public class ReservationBean {

    @PersistenceContext
    private EntityManager em;

    private final List<Reservation> reservations = new ArrayList<>();

    public void addReservation(Reservation reservation) {
        reservations.add(reservation);
    }

    public List<Reservation> getReservations() {
        return reservations;
    }

    public void clearReservations() {
        reservations.clear();
    }

    public void saveReservations() {
        for (Reservation reservation : reservations) {
            em.persist(reservation);
        }
        clearReservations();
    }

    public boolean hasGateReservation(User user, Date date) {
        String query = "SELECT COUNT(r) FROM Reservation r WHERE r.user = :user AND r.attraction IS NULL AND r.date = :date";
        Long count = em.createQuery(query, Long.class)
                .setParameter("user", user)
                .setParameter("date", date)
                .getSingleResult();
        return count > 0;
    }

    public void addGateReservation(User user, Date date) {
        Reservation gateReservation = new Reservation();
        gateReservation.setUser(user);
        gateReservation.setDate(date);
        gateReservation.setTimeSlot("09:00-10:00"); // 默认时间段
        addReservation(gateReservation);
    }
}

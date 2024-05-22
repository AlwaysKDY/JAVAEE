package com.example.beans;

import com.example.model.Reservation;

import jakarta.ejb.Stateful;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

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
}

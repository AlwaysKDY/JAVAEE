package com.example.servlet;

import com.example.model.Attraction;
import com.example.model.Reservation;
import com.example.model.User;
import com.example.beans.ReservationBean;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/reservation")
public class ReservationServlet extends HttpServlet {

    @EJB
    private ReservationBean reservationBean;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String message;
        try {
            User user = (User) req.getSession().getAttribute("user");
            int attractionId = Integer.parseInt(req.getParameter("attractionId"));
            Date date = Date.valueOf(req.getParameter("date"));
            String timeSlot = req.getParameter("timeSlot");

            Attraction attraction = new Attraction();
            attraction.setAttractionId(attractionId);

            Reservation reservation = new Reservation();
            reservation.setUser(user);
            reservation.setAttraction(attraction);
            reservation.setDate(date);
            reservation.setTimeSlot(timeSlot);

            reservationBean.addReservation(reservation);

            if (!reservationBean.hasGateReservation(user, date)) {
                reservationBean.addGateReservation(user, date);
            }

            reservationBean.saveReservations();

            message = "预约成功！";
        } catch (Exception e) {
            message = "预约失败：" + e.getMessage();
        }

        req.setAttribute("message", message);
        req.getRequestDispatcher("attractions.jsp").forward(req, resp);
    }
}

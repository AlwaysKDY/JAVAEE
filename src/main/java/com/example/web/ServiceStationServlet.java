package com.example.web;

import com.example.model.ServiceStation;
import com.example.service.ServiceStationService;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/service")
public class ServiceStationServlet extends HttpServlet {

    @EJB
    private ServiceStationService serviceStationService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ServiceStation> medicalStations = serviceStationService.getMedicalStations();
        List<ServiceStation> diningStations = serviceStationService.getDiningStations();
        req.setAttribute("medicalStations", medicalStations);
        req.setAttribute("diningStations", diningStations);
        req.getRequestDispatcher("service.jsp").forward(req, resp);
    }
}

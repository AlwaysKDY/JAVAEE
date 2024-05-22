package com.example.web;

import com.example.model.Attraction;
import com.example.service.AttractionService;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/attractions")
public class AttractionServlet extends HttpServlet {

    @EJB
    private AttractionService attractionService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Attraction> attractions = attractionService.getAllAttractions();
        req.setAttribute("attractions", attractions);
        req.getRequestDispatcher("attractions.jsp").forward(req, resp);
    }
}

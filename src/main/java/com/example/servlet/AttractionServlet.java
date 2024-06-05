package com.example.servlet;

import com.example.dao.AttractionDao;
import com.example.model.Attraction;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/attractions")
public class AttractionServlet extends HttpServlet {

    @Inject
    private AttractionDao attractionService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Attraction> attractions = attractionService.getAllAttractions();
        req.setAttribute("attractions", attractions);
        req.getRequestDispatcher("attractions.jsp").forward(req, resp);
    }
}

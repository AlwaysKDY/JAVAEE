package com.example.servlet;

import com.example.model.QueueStatus;
import com.example.model.Attraction;
import com.example.dao.QueueService;
import com.example.dao.AttractionDao;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet("/queue")
public class QueueServlet extends HttpServlet {

    @EJB
    private QueueService queueService;

    @EJB
    private AttractionDao attractionService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<QueueStatus> queueStatuses = queueService.getAllQueueStatuses();
        List<Attraction> attractions = attractionService.getAllAttractions();
        Map<Integer, String> attractionMap = attractions.stream().collect(Collectors.toMap(Attraction::getAttractionId, Attraction::getName));
        req.setAttribute("queueStatuses", queueStatuses);
        req.setAttribute("attractionMap", attractionMap);
        req.getRequestDispatcher("queue.jsp").forward(req, resp);
    }
}

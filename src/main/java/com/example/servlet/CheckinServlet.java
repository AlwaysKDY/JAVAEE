package com.example.servlet;

import com.example.model.CheckinRecord;
import com.example.dao.CheckinService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/checkin")
public class CheckinServlet extends HttpServlet {

    @Inject
    private CheckinService checkinService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CheckinRecord> checkinRecords = checkinService.getAllCheckinRecords();
        req.setAttribute("checkinRecords", checkinRecords);
        req.getRequestDispatcher("checkin.jsp").forward(req, resp);
    }
}

package com.example.servlet;

import com.example.model.TrafficInfo;
import com.example.model.WeatherInfo;
import com.example.dao.WeatherService;
import com.example.dao.TrafficService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.inject.Inject;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@jakarta.servlet.annotation.WebServlet("/111webservice")
public class WebServlet extends HttpServlet {

    @Inject
    private WeatherService weatherService;

    @Inject
    private TrafficService trafficService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, List<WeatherInfo>> weatherInfoMap = weatherService.getWeatherForecastByAttraction();
        List<TrafficInfo> trafficInfoList = trafficService.getAllTrafficInfo();

        request.setAttribute("weatherInfoMap", weatherInfoMap);
        request.setAttribute("trafficInfoList", trafficInfoList);

        request.getRequestDispatcher("webservice.jsp").forward(request, response);
    }
}

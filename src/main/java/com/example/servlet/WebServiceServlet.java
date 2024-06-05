package com.example.servlet;

import com.example.model.TrafficInfo;
import com.example.model.WeatherInfo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.core.GenericType;
import jakarta.ws.rs.core.MediaType;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet("/webservice")
public class WebServiceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Client client = ClientBuilder.newClient();

        List<TrafficInfo> trafficInfoList = client.target("http://localhost:8080/JAVAEE-1.0-SNAPSHOT/api/traffic")
                .request(MediaType.APPLICATION_JSON)
                .get(new GenericType<List<TrafficInfo>>() {});

        Map<String, List<WeatherInfo>> weatherInfoMap = client.target("http://localhost:8080/JAVAEE-1.0-SNAPSHOT/api/weather")
                .request(MediaType.APPLICATION_JSON)
                .get(new GenericType<List<WeatherInfo>>() {})
                .stream()
                .collect(Collectors.groupingBy(w -> w.getAttraction().getName()));

        request.setAttribute("trafficInfoList", trafficInfoList);
        request.setAttribute("weatherInfoMap", weatherInfoMap);
        request.getRequestDispatcher("info.jsp").forward(request, response);
    }
}

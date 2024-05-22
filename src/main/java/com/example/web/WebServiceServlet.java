package com.example.web;

import com.example.model.WeatherInfo;
import com.example.model.TrafficInfo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.GenericType;
import jakarta.ws.rs.core.MediaType;
import java.io.IOException;
import java.util.List;

@WebServlet("/webservice")
public class WebServiceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Client client = ClientBuilder.newClient();

        // 调用天气服务
        WebTarget weatherTarget = client.target("http://localhost:8080/JAVAEE-1.0-SNAPSHOT/rest/weather/forecast");
        List<WeatherInfo> weatherInfoList = weatherTarget.request(MediaType.APPLICATION_JSON).get(new GenericType<List<WeatherInfo>>() {});
        request.setAttribute("weatherInfoList", weatherInfoList);

        // 调用交通服务
        WebTarget trafficTarget = client.target("http://localhost:8080/JAVAEE-1.0-SNAPSHOT/rest/traffic/info");
        List<TrafficInfo> trafficInfoList = trafficTarget.request(MediaType.APPLICATION_JSON).get(new GenericType<List<TrafficInfo>>() {});
        request.setAttribute("trafficInfoList", trafficInfoList);

        request.getRequestDispatcher("webservice.jsp").forward(request, response);
    }
}

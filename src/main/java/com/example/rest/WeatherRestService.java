package com.example.rest;

import com.example.model.WeatherInfo;
import com.example.dao.WeatherService;
import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import java.util.List;

@Path("/weather")
public class WeatherRestService {

    @Inject
    private WeatherService weatherService;

    @GET
    @Path("/forecast")
    @Produces(MediaType.APPLICATION_JSON)
    public List<WeatherInfo> getWeatherForecast() {
        return (List<WeatherInfo>) weatherService.getWeatherForecastByAttraction();
    }
}
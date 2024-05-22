package com.example.service;

import com.example.model.WeatherInfo;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

@Stateless
public class WeatherService {

    @PersistenceContext(unitName = "tourismPU")
    private EntityManager em;

    public List<WeatherInfo> getWeatherForecast() {
        String query = "SELECT w FROM WeatherInfo w";
        return em.createQuery(query, WeatherInfo.class).getResultList();
    }
}

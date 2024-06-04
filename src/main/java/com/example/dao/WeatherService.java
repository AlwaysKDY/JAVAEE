package com.example.dao;

import com.example.model.WeatherInfo;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Stateless
public class WeatherService {

    @PersistenceContext(unitName = "tourismPU")
    private EntityManager em;

    public Map<String, List<WeatherInfo>> getWeatherForecastByAttraction() {
        List<WeatherInfo> weatherList = em.createQuery("SELECT w FROM WeatherInfo w", WeatherInfo.class).getResultList();
        return weatherList.stream().collect(Collectors.groupingBy(w -> w.getAttraction().getName()));
    }
}

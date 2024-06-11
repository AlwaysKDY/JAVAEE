package com.example.dao;

import com.example.model.WeatherInfo;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Stateless
public class WeatherService {

    @PersistenceContext(unitName = "tourismPU")
    private EntityManager em;

    public Map<String, List<WeatherInfo>> getWeatherForecastByAttraction() {
        LocalDate today = LocalDate.now();
        LocalDate sevenDaysLater = today.plusDays(7);

        List<WeatherInfo> weatherList = em.createQuery(
                        "SELECT w FROM WeatherInfo w WHERE w.weatherDate >= :start AND w.weatherDate < :end", WeatherInfo.class)
                .setParameter("start", Date.valueOf(today))
                .setParameter("end", Date.valueOf(sevenDaysLater))
                .getResultList();

        return weatherList.stream().collect(Collectors.groupingBy(w -> w.getAttraction().getName()));
    }
}

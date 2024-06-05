package com.example.dao;

import com.example.model.WeatherInfo;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

public class WeatherDao {

    @PersistenceContext
    private EntityManager entityManager;

    public List<WeatherInfo> getWeatherInfoByAttraction(int attractionId) {
        return entityManager.createQuery("SELECT w FROM WeatherInfo w WHERE w.attraction.attractionId = :attractionId", WeatherInfo.class)
                .setParameter("attractionId", attractionId)
                .getResultList();
    }
}

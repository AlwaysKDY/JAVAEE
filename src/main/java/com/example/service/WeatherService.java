package com.example.service;

import com.example.dao.WeatherDao;
import com.example.model.WeatherInfo;

import jakarta.ejb.Stateless;
import jakarta.inject.Inject;
import java.util.List;

@Stateless
public class WeatherService {

    @Inject
    private WeatherDao weatherDao;

    public List<WeatherInfo> getWeatherInfoByAttraction(int attractionId) {
        return weatherDao.getWeatherInfoByAttraction(attractionId);
    }
}

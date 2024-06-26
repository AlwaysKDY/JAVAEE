package com.example.model;

import jakarta.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "weather")
public class WeatherInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "weather_id", nullable = false)
    private int weatherId;

    @ManyToOne
    @JoinColumn(name = "attraction_id", nullable = false)
    private Attraction attraction;

    @Column(name = "weather_date", nullable = false)
    private Timestamp weatherDate;

    @Column(name = "temperature", nullable = false)
    private double temperature;

    @Column(name = "description", nullable = false)
    private String description;

    @Column(name = "update_time", nullable = false)
    private Timestamp updateTime;

    public int getWeatherId() {
        return weatherId;
    }

    public void setWeatherId(int weatherId) {
        this.weatherId = weatherId;
    }

    public Attraction getAttraction() {
        return attraction;
    }

    public void setAttraction(Attraction attraction) {
        this.attraction = attraction;
    }

    public Timestamp getWeatherDate() {
        return weatherDate;
    }

    public void setWeatherDate(Timestamp weatherDate) {
        this.weatherDate = weatherDate;
    }

    public double getTemperature() {
        return temperature;
    }

    public void setTemperature(double temperature) {
        this.temperature = temperature;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }
}

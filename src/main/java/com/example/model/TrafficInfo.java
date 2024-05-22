package com.example.model;

import jakarta.persistence.*;

@Entity
@Table(name = "traffic")
public class TrafficInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "traffic_id", nullable = false)
    private int trafficId;

    @Column(name = "route", nullable = false)
    private String route;

    // Getters and Setters
    public int getTrafficId() {
        return trafficId;
    }

    public void setTrafficId(int trafficId) {
        this.trafficId = trafficId;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }
}

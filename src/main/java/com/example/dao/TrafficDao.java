package com.example.dao;

import com.example.model.TrafficInfo;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

public class TrafficDao {

    @PersistenceContext
    private EntityManager entityManager;

    public List<TrafficInfo> getAllTrafficInfo() {
        return entityManager.createQuery("SELECT t FROM TrafficInfo t", TrafficInfo.class).getResultList();
    }
}

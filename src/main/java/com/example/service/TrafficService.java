package com.example.service;

import com.example.model.TrafficInfo;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

@Stateless
public class TrafficService {

    @PersistenceContext(unitName = "tourismPU")
    private EntityManager em;

    public List<TrafficInfo> getAllTrafficInfo() {
        String query = "SELECT t FROM TrafficInfo t";
        return em.createQuery(query, TrafficInfo.class).getResultList();
    }
}
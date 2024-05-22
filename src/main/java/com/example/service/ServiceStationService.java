package com.example.service;

import com.example.model.ServiceStation;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

@Stateless
public class ServiceStationService {

    @PersistenceContext
    private EntityManager em;

    public List<ServiceStation> getMedicalStations() {
        return em.createQuery("SELECT s FROM ServiceStation s WHERE s.type = 'medical'", ServiceStation.class).getResultList();
    }

    public List<ServiceStation> getDiningStations() {
        return em.createQuery("SELECT s FROM ServiceStation s WHERE s.type = 'dining'", ServiceStation.class).getResultList();
    }
}

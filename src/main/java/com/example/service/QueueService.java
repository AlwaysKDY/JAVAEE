package com.example.service;

import com.example.model.QueueStatus;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

@Stateless
public class QueueService {

    @PersistenceContext
    private EntityManager em;

    public List<QueueStatus> getAllQueueStatuses() {
        return em.createQuery("SELECT q FROM QueueStatus q", QueueStatus.class).getResultList();
    }
}

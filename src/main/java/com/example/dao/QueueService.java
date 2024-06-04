package com.example.dao;

import com.example.model.QueueStatus;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.sql.Timestamp;
import java.util.List;
import java.util.Random;

@Stateless
public class QueueService {

    @PersistenceContext
    private EntityManager em;

    public List<QueueStatus> getAllQueueStatuses() {
        List<QueueStatus> queueStatuses = em.createQuery("SELECT q FROM QueueStatus q", QueueStatus.class).getResultList();
        Random random = new Random();

        queueStatuses.forEach(queueStatus -> {
            queueStatus.setUpdateTime(new Timestamp(System.currentTimeMillis()));

            int currentQueueLength = queueStatus.getQueueLength();
            int change = random.nextInt(21) - 10;
            int newQueueLength = currentQueueLength + change;
            newQueueLength = Math.max(10, Math.min(300, newQueueLength));

            queueStatus.setQueueLength(newQueueLength);
            em.merge(queueStatus);
        });
        em.flush();
        return queueStatuses;
    }
}


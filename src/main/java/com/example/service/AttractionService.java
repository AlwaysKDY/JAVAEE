package com.example.service;

import com.example.model.Attraction;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

@Stateless
public class AttractionService {

    @PersistenceContext
    private EntityManager em;

    public List<Attraction> getAllAttractions() {
        return em.createQuery("SELECT a FROM Attraction a", Attraction.class).getResultList();
    }
}

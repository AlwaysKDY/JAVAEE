package com.example.dao;

import com.example.model.Attraction;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

@Stateless
public class AttractionDao {

    @PersistenceContext
    private EntityManager em;

    public List<Attraction> getAllAttractions() {
        return em.createQuery("SELECT a FROM Attraction a", Attraction.class).getResultList();
    }
}

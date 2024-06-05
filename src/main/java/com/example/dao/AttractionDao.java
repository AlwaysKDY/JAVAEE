package com.example.dao;

import com.example.model.Attraction;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

@Stateless
public class AttractionDao {

    @PersistenceContext
    private EntityManager entityManager;

    public List<Attraction> getAllAttractions() {
        return entityManager.createQuery("SELECT a FROM Attraction a", Attraction.class).getResultList();
    }

    public Attraction getAttractionById(int id) {
        return entityManager.find(Attraction.class, id);
    }
}

package com.example.service;

import com.example.dao.TrafficDao;
import com.example.model.TrafficInfo;

import jakarta.ejb.Stateless;
import jakarta.inject.Inject;
import java.util.List;

@Stateless
public class TrafficService {

    @Inject
    private TrafficDao trafficDao;

    public List<TrafficInfo> getAllTrafficInfo() {
        return trafficDao.getAllTrafficInfo();
    }
}

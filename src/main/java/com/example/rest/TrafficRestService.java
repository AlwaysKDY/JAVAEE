package com.example.rest;

import com.example.model.TrafficInfo;
import com.example.service.TrafficService;
import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import java.util.List;

@Path("/traffic")
public class TrafficRestService {

    @Inject
    private TrafficService trafficService;

    @GET
    @Path("/info")
    @Produces(MediaType.APPLICATION_JSON)
    public List<TrafficInfo> getTrafficInfo() {
        return trafficService.getAllTrafficInfo();
    }
}
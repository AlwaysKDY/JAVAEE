package com.example.model;

import jakarta.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;

@Entity
@Table(name = "checkin_records")
public class CheckinRecord implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "checkin_id", nullable = false)
    private int checkinId;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne
    @JoinColumn(name = "attraction_id", nullable = false)
    private Attraction attraction;

    @Column(name = "checkin_time", nullable = false)
    private Timestamp checkinTime;

    @Column(name = "status", nullable = false)
    private String status;

    // Getters and Setters
    public int getCheckinId() {
        return checkinId;
    }

    public void setCheckinId(int checkinId) {
        this.checkinId = checkinId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Attraction getAttraction() {
        return attraction;
    }

    public void setAttraction(Attraction attraction) {
        this.attraction = attraction;
    }

    public Timestamp getCheckinTime() {
        return checkinTime;
    }

    public void setCheckinTime(Timestamp checkinTime) {
        this.checkinTime = checkinTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

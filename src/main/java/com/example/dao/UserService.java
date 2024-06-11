package com.example.dao;

import com.example.model.User;
import com.example.util.PasswordEncryptor;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.sql.Timestamp;
import java.util.List;

@Stateless
public class UserService {

    @PersistenceContext(unitName = "tourismPU")
    private EntityManager em;

    public void registerUser(User user) {
        user.setPassword(user.getPassword());
        user.setRegistrationDate(new Timestamp(System.currentTimeMillis()));
        em.persist(user);
    }

    public User findUserByUsername(String username) {
        try {
            return em.createQuery("SELECT u FROM User u WHERE u.username = :username", User.class)
                    .setParameter("username", username)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    public User findUserByEmail(String email) {
        try {
            return em.createQuery("SELECT u FROM User u WHERE u.email = :email", User.class)
                    .setParameter("email", email)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }


    public User findUserByPhoneNumber(String phoneNumber) {
        try {
            return em.createQuery("SELECT u FROM User u WHERE u.phoneNumber = :phoneNumber", User.class)
                    .setParameter("phoneNumber", phoneNumber)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    public List<User> findAllUsers() {
        return em.createQuery("SELECT u FROM User u", User.class).getResultList();
    }

    public void updateUser(User user) {
        em.merge(user);
    }

    public boolean verifyUser(String username, String password) {
        User user = findUserByUsername(username);
        return user != null && PasswordEncryptor.verify(password, user.getPassword());
    }

    public User findUserByEmailAndRecoveryKey(String email, String recoveryKey) {
        try {
            return em.createQuery("SELECT u FROM User u WHERE u.email = :email AND u.recoveryKey = :recoveryKey", User.class)
                    .setParameter("email", email)
                    .setParameter("recoveryKey", recoveryKey)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
}

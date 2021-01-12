/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import model.Users;

/**
 *
 * @author Administrator
 */
public class userDB {

    public static List<Users> getAllUsers() {

        EntityManagerFactory factory = Persistence.createEntityManagerFactory("user");
        EntityManager entityManager = factory.createEntityManager();
        String sql = "SELECT user  FROM Users user";
        Query query = entityManager.createQuery(sql);
        List<Users> listUsers = (List<Users>) query.getResultList();
        entityManager.close();

        return listUsers;

    }

    public static void addUser(Users user) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("user");
        EntityManager entityManager = factory.createEntityManager();
        EntityTransaction eTrans = entityManager.getTransaction();
        eTrans.begin();
        entityManager.persist(user);
        eTrans.commit();
        entityManager.close();
    }

    public static void deleteUser(Users user) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("user");
        EntityManager entityManager = factory.createEntityManager();
        EntityTransaction eTrans = entityManager.getTransaction();
        eTrans.begin();
        entityManager.remove(user);
        eTrans.commit();
        entityManager.close();
    }

    public static void updateUser(Users user) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("user");
        EntityManager entityManager = factory.createEntityManager();
        EntityTransaction eTrans = entityManager.getTransaction();
        eTrans.begin();
        entityManager.merge(user);
        eTrans.commit();
        entityManager.close();
    }
}

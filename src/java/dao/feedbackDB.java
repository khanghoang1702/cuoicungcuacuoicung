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
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import model.Feedback;
import model.Items;

/**
 *
 * @author tmh
 */
public class feedbackDB {

    public static List<Feedback> lookUp(List<Feedback> listFeedback, String itemID) {

        for (Feedback fb : listFeedback) {
            String ID = fb.getItemID().getItemID();
            if (itemID.equals(ID)) {
                return listFeedback;
            }
        }
        return null;
    }

   

    public static boolean insertComment(Feedback fb) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("item");
        EntityManager entityManager = factory.createEntityManager();
        EntityTransaction eTrans = entityManager.getTransaction();
        try {
            eTrans.begin();
            entityManager.persist(fb);
            eTrans.commit();
            return true;
        } catch (NoResultException e) {
            return false;
        } finally {
            entityManager.close();
        }
    }

    public static List<Feedback> getListFeedback() {
        EntityManagerFactory em = Persistence.createEntityManagerFactory("item");
        EntityManager entityManager = em.createEntityManager();
        String qString = "SELECT fb FROM Feedback fb";
        TypedQuery<Feedback> q = entityManager.createQuery(qString, Feedback.class);
        try {
            List<Feedback> listFeedback = q.getResultList();
            return listFeedback;

        } catch (NoResultException e) {
            return null;
        } finally {
            entityManager.close();
        }
    }
 public static List<Feedback> getListFeedbackByID(String id) {
        EntityManagerFactory em = Persistence.createEntityManagerFactory("item");
        EntityManager entityManager = em.createEntityManager();
        String qString = "SELECT fb FROM Feedback fb WHERE fb.itemID =: id";
        TypedQuery<Feedback> q = entityManager.createQuery(qString, Feedback.class);
        q.setParameter("id",id);
        try {
            List<Feedback> listFeedback = q.getResultList();
            return listFeedback;

        } catch (NoResultException e) {
            return null;
        } finally {
            entityManager.close();
        }
    }

  

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.ItemDB;
import dao.feedbackDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Feedback;
import model.Items;
import model.Users;

/**
 *
 * @author tmh
 */
@WebServlet(urlPatterns = {"/Classify", "/Search", "/Product", "/commentSubmit"})

public class Controller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {

        String action = request.getServletPath();
        switch (action) {
            case "/Classify":
                Classify(request, response);
                break;
            case "/Search":
                Search(request, response);
                break;
            case "/Product":
                Product(request, response);
                break;
            case "/commentSubmit":
                commentSubmit(request, response);
                break;
            default:
                break;
        }

    }

    protected void commentSubmit(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String comment = request.getParameter("comment");
        HttpSession session = request.getSession();
        Date date = new Date();
        List<Feedback> currentListFeedback = feedbackDB.getListFeedback();
        Users currentUser = (Users) session.getAttribute("User");
        Items currentItem = (Items) session.getAttribute("Product");
        Feedback newFeedback = new Feedback(comment, date, currentUser, currentItem);
        boolean check = feedbackDB.insertComment(newFeedback);
        if (check) {
            session.setAttribute("listFeedback", feedbackDB.getListFeedbackByID(currentItem.getItemID()));
            response.sendRedirect("product.jsp");

        }

    }

    protected void Product(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        String itemID = request.getParameter("product");
        List<Items> listItems = (List<Items>) session.getAttribute("listItems");
        Items item = new Items();
        item = Items.lookUp(listItems, itemID);
        List<Feedback> listProductFeedback = feedbackDB.lookUp(feedbackDB.getListFeedbackByID(item.getItemID()), itemID);
        session.setAttribute("Product", item);
//        session.setAttribute("User", listProductFeedback.get(0).getUserID());
        if (listProductFeedback == null) {
            session.setAttribute("listFeedback", null);

        } else {
            session.setAttribute("listFeedback", listProductFeedback);
        }

        response.sendRedirect("product.jsp");
    }

    protected void Search(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        HttpSession session = request.getSession();
        String itemName = request.getParameter("search-input");
        List<Items> listItems = ItemDB.Search(itemName);
        session.setAttribute("listItems", listItems);
        response.sendRedirect("homepage.jsp");

    }

    protected void Classify(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        HttpSession session = request.getSession();
        String itemName = request.getParameter("cate");
        List<Items> listItems = ItemDB.Search(itemName);
        session.setAttribute("listItems", listItems);
        response.sendRedirect("homepage.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

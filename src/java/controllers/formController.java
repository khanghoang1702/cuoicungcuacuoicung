/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.userDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;

/**
 *
 * @author tmh
 */
@WebServlet(urlPatterns = {"/logIn", "/Register"})
public class formController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getServletPath();
            switch (action) {
                case "/logIn":
                    logIn(request, response);
                    break;
                case "/Register":
                    Register(request, response);
                    break;
                default:
                    break;
            }

        }
    }

    protected void logIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String password = request.getParameter("Password");
        String id = request.getParameter("nameId");
        Users user = userDB.getUserName(id, password);
        if (user == null) {
            String inputError = "Input incorrect, please try again";
            session.setAttribute("inputError", inputError);
        }
        session.setAttribute("User", user);
        response.sendRedirect("homepage.jsp");

    }

    protected void Register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String fullName = request.getParameter("fullname");
        String nameId = request.getParameter("id");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone");

        Users user = new Users(fullName, nameId, password, email, address, phoneNumber);
        boolean check = userDB.signUpAccount(user);
        if (check) {
            session.setAttribute("Message", "Register successully ");
            response.sendRedirect("signIn.jsp");
        } else {
            session.setAttribute("Message", "Register unsuccessully ");
             response.sendRedirect("signUp.jsp");

        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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

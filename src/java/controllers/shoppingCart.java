/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Items;
import model.cartItem;

/**
 *
 * @author LEQUANGHUY
 */
@WebServlet(urlPatterns = {"/add-to-cart", "/remove-item", "/update-item", "/buy-now", "/checkout", "/Usure"})
public class shoppingCart extends HttpServlet {

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
            throws ServletException, IOException {
        String action = request.getServletPath();
        switch (action) {
            case "/add-to-cart":
                addToCart(request, response);
                break;
            case "/buy-now":
                addToCart(request, response);
                break;
            case "/remove-item":

                removeItem(request, response);

                break;
            case "/update-item":
                updateItem(request, response);
                break;
            case "/Usure":
                Usure(request, response);
                break;
            case "/checkout":
                checkout(request, response);
                break;
            default:
                break;
        }
        if ("/add-to-cart".equals(action)) {
            response.sendRedirect("homepage.jsp");
        } else if ("/checkout".equals(action)) {
            response.sendRedirect("thank.jsp");
        } else {
            response.sendRedirect("shoppingCart.jsp");
        }
    }

    protected void addToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Items> listItems = (List<Items>) session.getAttribute("listItems");
        String productCode = request.getParameter("code");
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
            cart.addProduct(Cart.lookUp(listItems, productCode));
            session.setAttribute("cart", cart);
        } else {
            cartItem item = Cart.lookUpCart(cart.getList(), productCode);
            if (item != null) {
                item.setQuantity(item.getQuantity() + 1);

            } else {
                cart.addProduct(cart.lookUp(listItems, productCode));
            }
        }

    }

    protected void removeItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String productCode = request.getParameter("code");
        Cart cart = (Cart) session.getAttribute("cart");
        cart.removeProduct(cart.lookUpCart(cart.getList(), productCode));

    }

    protected void updateItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String productCode = request.getParameter("code");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Cart cart = (Cart) session.getAttribute("cart");
        cart.updateQuantity(cart.lookUpCart(cart.getList(), productCode), quantity);
    }

    protected void checkout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("cart", null);

    }

    protected void Usure(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        String productCode = request.getParameter("code");
        String check = request.getParameter(productCode);
        cartItem item = cart.lookUpCart(cart.getList(), productCode);
        if ("Nope".equals(check)) {
            item.setChecked(true);
        } else {
            item.setChecked(false);
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

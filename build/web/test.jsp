<%--
    Document   : test
    Created on : Jan 5, 2021, 12:08:22 PM
    Author     : LEQUANGHUY
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.*" %>
<%@page import = "javax.util.*" %>
<%@page import = "dao.*" %>
<%@page import = "javax.persistence.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <%
            List<Items> listItems = ItemDB.getAllItems();
        %>
        <div class="items-container">
            <% for (Items item : listItems) {%>
            <div class="items">
                <img src="<%= item.getItemImageData()%>" alt="Fish here">
                <div class="btnitem">
                    <h1><%=item.getItemName()%></h1>
                    <p class="price"><%=item.getItemPrice()%> </p>
                    <div class="btnPurchase">
                        <input type="button" class="btn btn-primary mr-2" value="Add to cart">
                        <input type="button" class="btn btn-outline-primary " value="Buy now">
                    </div>
                </div>


            </div>

            <% }%>
        </div>
    </body>
</html>

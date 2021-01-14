<%@page import="java.util.List"%>
<%@page import="model.cartItem"%>
<%@page import="model.Items"%>
<%@page import="model.Cart"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/shoppingCart.css">
    </head>
    <body>
        <div class="wrap cf">
            <h1 class="projTitle">Pay<span>-your bill</span> Shopping Cart</h1>
            <div class="heading cf">
                <h1>My Cart</h1>
                <a href="homepage.jsp" class="continue">Continue Shopping</a>
            </div>
            <div class="cart">
                <!--    <ul class="tableHead">
                      <li class="prodHeader">Product</li>
                      <li>Quantity</li>
                      <li>Total</li>
                       <li>Remove</li>
                    </ul>-->
                <ul class="cartWrap">

                    <%
                        Cart cart = (Cart) session.getAttribute("cart");
                        List<cartItem> listIcart = cart.getList();
                        for (cartItem iCart : listIcart) {
                            Items item = iCart.getItem();
                    %>

                    <li class="items <%if (listIcart.indexOf(iCart) % 2 == 0) {%>
                        even
                        <%} else {%>
                        odd
                        <%}%>">


                        <div class="infoWrap">
                            <form action="Usure" class="formCB">
                                <h3>YOU SURE??</h3>
                                <input type="submit" name="<%=item.getItemID()%>" <%if (iCart.isChecked()) {%>
                                       class="btn-on"
                                       value="Yeah"
                                       <%} else {%>
                                       class="btn-off"
                                       value="Nope"
                                       <%}%> />
                                <input type="hidden" value="<%=item.getItemID()%>" name ="code">
                            </form>
                            <div class="cartSection">

                                <img src="<%=item.getItemImageData()%>" alt="" class="itemImg" />
                                <p class="itemNumber"><%=item.getItemID()%></p>
                                <h3><%=item.getItemName()%></h3>
                                <form action="update-item">
                                    <p> <input type="number" min="1"  class="qty" name="quantity" value="<%=iCart.getQuantity()%>"/>

                                        <input type="submit"  class="update" value="U">
                                        <input type="hidden" value="<%=item.getItemID()%>" name ="code">
                                        x $<%=item.getItemPrice()%></p>
                                </form>


                                <p class="stockStatus"> In Stock</p>
                            </div>






                            <div class="prodTotal cartSection">
                                <p>$<%=item.getItemPrice() * iCart.getQuantity()%></p>
                            </div>
                            <div class="cartSection removeWrap">
                                <form action="remove-item">

                                    <input type="submit"  class="remove" value="x">
                                    <input type="hidden" value="<%=item.getItemID()%>" name ="code">

                                </form>

                                <!--<a href="#" class="remove">x</a>-->
                            </div>
                        </div>
                    </li>
                    <% }%>


                </ul>
            </div>

            <div class="promoCode"><label for="promo">Have A Promo Code?</label><input type="text" name="promo" placholder="Enter Code" />
                <a href="#" class="btn"></a></div>

            <div class="subtotal cf">
                <ul>
                    <!--                    <li class="totalRow"><span class="label">Subtotal</span><span class="value">$35.00</span></li>

                                        <li class="totalRow"><span class="label">Shipping</span><span class="value">$5.00</span></li>

                                        <li class="totalRow"><span class="label">Tax</span><span class="value">$4.00</span></li>-->
                    <li class="totalRow final"><span class="label">Total</span><span class="value">$<%=cart.getTotalCost()%></span></li>
                    <li class="totalRow">


                        <a href="/webproject/checkout" class="btn continue"> Check out</a>

                    </li>
                </ul>
            </div>
        </div>




        <script src="JS/shoppingCart.js"></script>
    </body>
</html>

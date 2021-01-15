<%@page import="java.util.List"%>
<%@page import="model.Feedback"%>
<%@page import="model.Users"%>
<%@page import="model.Items"%>
<!DOCTYPE html>

<head>
    <title>Aquarium Store</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous" />


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.css" />
    <link rel="stylesheet" href="CSS/logo.css" />
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

    <link rel="stylesheet" type="text/css" href="CSS/style.css" />
</head>

<body>
    <% Items product = (Items) session.getAttribute("Product");
    int size;
        List<Feedback> listFeedback = (List<Feedback>) session.getAttribute("listFeedback");
        if(listFeedback==null)
        {
            size=0;
        }
        else
        {
            size=listFeedback.size();
        }
         
            
    %>
       <!-- Header -->
        <div id="header">
            <div class="banner-bg"></div>

            <div class="h-container">
                <div class="h-left">
                    <ul>
                        <li><a href="signIn.jsp">SIGN IN</a></li>
                        <li><a href="signUp.jsp">SIGN UP</a></li>
                        <li><a href="#">CONTACT</a></li>
                    </ul>
                </div>
                <div class="h-right">
                    <span><a href="#"><i class="fab fa-facebook-square"></i></a></span>
                    <span><a href="#"><i class="fab fa-instagram-square"></i></a></span>
                    <span><a href="#"><i class="fab fa-google-plus-square"></i></a></span>
                </div>
            </div>
            <div class="h-banner">
                <div class="banner-content">
                    <h1></h1>
                    <a class="" href="#navigation"><button class="btnToProducts"><i class="fas fa-fish"></i>

                        </button></a>
                </div>
            </div>
        </div>

        <!-- NavBar -->
        <nav class="myNavbar navbar navbar-expand-xl navbar-light sticky-top pr-1" id="navigation">
            <a class="navbar-brand" href="#">
                <div class="logo">
                    <div class="image-Logo"></div>
                    <div class="brand">
                        <h1>7COLORS</h1>
                        <h1>7COLORS</h1>
                    </div>
                </div>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" id="navlink" href="#">HOME <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" id="navlink1" href="#specialfish" aria-haspopup="true" aria-expanded="false">
                            FISH
                        </a>

                    </li>

                    <li class="nav-item">
                        <a class="nav-link" id="navlink2" href="#aquaknow">AQUATIC KNOWLEDGE</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="navlink2" href="#about-us">About</a>
                    </li>

                </ul>


                <%
                    Users user = (Users) session.getAttribute("User");

                    if (user == null) {
                        user = new Users();

                        user.setUserName(" ");
//                        user.setUserID("003");
//                        user.setUserNameID("hoang");
//                        user.setUserPassword("1");
                    }

                %>
                <div class="nav-item dropdown ">
                    <a class="nav-link dropdown-toggle tab" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-id-badge"></i>  <%=user.getUserName()%>
                    </a>
                    <div class="dropdown-menu tab-menu" aria-labelledby="navbarDropdown">
                        <p class="dropdown-item" href="#"><i class="fas fa-shopping-cart"></i> My Cart 
                        </p>
                        <p class="dropdown-item" href="#"><i class="fas fa-user"></i>  Type: <% if ("admin".equals(user.getUserNameID())) { %>
                            Admin
                            <% } else { %>
                            User <% } %>
                        </p>
                        <div  class="dropdown-divider tab-divide"></div>
                        <a class="dropdown-item" href="#"><% if ("admin".equals(user.getUserNameID())) { %>
                            <i class="fas fa-users-cog"></i>  Admin Page <% } %>
                        </a>
                        <% if ((Users) session.getAttribute("User") != null) {%>

                        <a  href="/webproject/logOut" class="dropdown-item" href="#"><i class="fas fa-sign-out-alt"></i> Log out</a>
                        <% } %>

                    </div>
                </div>



                    
            </div>
        </nav>
        <!--End NavBar -->
    <div class="row contents">

        <div style="margin-top:30px" class="">
            <div class="product-left">
                <h1><%=product.getItemName()%> </h1>
                <div class="star-icon">
                    <i class="fa fa-star checked"></i>
                    <i class="fa fa-star checked"></i>
                    <i class="fa fa-star checked"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                </div>
                <div class="img-magnifier-container "  onmouseover="MoveOn()" onmouseout ="MoveOut()">
                    <img id="myimage" width="600" height="400" src="<%= product.getItemImageData()%>">

                </div>

            </div>
            <div class="product-right">
                <p class="price"><%= product.getItemPrice()%></p>
                <i style="color:rgb(255, 102, 0);font-size: 40px;" class="fas fa-exclamation-triangle">
                </i>

                <span class="describe" style="font-family:Impact
                      Charcoal;color:red;margin-left:5px;text-transform: uppercase;font-weight:bold;font-weight: 100px;">
                    Your live fish may not match the image shown due to natural
                    variations in each species. Each companion animal is different in shape, color, and
                    personality.</span>
                <div class="select-holder">
                    <p style="margin-bottom: 0;margin-left:5px">Size</p>
                    <select style="width:100%;" clas="" name="">
                        <option>Small</option>
                        <option>Large</option>

                    </select>
                </div>
                <div style="border:2px solid black;width:30%;height:38px;float:left;display: flex;justify-content: space-between;"
                     class="product-add">

                    <i style="cursor:pointer;padding-top:10px;padding-left:10px" onClick="Plus()"
                       class="fa fa-plus "></i>
                    <input id="quantity" style="padding-left:20px;width:35%;font-size:30px;font-weight: bold;" value="1"
                           type="number" disabled min="1" max="999">
                    <i style="padding-top:10px;cursor:pointer;padding-right:30px" onClick="Minus()"
                       class="fa fa-minus pt-2"></i>



                </div>
                <input style="width:70%" class="btn btn-dark" type="submit" value="ADD TO CART">

            </div>

        </div>
    </div>
    <div>
        <section class="feedback content-item" id="comments">
            <div class=" container">   
                <div class="row">
                    <div class="col-sm-8">   
                        <form action="commentSubmit" >
                            <h3 class="pull-left">New Comment</h3>
                            <button type="submit" class="btn btn-normal pull-right">Submit</button>
                            <fieldset>
                                <div class="row">
                                    <div class="col-sm-3 col-lg-2 hidden-xs">
                                        <img class="img-responsive" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                                    </div>
                                    <div class="form-group col-xs-12 col-sm-9 col-lg-10">
                                        <textarea name="comment"class="form-control" id="message" placeholder="Your message" required=""></textarea>
                                    </div>
                                </div>  	
                            </fieldset>
                        </form>

                        <h3> Feedback: <%= size %> </h3>

                        <!-- COMMENT 1 - START -->
                        <% for (int i=size-1;i>=0;i--) {%>
                        <div class="media">
                            <a class="pull-left" href="#"><img class="media-object" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt=""></a>
                            <div class="media-body">
                                <h4 class="media-heading"><%=listFeedback.get(i).getUserID().getUserName() %>></h4>
                                <p><%= listFeedback.get(i).getFeedbackContent()%></p>
                                <ul class="list-unstyled list-inline media-detail pull-left">
                                    <li><i class="fa fa-calendar"></i><%=listFeedback.get(i).getDateCreated()%></li>
                                    <li><i class="fa fa-thumbs-up"></i>13</li>
                                </ul>
                                <ul class="list-unstyled list-inline media-detail pull-right">
                                    <li class=""><a href="">Like</a></li>
                                    <li class=""><a href="">Reply</a></li>
                                </ul>
                            </div>
                        </div>
                        <% }%>
                        <!-- COMMENT 1 - END -->



                    </div>
                </div>
            </div>
        </section>
        <footer style="margin-top:100px" class="page-footer font-small footerne pt-4">
            <!-- Footer Links -->
            <div class="container-fluid text-center text-md-left">

                <!-- Grid row -->
                <div class="row">
                    <!-- Grid column -->

                    <div class="col-md-3 mt-md-0 mt-3">
                        <!-- Content -->
                        <div style="width: 100px;height: 30px;display: flex;justify-content: center">
                            <div class="logo brandft">
                                <div class="brand">
                                    <h1 style="font-size: 25px;top:0px;">7COLORS</h1>
                                    <h1 style="font-size: 25px;top:0px;">7COLORS</h1>
                                </div>
                            </div>
                        </div>
                        <div class="aaaa">

                            <ul class="list-unstyled">


                                <li><i class="fa fa-map-marker"></i> 01 Vo Van Ngan st, Thu Duc dist, HCM city.</li>
                                <li><i class="fa fa-mobile"></i> 333 222 3333</li>
                                <li><i class="fa fa-phone"></i> +222 11 4444</li>
                                <li><i class="fa fa-envelope"></i> hthkx7color@gmail.com</li>
                            </ul>


                        </div>
                    </div>
                    <!-- Grid column -->

                    <hr class="clearfix w-100 d-md-none pb-3" />
                    <div class="col-md-3 mb-md-0 mb-3 ">
                        <h5 class="text-uppercase">Quick Links</h5>

                        <ul class="list-unstyled">
                            <li>
                                <a href="#!" style="color:black">Products</a>
                            </li>
                            <li>
                                <a href="#!" style="color:black">Aquatic knowledge</a>
                            </li>
                            <li>
                                <a href="#!" style="color:black">Fishtank sample</a>
                            </li>
                            <li>
                                <a href="#!" style="color:black">About us</a>
                            </li>
                        </ul>
                    </div>
                    <!-- Grid column -->
                    <div class="col-md-3 mb-md-0 mb-3 ">
                        <!-- Links -->
                        <h5 class="text-uppercase">Fish</h5>

                        <ul class="list-unstyled">
                            <li>
                                <a href="#!" style="color:black">Betta Fish</a>
                            </li>
                            <li>
                                <a href="#!" style="color:black">Freshwater Fish</a>
                            </li>
                            <li>
                                <a href="#!" style="color:black">Shrimp</a>
                            </li>
                            <li>
                                <a href="#!" style="color:black">Pond Fish</a>
                            </li>
                        </ul>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-3 mb-md-0 mb-3 ">
                        <!-- Links -->
                        <h5 class="text-uppercase">PARTNER</h5>
                        <ul class="list-unstyled">
                            <li>
                                <img style="width: 100px;height: 100px" src="img/sponsor.png" alt="" />
                            </li>


                        </ul>

                    </div>
                    <!-- Grid column -->
                </div>
                <!-- Grid row -->

            </div>
            <div class="text-center py-3 sub-some">
                <img src="img/payment422.png" alt="" />
            </div>
            <!-- Footer Links -->

            <!-- PaymentMethod -->

            <!-- Copyright -->
            <div class="footer-copyright text-center footerright py-3">
                © HTHK 2020
            </div>
            <!-- Copyright -->
        </footer>


        <script src="JS/product.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</body>
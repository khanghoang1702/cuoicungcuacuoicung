<!-- <%@page import="java.util.List"%>
<%@page import = "model.*" %>
<%@page import = "javax.util.*" %>
<%@page import = "dao.ItemDB" %>
<%@page import = "javax.persistence.*" %> -->
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>

    <head>
        <title>Aquarium Store</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous" />

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.css" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
              integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous" />
        <link rel="stylesheet" href="./CSS/owl.carousel.min.css">
        <link rel="stylesheet" href="./CSS/owl.theme.default.min.css">
        <link rel="stylesheet" href="CSS/logo.css" />

        <link rel="stylesheet" href="CSS/about.css" />

        <link rel="stylesheet" href="CSS/aquaknow.css">
        <link rel="stylesheet" href="CSS/fishtank.css">
        <link rel="stylesheet" href="CSS/style.css" />
    </head>

    <body>
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


                <form action="Search" class="form-inline searchbar my-2 my-lg-0 mr-2">

                    <input name="search-input" class="form-control mr-sm-2" type="search" placeholder="Search"
                           aria-label="Search" />
                    <button class="btn btn-outline-light my-2 my-sm-0" type="submit">
                        Search
                    </button>
                </form>
            </div>
        </nav>
        <!--End NavBar -->

        <!-- Contents -->
        <div class="row contents">
            <!-- <div class="col-1"></div> -->

            <div class="col-2 mt-2 filter">
                <div class="category">
                    <div class="category-text text-uppercase">
                        <i class="fa fa-list"></i> Categories
                    </div>
                    <div class="list-group list-category showCategory" id="list-tab" role="tablist">
                        <div class="categories-list">
                            <a class="category-item categories-list" 
                               href="/webproject/Classify?cate=betta">Betta Fish</a>
                        </div>
                        <div class="categories-list">
                            <a class="category-item categories-list"
                               href="/webproject/Classify?cate=freshwater">Freshwater Fish</a>
                        </div>
                        <div class="categories-list">
                            <a class="category-item categories-list" 
                               href="/webproject/Classify?cate=skrimp" >Shrimp</a>
                        </div>
                        <div class="categories-list">
                            <a class="category-item categories-list"
                               href="/webproject/Classify?cate=pond" >Pond Fish</a>
                        </div>
                        <div class="categories-list">
                            <a class="category-item categories-list"
                               href="/webproject/Classify?cate=saltwater">Saltwater Fish</a>
                        </div>
                    </div>
                </div>
                <div class="category priceRange">
                    <div class="category-text text-uppercase category-tag">
                        <label for=""><i class="fa fa-list"></i> Price</label>

                        <i class="fa fa-plus icon"></i>
                    </div>
                    <div class="list-group list-category" id="list-tab" role="tablist">
                        <label for="primary" class="btn btn-primary category-checkbox">
                            <input type="checkbox" id="primary" /> Less than $10</label>
                        <label for="info" class="btn btn-info category-checkbox">
                            <input type="checkbox" id="info" /> $10 to $25</label>
                        <label for="success" class="btn btn-success category-checkbox"><input type="checkbox"
                                                                                              id="success" /> $25 to
                            $50</label>
                        <label for="warning" class="btn btn-warning category-checkbox">
                            <input type="checkbox" id="warning" /> $50 to $100</label>
                        <label for="danger" class="btn btn-danger category-checkbox"><input type="checkbox" id="danger" />
                            More than
                            $100
                        </label>
                    </div>
                </div>
                <div class="category Brand">
                    <div class="category-text text-uppercase category-tag">
                        <label for=""><i class="fa fa-list"></i> Brand</label>
                        <i class="fa fa-plus icon"></i>
                    </div>
                    <div class="list-group list-category" id="list-tab" role="tablist">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Search this blog" />
                            <div class="input-group-append">
                                <button class="btn btn-secondary" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                        <label for="primary" class="category-item category-checkbox">
                            <input type="checkbox" id="primary" /> Less than $10</label>
                        <label for="info" class="category-item category-checkbox">
                            <input type="checkbox" id="info" /> $10 to $25</label>
                        <label for="success" class="category-item category-checkbox"><input type="checkbox" id="success" />
                            $25 to
                            $50</label>
                        <label for="warning" class="category-item category-checkbox">
                            <input type="checkbox" id="warning" /> $50 to $100</label>
                        <label for="danger" class="category-item category-checkbox"><input type="checkbox" id="danger" />
                            More than
                            $100
                        </label>
                    </div>
                </div>
            </div>


            <div class="col products">


                <button type="button" class="btn btn-outline-info btn-soft-mobile">
                    Sort & Filter
                </button>

                <div class="filter-mobile">
                    <h1>Sort & Filter</h1>
                    <div class="closeFilterMobile" onclick="this.parentElement.style.display = 'hidden'">
                        <i class="fas fa-times" style="cursor: pointer"></i>
                    </div>
                    <select name="" id="">
                        <option value="Most popular">Most popular</option>
                    </select>
                    <div class="category">
                        <div class="category-text text-uppercase">
                            <i class="fa fa-list"></i> Categories
                        </div>
                        <div class="list-group list-category showCategory" id="list-tab" role="tablist">
                            <div class="categories-list">
                                <a class="category-item categories-list" id="list-home-list " data-toggle="list"
                                   href="#list-home" role="tab" aria-controls="home">Betta Fish</a>
                            </div>
                            <div class="categories-list">
                                <a class="category-item categories-list" id="list-profile-list " data-toggle="list"
                                   href="#list-profile" role="tab" aria-controls="profile">Freshwater Fish</a>
                            </div>
                            <div class="categories-list">
                                <a class="category-item categories-list" id="list-messages-list " data-toggle="list"
                                   href="#list-messages" role="tab" aria-controls="messages">Invertebrates</a>
                            </div>
                            <div class="categories-list">
                                <a class="category-item categories-list" id="list-settings-list " data-toggle="list"
                                   href="#list-settings" role="tab" aria-controls="settings">Pond Fish</a>
                            </div>
                            <div class="categories-list">
                                <a class="category-item categories-list" id="list-settings-list " data-toggle="list"
                                   href="#list-settings" role="tab" aria-controls="settings">Saltwater Fish</a>
                            </div>
                        </div>
                    </div>
                    <div class="category">
                        <div class="category-text text-uppercase category-tag">
                            <label for=""><i class="fa fa-list"></i> Price</label>

                            <i class="fa fa-plus icon"></i>
                        </div>
                        <div class="list-group list-category" id="list-tab" role="tablist">
                            <label for="primary" class="btn btn-primary category-checkbox">
                                <input type="checkbox" id="primary" /> Less than $10</label>
                            <label for="info" class="btn btn-info category-checkbox">
                                <input type="checkbox" id="info" /> $10 to $25</label>
                            <label for="success" class="btn btn-success category-checkbox"><input type="checkbox"
                                                                                                  id="success" /> $25 to
                                $50</label>
                            <label for="warning" class="btn btn-warning category-checkbox">
                                <input type="checkbox" id="warning" /> $50 to $100</label>
                            <label for="danger" class="btn btn-danger category-checkbox"><input type="checkbox"
                                                                                                id="danger" /> More than
                                $100
                            </label>
                        </div>
                    </div>
                    <div class="category">
                        <div class="category-text text-uppercase category-tag">
                            <label for=""><i class="fa fa-list"></i> Brand</label>
                            <i class="fa fa-plus icon"></i>
                        </div>
                        <div class="list-group list-category" id="list-tab" role="tablist">
                            <div class="input-group mb-3">
                                <input type="text" class="form-control" placeholder="Search this blog" />
                                <div class="input-group-append">
                                    <button class="btn btn-secondary" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </div>
                            <label for="primary" class="category-item category-checkbox">
                                <input type="checkbox" id="primary" /> Less than $10</label>
                            <label for="info" class="category-item category-checkbox">
                                <input type="checkbox" id="info" /> $10 to $25</label>
                            <label for="success" class="category-item category-checkbox"><input type="checkbox"
                                                                                                id="success" /> $25 to
                                $50</label>
                            <label for="warning" class="category-item category-checkbox">
                                <input type="checkbox" id="warning" /> $50 to $100</label>
                            <label for="danger" class="category-item category-checkbox"><input type="checkbox"
                                                                                               id="danger" /> More than
                                $100
                            </label>
                        </div>
                    </div>
                </div>
                <!-- End Filter mobile -->
                <% List<Items> listItems = (List<Items>) session.getAttribute("listItems");
                    if (listItems == null) {
                        listItems = ItemDB.getAllItems();
                        session.setAttribute("listItems", listItems);
                    }

                %>
                <div class="items-container">
                    <% for (Items item : listItems) {%>
                    <a style="display:block" href="/webproject/Product?product=<%=item.getItemID() %>" class="items">
                        <img src="<%= item.getItemImageData()%>" alt="Fish here">
                        <div class="btnitem">
                            <h1>
                                <%=item.getItemName()%>
                                <p class="price">
                                    <%=item.getItemPrice()%>
                                </p>
                            </h1>

                            <div class="btnPurchase">
                                <form action="add-to-cart">
                                    <input type="submit" class="btn btn-primary mr-2" value="Add to cart">
                                    <input type="hidden" value="<%=item.getItemID()%>" name ="code">
                                </form>
                                <form action="buy-now">
                                    <input type="submit" class="btn btn-outline-primary " value="Buy now">
                                    <input type="hidden" value="<%=item.getItemID()%>" name ="code">
                                </form>
                            </div>
                        </div>


                    </a>

                    <% }%>
                </div>
            </div>
        </div>
        <!-- End Contents -->
        <div class="product-card-section" id="specialfish">
            <h2>Special Offers </h2>
            <div class="product-card-container">
                <div class="product-card">

                    <div class="card mySlides-1">
                        <img class="" src="img/black-guppy.jpg">
                        <h1>Black Guppy</h1>
                        <p class="price">$19.99</p>
                        <p><button>Add to Cart</button></p>
                    </div>
                    <div class="card mySlides-1">
                        <img class="" src="img/White-Guppy.jpg">
                        <h1>White Guppy</h1>
                        <p class="price">$19.99</p>
                        <p><button>Add to Cart</button></p>
                    </div>
                    <div class="card mySlides-1">
                        <img class="" src="img/Yellow-Laser-Tail.jpg">
                        <h1>Yellow Guppy</h1>
                        <p class="price">$19.99</p>
                        <p><button>Add to Cart</button></p>
                    </div>

                </div>
                <div class="product-card">

                    <div class="card mySlides-2">
                        <img class="" src="img/black-guppy.jpg">
                        <h1>Black Guppy</h1>
                        <p class="price">$19.99</p>
                        <p><button>Add to Cart</button></p>
                    </div>
                    <div class="card mySlides-2">
                        <img class="" src="img/White-Guppy.jpg">
                        <h1>White Guppy</h1>
                        <p class="price">$19.99</p>
                        <p><button>Add to Cart</button></p>
                    </div>
                    <div class="card mySlides-2">
                        <img class="" src="img/Yellow-Laser-Tail.jpg">
                        <h1>Yellow Guppy</h1>
                        <p class="price">$19.99</p>
                        <p><button>Add to Cart</button></p>
                    </div>

                </div>
                <div class="product-card">

                    <div class="card mySlides-3">
                        <img class="" src="img/black-guppy.jpg">
                        <h1>Black Guppy</h1>
                        <p class="price">$19.99</p>
                        <p><button>Add to Cart</button></p>
                    </div>
                    <div class="card mySlides-3">
                        <img class="" src="img/White-Guppy.jpg">
                        <h1>White Guppy</h1>
                        <p class="price">$19.99</p>
                        <p><button>Add to Cart</button></p>
                    </div>
                    <div class="card mySlides-3">
                        <img class="" src="img/Yellow-Laser-Tail.jpg">
                        <h1>Yellow Guppy</h1>
                        <p class="price">$19.99</p>
                        <p><button>Add to Cart</button></p>
                    </div>

                </div>
            </div>

        </div>
    </div>

    <div class="main-container" id="aquaknow">
        <h2>Aquatic Knowledge</h2>
        <div class="news">
            <div class="news-container ">
                <img src="img/ca34k.jpg" alt="">

                <a href="">ADJUST ADJUST ADJUSTADJUSTADJUST ADJUSTADJUSTADJUSTADJUSTADJUSTADJUST</a>

                <p>AbcdAbcdAbcdAbcdAbcdAbcdAbcdAbcdAbcd
                    AbcdAbcdAbcdAbcdAbcdAbcdAbcdAbcdAbcdAbcd
                </p>
                <span>
                    <p> Author: </p>
                </span>
                <span>
                    <p> Date: </p>
                </span>

            </div>
            <div class="news-container">
                <img src="img/ca44k.jpg" alt="">

                <a href="">ADJUST ADJUST ADJUSTADJUSTADJUST ADJUSTADJUSTADJUSTADJUSTADJUSTADJUST</a>

                <p>AbcdAbcdAbcdAbcdAbcdAbcdAbcdAbcdAbcd
                    AbcdAbcdAbcdAbcdAbcdAbcdAbcdAbcdAbcdAbcd
                </p>
                <span>
                    <p> Author: </p>
                </span>
                <span>
                    <p> Date: </p>
                </span>
            </div>
        </div>
        <div class="subnews">
            <div class="owl-carousel owl-theme">
                <div class="item">
                    <img src="./img/ph.jpg" alt="subnews">
                    <a href="#">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aspernatur, dolore.</a>
                    <p>ALLYI</p>
                </div>
                <div class="item">
                    <img src="./img/ph.jpg" alt="subnews">
                    <a href="#">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aspernatur, dolore.</a>
                    <p>ALLYI</p>
                </div>
                <div class="item">
                    <img src="./img/ph.jpg" alt="subnews">
                    <a href="#">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aspernatur, dolore.</a>
                    <p>ALLYI</p>
                </div>
                <div class="item">
                    <img src="./img/ph.jpg" alt="subnews">
                    <a href="#">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aspernatur, dolore.</a>
                    <p>ALLYI</p>
                </div>
                <div class="item">
                    <img src="./img/ph.jpg" alt="subnews">
                    <a href="#">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aspernatur, dolore.</a>
                    <p>ALLYI</p>
                </div>
                <div class="item">
                    <img src="./img/ph.jpg" alt="subnews">
                    <a href="#">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aspernatur, dolore.</a>
                    <p>ALLYI</p>
                </div>
            </div>
        </div>
    </div>
    <div class="aboutcontent" id="about-us">
        <h2>OUR TEAM</h2>
        <div class="abseccond">
            <div class="team__member">
                <img src="./img/thay.jpg" alt="">
                <div class="team__black">
                    <h3>Le Quang Huy</h3>
                    <p>-Leader</p>
                    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Corporis, sint nisi eligendi recusandae
                        dolore fuga?
                    </p>
                    <ul>
                        <li class="facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li class="instagram"><a href="#"><i class="fa fa-instagram"></i></a></li>
                        <li class="google"><a href="#"><i class="fa fa-google"></i></a></li>
                    </ul>
                </div>
                <div class="team__pink">
                    <h3>Le Quang Huy</h3>
                    <p>-Leader</p>
                </div>

            </div>
            <div class="team__member">
                <img src="./img/tu.jpg" alt="">
                <div class="team__black">
                    <h3>Nguyen Thi Cam Tu</h3>
                    <p>-Member</p>
                    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Corporis, sint nisi eligendi recusandae
                        dolore fuga?
                    </p>
                    <ul>
                        <li class="facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li class="instagram"><a href="#"><i class="fa fa-instagram"></i></a></li>
                        <li class="google"><a href="#"><i class="fa fa-google"></i></a></li>
                    </ul>
                </div>
                <div class="team__pink">
                    <h3>Nguyen Thi Cam Tu</h3>
                    <p>-Member</p>
                </div>
            </div>
            <div class="team__member">
                <img src="./img/hoang.jpg" alt="">
                <div class="team__black">
                    <h3>Truong Minh Hoang</h3>
                    <p>-Member</p>
                    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Corporis, sint nisi eligendi recusandae
                        dolore fuga?
                    </p>
                    <ul>
                        <li class="facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li class="instagram"><a href="#"><i class="fa fa-instagram"></i></a></li>
                        <li class="google"><a href="#"><i class="fa fa-google"></i></a></li>
                    </ul>
                </div>
                <div class="team__pink">
                    <h3>Truong Minh Hoang</h3>
                    <p>-Member</p>
                </div>
            </div>
            <div class="team__member">
                <img src="./img/khang.jpg" alt="">
                <div class="team__black">
                    <h3>Hoang Minh Khang</h3>
                    <p>-Member</p>
                    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Corporis, sint nisi eligendi recusandae
                        dolore fuga?
                    </p>
                    <ul>
                        <li class="facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li class="instagram"><a href="#"><i class="fa fa-instagram"></i></a></li>
                        <li class="google"><a href="#"><i class="fa fa-google"></i></a></li>
                    </ul>
                </div>
                <div class="team__pink">
                    <h3>Hoang Minh Khang</h3>
                    <p>-Member</p>
                </div>
            </div>
        </div>

    </div>
    <footer class="page-footer font-small footerne pt-4">
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
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
    crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="JS/Interface.js"></script>
    <script src="JS/slide.js"></script>
    <script src="./JS/owl.carousel.min.js"></script>
    <script>$('.owl-carousel').owlCarousel({
                            loop: false,
                            margin: 10,
                            nav: false,
                            responsive: {
                                // 0: {
                                //     items: 1
                                // },
                                600: {
                                    items: 1
                                },
                                1000: {
                                    items: 2
                                }
                            }
                        })</script>
</body>

</html>
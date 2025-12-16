<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="index.css">
</head>
<body>
            <nav>
                <div id="space"></div>
                <div id="logo">
                <span id="pro">Pro</span><span id="cart">Cart</span>
                </div>
                <div id="space"></div>
                <div id="search">
                    <div>
                      <form action="search"  style="display: flex;">
                        <input type="text" name="search" >
                    <div><i class="fa-solid fa-magnifying-glass"></i></div>
                      </form>
                    </div>
                </div>
                <div id="space"></div>
                <div id="space"></div>
                <div id="cart">
                    <a href="displaycart"><i class="fa-solid fa-cart-shopping"></i></a>
                </div>

                <div class="dropdown-container">
                    <div id="user" style="cursor: pointer;">
                   <i class="fa-solid fa-user"></i>
                </div>
                
                  <%
                       HttpSession s = request.getSession();
                       String name=(String) s.getAttribute("name");
                       if(name!=null){
                  %>
                      <div class="dropdown" style="height: auto;">
                       <p>Hello, <span style="font-size: 16px; font-weight: 700;"><%=name %></span></p>
                        <hr>
                        <a href="displaycart"><p>My ProCart</p></a>
                        <a href="myorder"><p>My Orders</p></a>
                         <a href="logout"><p>LogOut</p></a>
                      </div>
                </div>
                <%} else{%>
                    <div class="dropdown">
                        <h3>Welcome </h3>
                        <p>To access account and manage orders</p>
                        <form action="LogIn.jsp" method="post">
                            <input type="submit" value="Signup/Login">
                        </form>
                        <hr>
                        <a href="LogIn.jsp"><p>My ProCart</p></a>
                        <a href="LogIn.jsp"><p>My Orders</p></a>
                      </div>
                </div>
                 <%} %>
            </nav>
            
            <nav id="categories">
                <div><a href="category?cid=<%=1%>">Gifts</a></div>
                <div><a href="category?cid=<%=2%>">Personalized Gifts</a></div>
                <div><a href="category?cid=<%=3%>">Flowers</a></div>
                <div><a href="category?cid=<%=4%>">Plants</a></div>
                <div><a href="category?cid=<%=5%>">Anniversary</a></div>
                <div><a href="category?cid=<%=6%>">Jewellery</a></div>
                <div><a href="category?cid=<%=7%>">Chocolates</a></div>
                <div><a href="category?cid=<%=8%>">Handmade Craft</a></div>
            </nav>
</body>
</html>
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
           <jsp:include page="NavBar.jsp"></jsp:include>
           
            <%
                                   String sameuser=(String) request.getAttribute("sameuser");
                            if(sameuser!=null){
              %>
              				<h3 style="text-align: center;" id="sameuser"></h3>
              				<script type="text/javascript">
              				document.getElementById("sameuser").innerHTML="<%=sameuser%>";
              				setTimeout(() => {
              				document.getElementById("sameuser").innerHTML="";
							}, 2000);
              				</script>
              					<%
              				request.removeAttribute("email");
              				%>
              <%} %>
            
           
                      <div class="form-container">
                    <div id="left">
                            <img src="assets/login-side-image.avif" alt="">
                    </div>
                    <div id="right">
                        <div id="login">
                            <h1>SignUp</h1>
                        </div>
                        <div id="input-fields">
                            <form action="signup" id="signup" method="post">
                                <div id="email" style="margin: 25px auto;">
                                    <i class="fa-solid fa-user"></i>
                                    <input type="text" required placeholder="Name" id="inputname" name="name">
                                </div>
                                <div id="password" style="margin: 25px auto;">
                                     <i class="fa-solid fa-envelope"></i></i>
                                     <input type="email" required placeholder="Email" id="inputemail" name="email">
                                </div>
                                 <div id="password" style="margin: 25px auto;">
                                    <i class="fa-solid fa-lock"></i>
                                    <input type="password" required placeholder="Password" id="inputpassword" name="password">
                                </div>
                                 <div id="password"style="margin: 25px auto;">
                                    <i class="fa-solid fa-lock"></i>
                                    <input type="password" required placeholder="Confirm Password" id="confirmpassword">
                                </div>
                                <div id="login-btn" style="margin: 10px 0px 0px 20px ;">
                                    <input type="submit" value="continue">
                                </div>

                                <div id="msg">
                                  <div><a href="LogIn.jsp">Already have acoount</a></div>
                                </div>

                            </form>
                        </div>
                    </div>
            </div>
                <script src="SignUp.js"></script>
</body>
</html>
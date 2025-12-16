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
                          HttpSession s = request.getSession();
                            String name =(String)s.getAttribute("name");
                            String email =(String)s.getAttribute("email");
                            String password =(String)s.getAttribute("password");
                            
                    String signupmsg = (String) request.getAttribute("signupmsg");
                            if(name!=null && password!=null && email!=null){
              %>
              				<h3 style="text-align: center;" id="signupmsg"></h3>
              				<script type="text/javascript">
              				document.getElementById("signupmsg").innerHTML="<%=signupmsg%>";
              				setTimeout(() => {
              				document.getElementById("signupmsg").innerHTML="";
              				document.getElementById("signupmsg").remove();
							}, 2000);
              				</script>
              				<%
              				s.removeAttribute("signupmsg");
              				%>
              <%} %>
              <%
                         String emailmsg=   (String) request.getAttribute("emailmsg");
                            if(emailmsg!=null){
              %>
              			   <h3 style="text-align: center;" id="emailmsg"></h3>
              				<script type="text/javascript">
              				document.getElementById("emailmsg").innerHTML="<%=emailmsg%>";
              				setTimeout(() => {
              				document.getElementById("emailmsg").innerHTML="";
							}, 2000);
              				</script>
              				<%
              				s.removeAttribute("emailmsg");
              				%>
              <%} %>
              <%
                         String passwordmsg=   (String) request.getAttribute("passwordmsg");
                          if(passwordmsg!=null){
              %>
              			   <h3 style="text-align: center;" id="passwordmsg"></h3>
              				<script type="text/javascript">
              				document.getElementById("passwordmsg").innerHTML="<%=passwordmsg%>";
              				setTimeout(() => {
              				document.getElementById("passwordmsg").innerHTML="";
							}, 2000);
              				</script>
              				<%
              				s.removeAttribute("passwordmsg");
              				%>
              <%} %>
             
              
            <div class="form-container">
                    <div id="left">
                            <img src="assets/login-side-image.avif" alt="">
                    </div>
                    <div id="right">
                        <div id="login">
                            <h1>Login</h1>
                        </div>
                        <div id="input-fields">
                            <form action="login" method="post">
                                <div id="email">
                                    <i class="fa-solid fa-envelope"></i>
                                    <input type="text" required placeholder="Email Id" name="email">
                                </div>
                                <div id="password">
                                    <i class="fa-solid fa-lock"></i>
                                    <input type="password" required placeholder="Password" name="password">
                                </div>
                                <div id="login-btn" style="margin: 50px 0px 0px 20px ;">
                                    <input type="submit" value="continue">
                                </div>

                                <div id="msg">
                                  <div><a href="SignUp.jsp">Not have acoount</a></div>
                                </div>

                            </form>
                        </div>
                    </div>
            </div>

</body>
</html>
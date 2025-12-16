<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
            <jsp:include page="AdminSidebar.jsp"></jsp:include>
            
             <form action="addcategory" id="addcategory" method="post">
            <h3>Add Category</h3>
            <div><input type="text" placeholder="Category" required name="category" id="category"></div>
            <div><input type="submit" required value="Add Category" id="btn"></div>
            <%
                         String categorymsg=   (String) request.getAttribute("categorymsg");
                          if(categorymsg!=null){
              %>
              			   <h5 style="text-align: center; color: green" id="categorymsg"></h5>
              				<script type="text/javascript">
              				document.getElementById("categorymsg").innerHTML="<%=categorymsg%>";
              				setTimeout(() => {
              				document.getElementById("categorymsg").innerHTML="";
							}, 2000);
              				</script>
              <%} %>
          </form>

          <script>
    const category = document.getElementById("category");
    const categorypattern = /^[A-Za-z ]+$/; 

    category.addEventListener('input', () => {
        if (!categorypattern.test(category.value)) {
            category.setCustomValidity("Only letters and spaces are allowed!");
        } else {
            category.setCustomValidity("");
        }
    });
</script>
            
</body>
</html>
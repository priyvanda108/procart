<%@page import="java.util.List"%>

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
				
			<form action="addpro" id="addcategory" style="height: auto; top:10vh;" method="post" enctype="multipart/form-data">
            <h3>Add Product</h3>
         <input type="text" placeholder="Product Name" name="productname" required>
         <input type="text" placeholder="Price" name="productprice" required>
         <input type="file" name="photo" accept="image/*" required>
               <select name="categoryid" id="cat">
            <option value="">select category</option>
           <%
           HttpSession s = request.getSession();
           List <String[]> l = (List<String[]>) s.getAttribute("l");
           if(l!=null){
            for(String[] c : l){
           %>
                   <option value="<%=c[0] %>"><%= c[1] %></option>
             <%}} else{ %>
             <option value="">Category not found </option>
             <%} %> </select>
   
         <input type="submit" value="Add Product" id="btn">
          <%
                         String productmsg=   (String) request.getSession().getAttribute("productmsg");
                          if(productmsg!=null){
              %>
              			   <h5 style="text-align: center; color: green" id="productmsg"></h5>
              				<script type="text/javascript">
              				document.getElementById("productmsg").innerHTML="<%=productmsg%>";
              				setTimeout(() => {
              				document.getElementById("productmsg").innerHTML="";
							}, 2000);
              				<%  
              				     session.removeAttribute("productmsg");
              				%>
              				</script>
              <%} %>
         </form>
</body>
</html>

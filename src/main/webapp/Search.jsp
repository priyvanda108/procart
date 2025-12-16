
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
                  <jsp:include page="NavBar.jsp"></jsp:include>
                  <div id="category-nav">
            <div><a href="index.jsp">Home</a></div> <span style="padding: 0px 10px;">></span>
            <%
            List <String[]> g = (List<String[]>) request.getAttribute("search");
                String  name = (String) request.getAttribute("searchname");
            %>
            <div><a href=""><%=name%></a></div>
            </div>
            
            <%
                   String invalid   = (String) request.getAttribute("invalid");
                 if(invalid!=null){
            %>
                   <h2 style="text-align: center;"><%=invalid %></h2>
            
            <%} else {%>
            
              <div id="product-container">
                 <%
                   
                    for(String[] s : g){
                 %> 
                     <div id="products">
                <div id="product-img">
                   <img src="proimg?cid=<%=s[2]%>" alt="">
                </div>
                <div id="product-details">
            <div id="pname" style="font-size: 16px; text-transform: capitalize;"><%=s[0] %></div>
            <div id="rs"> <span>&#8377; <%=s[1] %></span>
                <a href="addtocart?pid=<%=s[2] %>&pname=<%=s[0] %>&price=<%=s[1] %>" id="btns" style="font-size: 16px; font-weight: 400;">Add To Cart</a>  
                    </div>    
                </div>
                </div>
                 <%}%>
                 </div>
            <%} %>
</body>
</html>
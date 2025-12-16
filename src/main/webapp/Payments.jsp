<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
      #payment-container{
       position: absolute;
        height : auto;
        width : 60vw;
       
      top: 10vh;
      left: 26vw;
      }
      table{
        width: 100%;
         text-align : center;
     }
     #thead{
        font-weight: 600;
        font-size: 1.1rem;
          background-color:  #C4CFDD;
        
     }
     td{
    
      padding: 10px 5px;
     }
     caption{
        font-size: 1.5rem;
     }
     .data{
    background-color: #D0DCEB;
   
     }
</style>
<body>
			<jsp:include page="AdminSidebar.jsp"></jsp:include>
			    <div id="payment-container">
			          <table border="0" cellspacing="1">
			            <caption>Payments</caption>
			         <tr id="thead">
			         <td>UserId</td>
			         <td>Name</td>
			         <td>ProuctId</td>
			         <td>ProuctName</td>
			         <td>Price</td>
			         <td>Order_Status</td>
			         <td>PaymentMode</td>
			         
			         </tr>
			      
			     <%
			         List<String[]> l = (List<String[]>)  request.getAttribute("list");
			         if(l!=null){
			        	 for(String[] s : l){
			     %>
			          	<tr class="data">
			          	<td><%=s[0] %></td>
			          	<td><%=s[1] %></td>
			          	<td><%=s[2] %></td>
			          	<td><%=s[3] %></td>
			          	<td><%=s[4] %></td>
			          	<td><%=s[5] %></td>
			          	<td><%=s[6] %></td>
			          	</tr>
			     <%} }%>
			          </table>
			    </div>
</body>
</html>
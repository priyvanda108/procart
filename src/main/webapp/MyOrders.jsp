<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
text-transform: capitalize;
}
#order-container{
        height: auto;
        width: 95vw;
     
        margin: 20px auto;
        border-radius: 10px;
        display: flex;
        justify-content: space-around;
        padding: 10px 0px;
}
#order-container h3{
    background-color: #EBE9F6;
    display: flex;
    align-items: center;
    padding: 11px 0px;
    color: #833F96;
    border-radius: 10px 10px 0px 0px;
    padding-left: 20px;
}
#user-account{
    height: auto;
    width: 17vw;
  
    border-radius: 10px;  
     box-shadow: 0px 1px 2px gray;
}
#user-account #name{
    font-size: 19px;
    font-weight: 500;
    text-transform: capitalize;
}
.user{
 
    padding: 1px 0px;
      border-radius: 10px 10px 0px 0px;
}
#user-account p{
    margin: 10px;
    padding:  0px 10px;
    font-size: 17px;
}
#orders{
    height: auto;
    width: 77vw;
   
    border-radius: 10px;
     box-shadow: 0px 1px 2px gray;
}
.order{
   display: flex;
}
.order-card{
    height: 25vh;
    width: 50vw;
    
    margin: 10px;
    display: flex;
    align-items: center;
    justify-content: space-evenly;
    border-radius: 20px;
    box-shadow: 0px 1px 2px gray;
}
.order-img{
    height: 22vh;
    width: 15vw;
     
    border-radius: 20px;
}
.order-img img{
    height: 22vh;
    width: 100%;
    border-radius: 20px;
    cursor: pointer;
    overflow: hidden;
}
.order-img img:hover{
      transform : scale(1.02);
      transition-duration:2s;
}
.order-details{
    height: 22vh;
    width: 32vw;
   
}
.order-details .status{
    color: green;
    font-weight: 600;
}
.order-details .price{
    font-size: 19px;
    font-weight: 500;
}
.order-details p{
    font-size: 18px;
    padding: 10px ;
    font-weight: 500;
}
.payment-details{
    height: auto;
    width: 25vw;
   
    margin: 10px 0px;
    border-radius: 20px;
     box-shadow: 0px 1px 2px gray;
}
.payment-details th{
    padding: 10px;
}
.payment-details .total{
    background-color: #EFEFEF;
}


</style>
</head>
<body>
		 <jsp:include page="NavBar.jsp"></jsp:include>
			
			<%
                       HttpSession s1 = request.getSession();
                       String name=(String) s1.getAttribute("name");
                       if(name!=null){
             %>
			   <div id="order-container">
                <div id="user-account" style="display: none;">
                <div class="user">
                      <p>Hi, <span id="name"><%=name %></span></p>
                </div>   
                </div>
                <div id="orders">
                    <h3>My Orders</h3>
                    <div class="order">
                    <div class="cards" style="flex-wrap: wrap; height: auto;">
					
					<%
				    List<String[]> l =  (ArrayList<String[]>) request.getAttribute("orders");
				    double total =0.0;
					if(l!=null){
						for(String[] s :l){
					%>

                     <div class="order-card">
                          <div class="order-img">
                            <img src="proimg?cid=<%=s[0] %>" alt="">
                          </div>
                          <div class="order-details">
                            <p><%=s[1] %></p>
                            <p class="price">&#8377; <%=s[2] %></p>
                            <p>Order Status : <span class="status"><%=s[3] %></span></p>
                          </div>
                    </div>
					<%} }%>
                    </div>

						<%
						 if(l!=null){
						%>
                    <div class="payment-details">
                        <h3>Payment Summary</h3>
                        <table border="0" cellspacing="0	" style="width: 100%;">
                        <%
                            
                            	 for(String[] s : l){
                            		 total += Double.parseDouble(s[2]);
                        %>
                            <tr>
                                <th style="text-align: left; padding: 2px 0px;"><%=s[1] %></th>
                                <th><%=s[2] %></th>
                            </tr>
                            <%} %>
                            <tr class="total">
                                <th style="text-align: right;">Total Payed</th>
                                <th><%=total %></th>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                  
                    </div>
                </div>
            </div>
            <%}%>
</body>
</html>
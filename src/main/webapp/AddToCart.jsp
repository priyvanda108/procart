<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 #ordermsg{
      position: fixed;
      top: 120px;
      left: 50%;
      transform : translateX(-50%);
      background: #333333;
      color: white;
      border-radius: 20px;
      padding: 10px 20px;
      font-size: 16px;
      z-index: 9999;
      display: none;
}
#cart-container{
    height: auto;
    width: 52vw;
    /* background-color: #512079; */
    display: flex;
    flex-wrap: wrap;
    position: absolute;
    top: 120px;
    left: 30px;
}
#addtocart-container{
    height: auto;
    width: 98vw;
    /* background-color: #9e6767; */
    margin: 10px auto;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: space-around;
}
#addtocart-container #product-card{
    height: 33vh;
    width: 50vw;
    /* background-color: #e0d8d8; */
    display: flex;
    align-items: center;
    justify-content: space-evenly;
    border-radius: 20px;
    margin: 10px;
}
#addtocart-container #product-card:hover{
       box-shadow: 1px 1px 2px gray;
}
#addtocart-container #product-img{
    height: 29vh;
    width: 15vw;
    /* background-color: #459816; */
    border-radius: 20px;
}
#product-img img{
    height: 29vh;
    width: 15vw;
    border-radius: 20px;
}
#addtocart-container #product-details{
    height: 29vh;
    width: 33vw;
    /* background-color: #5f675b; */
    text-transform: capitalize;
}
table{
 text-transform:  capitalize;
}
#product-details p{
    padding-top: 12px ;
    line-height: 3vw;
    color: #212020;
    font-size: 1.5rem;
    font-weight: 600;
}
#product-details #price{
    font-size: 1.3rem; 
}
#product-details input{
    padding: 7px 15px;
    border-radius: 10px;
    border: none;
    font-size: 13px;
    margin-top: 1.5rem;
    font-size: 14px;
    cursor: pointer;
    color: white;
}
#product-details #buynow{
     margin-right: 3rem;
     background-color:  #459816;
}
#product-details #remove{
    background-color: #459816;
}
#addtocart-container #buyNow{
    height: auto;
    width: 42vw;
    background-color: wheat;
    border-radius: 20px;
    position: sticky;
    margin-left: 840px;

}
#buyNow .short-details{
    height: auto;
    width: 100%;
    background-color:#F5FAFF;
    margin:  auto;
    border-radius: 20px;
    padding: 10px;
}
 
</style>
</head>
<body>
			 <jsp:include page="NavBar.jsp"></jsp:include>
			 
			    <%
					HttpSession s1 = request.getSession();
			     String gobackmsg =   (String)  s1.getAttribute("gobackmsg");
			    if(gobackmsg!=null){
             %>
                <h3 id="ordermsg"><%=gobackmsg %></h3>
                <script type="text/javascript">
                window.addEventListener('DOMContentLoaded',()=>{
                	const ordermsg = document.getElementById("ordermsg");
                	ordermsg.style.display="block";
                	setTimeout(() => {
						ordermsg.style.display="none";
					}, 3000);
                })
                </script>
               <%
                     s1.removeAttribute("gobackmsg");
			    } %> 
			 
			  <div id="category-nav">
            <div><a href="index.jsp">Home</a></div> <span style="padding: 0px 10px;">></span>
            <div><a href="">My Cart</a></div>
            </div>
			 
			     <div id="addtocart-container">
			     
			     <div id="cart-container" style="margin-top: 10px;">
			       
		<%
		double price =0.0;
		 List <String[]> g = (List<String[]>) request.getAttribute("cart");
		 if(g!=null){
         for(String[] s : g){
		%>
		
	  <div id="product-card">   
                    <div id="product-img">
                       <img src="proimg?cid=<%=s[0]%>"  style="height: 100%; width: 100%;">
                    </div>
                    <div id="product-details">
                        <p><%=s[1] %></p>
                        <p id="price"> &#8377; <%=s[2] %></p>
                        <div style="display: flex;">
                       <form action="paymentmode" onsubmit ="return confirmOrder()">
                       <input type="submit" id="buynow" value="Buy Now">
                       <input type="hidden" name="pid" value="<%=s[0]%>">
                       <input type="hidden" name="pname" value="<%=s[1]%>">
                       <input type="hidden" name="price" value="<%=s[2]%>"> 
                       </form>
                       <script type="text/javascript">
                           function confirmOrder() {
							return confirm("Are you sure to place this order?");
						}
                       </script>
                        <form action="remove">
                        <input type="submit" id="remove" value="Remove">
                        <input type="hidden" name="cartid" value="<%=s[3]%>">
                        </form>
                        </div>
                    </div>
                   
                </div>
                 
 <%} %>
          </div>
             
             <div id="buyNow">
                
                <div class="short-details">
                   <table cellspacing="0" style="width: 100%; text-align: left;font-size: 1.2rem; border-radius: 20px;">
                        <tr style="background-color: #EFEFEF;">
                            <th style="padding: 10px 0px;">Name</th>
                            <th>Price</th>
                        </tr>
                        <%
                   
                           for(String[] s : g){
                        	   price += Double.parseDouble(s[2]);
                        	
                        %>
                        <tr>
                            <td><%=s[1] %></td>
                            <td>&#8377; <%=s[2] %></td>
                        </tr>
                         <%
                            
                           }%>
                        <tr style="background-color: #EFEFEF; ">
                            <th style="text-align: right;padding: 10px;">Total</th>
                           
                            <th>&#8377; <%=price %></th>
                        </tr>
                       
                   </table>
                </div>

             </div>
           
            </div>
            <% }else{   %>
            	     	
            <script>
                      alert("Your Cart is Empty!");
                window.location = "EmptyCart.jsp";
             </script> 
            	     		
            <%  } %>
       
</body>
</html>
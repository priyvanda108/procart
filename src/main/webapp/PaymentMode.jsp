<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
      <link rel="stylesheet" href="index.css">
    <style type="text/css">
    *{
  margin: 0px;
  padding: 0px;
  box-sizing: border-box;
  text-decoration: none;
 }  
#payment-container{
    height: auto;
    width: 30vw;
    /* background-color: #c3b7b7; */
    margin: 85px auto;
}
#payment-form{
    height: auto;
    /* background-color: #833F96; */
}
.payment-methods{
    /* background-color: #e2e6e0; */
    /* padding: 2px; */
    margin: 5px 0px;
    display: flex;
    align-items: center;
    cursor: pointer;
    border-radius: 10px;
    border: 1px solid gray;
}
.payment-methods:hover{
    border: 1px solid #2B613F;
    box-shadow: 0px 0px  2px #2B613F;
}
#payment-container #options{
    /* background-color: #d4cad7; */
    height: auto;
}
#payment-container #buttons{
    /* background-color: pink; */
    display: flex;
    flex-direction: column;
}
#buttons input{
    font-size: 1.1rem;
    padding: 15px;
    margin: 5px 0px;
    border-radius: 10px;
    border: 1px solid gray;
    background-color: #2B613F;
    color: white;
    cursor: pointer;
    font-weight: 600;
}
#goback 
{ font-size: 1.1rem;
    padding: 15px;
    margin: 5px 0px;
    border-radius: 10px;
    border: 1px solid gray;
    background-color: #2B613F;
    cursor: pointer;
    font-weight: 600;
    background-color: transparent;
    color: black;
    text-align: center;
}
#goback:hover{
      box-shadow: 0px 0px  3px rgb(110, 107, 107);
}
#buttons #continue:hover{
            background-color: #1e5131;
              box-shadow: 0px 0px  3px rgb(110, 107, 107);
}
#payment-container #msg{
    background-color: #F4F7F4;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 1rem;
    margin: 30px 0px;
    color: #212121;
    font-size: 12px;
}
#msg i{
    color: #212121;
}
.payment-methods .imgoption{
    height: 8vh;
    width: 4vw;
    /* background-color: #f2eeee; */
    margin: 10px;
    border-radius: 10px;
}
.payment-methods label{
    font-size: 20px;
} 
.payment-methods input{
    height: 2vh;
    width: 2vw;
}
.payment-methods input[type="radio"]{
    accent-color: #2B613F;
    cursor: pointer;
}
.imgoption img{
    height: 8vh;
    width: 100%;
}
.payment-methods .methods{
    background-color: white;
}
    </style>
</head>
<body>
              <%
                      int pid = (int)  request.getAttribute("pid");
                      double price = (double) request.getAttribute("price");
                      String pname = (String) request.getAttribute("pname");
                      
              %>
					   <div id="payment-container">
                    <form action="order" id="payment-form">
                    <input type="hidden" name="pid" value="<%=pid%>">  
                    <input type="hidden" name="price" value="<%=price%>">   
                    <input type="hidden" name="pname" value="<%=pname%>">  
                    <div id="options">
                          <label class="payment-methods"> 
                            <input type="radio" name="method" value="phonepay">  
                            <div class="imgoption"><img src="assets/PhonePay.png" alt=""></div> 
                            <div class="methods">Phone pay</div>
                     </label>
                     <label class="payment-methods">
                            <input type="radio" name="method" value="gpay" >
                            <div class="imgoption"><img src="assets/GPay.png" alt=""></div>
                            <div class="methods">Google Pay</div>
                      </label>
                      <label class="payment-methods">
                            <input type="radio" name="method" value="cod" >
                            <div class="imgoption"><img src="assets/COD.png" alt=""></div>
                            <div class="methods">Cash On Delivery</div>
                      </label>
                      </div>
                      <div id="msg">
                        <p><i class="fa-solid fa-lock"></i>Payments are secure and encrypted</p>
                      </div>
                      <div id="buttons">
                        <input type="submit" value="Continue" id="continue">
                      </div>
                    </form>
                    <div id="payment-container" style="margin: 0px;">
                     <form action="goback">
                     <div id="buttons" >
                     <input type="submit" value="Go back" id="goback" style="color: black; background: transparent;">
                     <input type="hidden" value="Order not placed" name="orderfail">
                     </div>
                     </form>
                     </div>
                 </div>
					
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#pay{
    margin-top:100px;
    text-align: center;
    display: flex;
    align-items: center;
    justify-content: center;
}
 #emptyorder{
    height: 500px;
    width: 500px;
    background-image: url("assets/emptyorder.jpg");
    background-repeat: no-repeat;
    background-size: contain;
}
#emptyorder h2{
    line-height: 45px;
    color: #212020;
    position: absolute;
    left: 22vw;
    top:  45vh;
}
#emptyorder a{
    font-size: 18px;
    background-color: #E39E67;
    padding: 2px 6px;
    border-radius: 20px;
    color: #4B4B4B;
    text-transform: capitalize;
    position: absolute;
    left: 26vw;
    top:  52vh;
}
#emptyorder a:hover{
    color: #212020;
}
 
</style>
</head>
<body>
				<jsp:include page="NavBar.jsp"></jsp:include>
			
			   <div id="pay">
               <div id="emptyorder">
               <h2>You have not ordered yet!</h2>
               <a href="index.jsp">continue shopping</a>
               </div>
               </div>
				
</body>
</html>
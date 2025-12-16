<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="index.css">
    <style type="text/css">
    #cartmsg{
    position: fixed;
    bottom: 30px;
    left: 50%;
    transform: translateX(-50%);
    background-color: #333333;
    color: white;
    padding: 10px 20px;
    border-radius: 20px;
    font-size: 16px;
    display: none;
    z-index: 9999;
}
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
.img img{
    height: 150px;
    width: 100%;
    border-radius: 20px 20px 0px 0px;
    overflow: hidden;
}
.card img:hover{
	transform: scale(1.05);
	 transition-duration : 2s;
}   
.cake-conatiner .cake-img{
    height: 320px;
    /* background-color: #ECEAF6; */
    overflow: hidden;
    border-radius: 20px 20px 0px 0px;
}
.cake-img img{
    height: 320px;
    width: 100%;
    border-radius: 20px 20px 0px 0px;
    transition-duration : 2s;
}
.cake-img img:hover{
	transform : scale(1.05);
}
    </style>
</head>
<body>
        <jsp:include  page="NavBar.jsp"></jsp:include>
             <%
                String ordermsg = (String) request.getAttribute("ordermsg");
                 if(ordermsg!=null){
             %>
                <h3 id="ordermsg"><%=ordermsg %></h3>
                <script type="text/javascript">
                window.addEventListener('DOMContentLoaded',()=>{
                	const ordermsg = document.getElementById("ordermsg");
                	ordermsg.style.display="block";
                	setTimeout(() => {
						ordermsg.style.display="none";
					}, 3000);
                })
                </script>
               <%} %> 
               
                <%
                String logoutmsg = (String) request.getAttribute("logoutmsg");
                 if(logoutmsg!=null){
             %>
                <h3 id="ordermsg"><%=logoutmsg %></h3>
                <script type="text/javascript">
                window.addEventListener('DOMContentLoaded',()=>{
                	const ordermsg = document.getElementById("ordermsg");
                	ordermsg.style.display="block";
                	setTimeout(() => {
						ordermsg.style.display="none";
					}, 3000);
                })
                </script>
               <%} %>
               
                <%
                String loginmsg = (String) request.getAttribute("loginmsg");
                 if(loginmsg!=null){
             %>
                <h3 id="ordermsg"><%=loginmsg %></h3>
                <script type="text/javascript">
                window.addEventListener('DOMContentLoaded',()=>{
                	const ordermsg = document.getElementById("ordermsg");
                	ordermsg.style.display="block";
                	setTimeout(() => {
						ordermsg.style.display="none";
					}, 3000);
                })
                </script>
               <%} %>
               
            <div class="slider">
                <a href="cakes" class="slide"><img src="assets/cakebanner.avif" ></a>
                <a href="anniversary" class="slide"><img src="assets/celebratebanner.avif" ></a>
                <a href="flowers" class="slide"><img src="assets/Flowerbanner.avif"></a>
            </div>
                
           <header>
           
             <div class="card">
                <div class="img"><a href="category?cid=<%=9%>"><img src="assets/Cake.webp" alt=""></a></div>
                <h2>Cakes</h2>
            </div>

             <div class="card">
                <div class="img"><a href="category?cid=<%=3%>"><img src="assets/flowers.avif" alt=""></a></div>
                <h2>Flowers</h2>
            </div>

             <div class="card">
                <div class="img"><a href="category?cid=<%=10%>"><img src="assets/combos.webp" alt=""></a></div>
                <h2>Combos</h2>
            </div>

             <div class="card">
                <div class="img"><a href="category?cid=<%=7%>"><img src="assets/chocolate.webp" alt=""></a></div>
                <h2>Chocolate</h2>
            </div>

             <div class="card">
               <div class="img"><a href="category?cid=<%=4%>"><img src="assets/plants.avif" alt=""></a></div>
               <h2>Plants</h2>
            </div>

             <div class="card">
                <div class="img"><a href="category?cid=<%=1%>"><img src="assets/gifts.avif" alt=""></a></div>
                <h2>Gifts</h2>
            </div>

            <div class="card">
                <div class="img"><a href="category?cid=<%=2%>"><img src="assets/personalised.avif" alt=""></a></div>
                <h2>Personalised</h2>
            </div>
            </div>
           </header>

           <section class="section">
             <div id="heading">
                <h1>Must Have</h1>
             </div>

             <div class="container">
                <div class="side-card">
                        <div class="offer">
                            <a href="category?cid=<%=4%>"><img src="assets/offerplant.avif" alt=""></a>
                        </div>
                        <div class="offer">
                            <a href="category?cid=<%=7%>"><img src="assets/offerchocolate.avif" alt=""></a>
                        </div>
                    
             </div>

             <div class="middle-card">
                        <div class="offer">
                            <a href="category?cid=<%=11%>"><img src="assets/offerbottle.avif" alt=""></a>
                        </div>
             </div>

             <div class="side-card">
                        <div class="offer">
                            <a href="category?cid=<%=3%>"><img src="assets/offerrose.avif" alt=""></a>
                        </div>
                        <div class="offer">
                            <a href="category?cid=<%=2%>"><img src="assets/offeraccessories-d.avif" alt=""></a>
                        </div>    
             </div>
             </div>
           </section>
           
            <div id="gift-section">
                <div class="gift-for">
                    <a href="category?cid=<%=13%>"><img src="assets/gifts-for-him.avif" alt=""></a>
                </div>
                <div class="gift-for">
                     <a href="category?cid=<%=14%>"><img src="assets/gifts-for-her.avif" alt=""></a>
                </div>
           </div>

           <div class="cake-section">
                    <div class="heading">
                        <h2>Chocolates</h2>
                    </div>
                    <div class="sub-heading">
                        <div class="view-btn"></div>
                        <div class="sub">
                            <p>Sweet Temptations to Share</p>
                        </div>
                        <div class="view-btn">
                            <form action="category">
                                <input type="submit" value="VIEW ALL">
                                <input type="hidden" value="7" name="cid">
                            </form>
                        </div>
                    </div>

                    <div class="cake-categories">
                        <a href="category?cid=<%=15%>">
                            <div class="cake-conatiner">
                            <div class="cake-img">
                                <img src="assets/personalised-chocolates.avif" alt="">
                            </div>
                            <h4>Personalised Chocolates</h4>
                            <p>Starting From &#8377; 529</p>
                        </div>
                        </a>

                       <a href="category?cid=<%=16%>">
                        <div class="cake-conatiner">
                            <div class="cake-img">
                                    <img src="assets/chocolates-bouquet.avif" alt="">
                            </div>
                            <h4>Chocolate Bouquet</h4>
                            <p>Starting From &#8377; 599</p>
                        </div>
                       </a>

                       
                       <a href="category?cid=<%=17%>">
                        <div class="cake-conatiner">
                            <div class="cake-img">
                                    <img src="assets/chocolate-hampers.avif" alt="">
                            </div>
                            <h4>Chocolate Hampers</h4>
                            <p>Starting From &#8377; 1099</p>
                        </div>
                       </a>

                       <a href="category?cid=<%=18%>">
                        <div class="cake-conatiner">
                            <div class="cake-img">
                                    <img src="assets/flowers-and-chocolates.avif" alt="">
                            </div>
                            <h4>Flowers and Chocolates</h4>
                            <p>Starting From &#8377; 699</p>
                        </div>
                       </a>
                    </div>
           </div>
             
          
           <footer>
               <div id="connect"><p>Connect with us</p> 
                <a href=""><i class="fa-brands fa-facebook"></i></a>
                <a href=""><i class="fa-brands fa-instagram"></i></a>
                <a href=""><i class="fa-brands fa-whatsapp"></i></a>
                <a href=""><i class="fa-brands fa-linkedin"></i></a>
            </div>
           </footer>

            <script src="index.js"></script>
</body>
</html>

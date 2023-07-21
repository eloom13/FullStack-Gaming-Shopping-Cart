<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ page import ="com.maturski.pojo.*"%>
    <%@ page import ="com.maturski.dao.*"%>
    <%@ page import ="java.sql.*"%>
    <%@ page import ="java.util.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<%@ include file="components/common_cs_js.jsp"%>


<!--  CSS Owl Carousel Slideshow -->
<link rel="stylesheet" href="assets/owl.carousel.min.css">
<link rel="stylesheet" href="assets/owl.theme.default.min.css">
</head>


<body>

	<!-- PRELOADER -->
	<div id="preloader"></div>

	<%@ include file="components/navbar.jsp"%>
	
   
    <%
         String searchResult=(String)request.getAttribute("enteredText");
         String cat=request.getParameter("category"); 
         ProductDaoImp pdao=new ProductDaoImp();
         CategoryDaoImp cdao1=new CategoryDaoImp();
         List<Product> l1=null;
         List<Category> cl1=cdao1.getAllCategory();        
        
         if(cat==null)
         {
        	 cat="0";
        	 
        	 if(cat.trim().equals("0"))
             {
              	l1 = pdao.getAllProduct();
             }
         }
         
         else if(cat.equals("0"))
         {
        	 l1 = pdao.getAllProduct();
         }
         
         else
         {
        	
             int categoryId=Integer.parseInt(cat.trim());
             l1 = pdao.getProductByCategory(categoryId);	 
              
         }
    %>

	<!-- SECTION -->
    <section>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>PLAY LIKE A<span> PRO</span></h1>
                </div>
            </div>
        </div>
    </section>
    
    
    <!-- VIDEO -->
    <video  muted="true" preload="auto" loop="" autoplay="" playsinline="" src="video/video.mp4"></video>
    
    <!-- AFTER VIDEO -->
    <div class="after-video">
        <div class="container">
            <div class="row">
                <p>At GAMEUP, we're passionate about developing premium gaming <br>  hardware that makes you play better. Bosnian engineering since 2022.</p>
            </div>
        </div>
    </div>
    
    <!-- SLIDESHOW -->
    <div class="slideshow">
        <div class="container-fluid">
            <h1>PC GAMING GEAR</h1>
            <div class="owl-carousel owl-theme">

                    <div class="card">
                        <img src="images/slideshow/mouse.png" alt="">
                        <p>Mice</p>
                        <a>Shop Now</a>
                    </div>

                    <div class="card">
                        <img src="images/slideshow/keyboard.png" alt="">
                        <p>Keyboard</p>
                        <a>Shop Now</a>
                    </div>

                    <div class="card">
                        <img src="images/slideshow/headset.png" alt="">
                        <p>Headset</p>
                        <a>Shop Now</a>
                    </div>

                    <div class="card">
                        <img src="images/slideshow/streaming.png" alt="">
                        <p>Streaming</p>
                        <a>Shop Now</a>
                    </div>

                    <div class="card">
                        <img src="images/slideshow/chairs.png" alt="">
                        <p>Chairs</p>
                        <a>Shop Now</a>
                    </div>

                    <div class="card">
                        <img src="images/slideshow//monitors.png" alt="">
                        <p>Monitors</p>
                        <a>Shop Now</a>
                    </div>
            </div>
        </div>
    </div>
    
    
    <!-- FEATURED CONSOLE -->
	<div class="featured-console">

        <h1>CONSOLE GAMING GEAR</h1>
        
               <div class="col-md-12">
                   <div class="featured-playstation">
                       <a id="description" >Playstation Gear</a>
                       <br>
                       <a id="learn-more">Learn More <span> > </span></a>
                   </div>
               </div>

                <div class="col-md-12">
                    <div class="featured-xbox">
                        <a id="description">Xbox Gear</a>
                        <br>
                        <a id="learn-more">Learn More<span> > </span></a>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="featured-nitendo">
                        <a id="description">Nitendo Gear</a>
                        <br>
                        <a id="learn-more">Learn More <span> > </span></a>
                    </div>
                </div>
      </div>    
     
    
     <!-- FEATURED MOBILE -->
    <div class="featured-mobile">
        <div class="container-fluid">
            <div class="row">

                <h1>MOBILE GAMING GEAR</h1>

                <div class="col-md-3">
                    <div class="featured-mobile-controllers">
                        <a id="description">Controllers</a>
                        <br>
                        <a id="learn-more">Learn More <span>></span></a>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="featured-mobile-audio">
                        <a id="description">Audio</a>
                        <br>
                        <a id="learn-more">Learn More <span>></span></a>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="featured-mobile-cases">
                        <a id="description">Cases</a>
                        <br>
                        <a id="learn-more">Learn More <span>></span></a>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="featured-mobile-accesories">
                        <a id="description">Accesories</a>
                        <br>
                        <a id="learn-more">Learn More <span>></span></a>
                    </div>
                </div>
            </div> 
        </div>   
    </div>


	<!-- JOIN OUR COMPANY -->
    <%@ include file="components/joinourcompany.jsp"%>

	<!-- FOOTER -->
 	<%@ include file="components/footer.jsp"%>
 
 
<!--  JS Owl Carousel Slideshow -->
<script src="assets/owl.carousel.min.js"></script>
<script src="assets/jquery.mousewheel.min.js"></script>

<!-- JavaScript Externally -->
<script src="js/design.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> 
</body>
</html>
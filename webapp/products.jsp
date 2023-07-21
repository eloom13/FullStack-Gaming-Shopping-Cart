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
	<link rel="stylesheet" href="css/products.css">
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
              	l1 =pdao.getAllProduct();
             }
         }
         
         else if(cat.equals("0"))
         {
        	 l1 =pdao.getAllProduct();
         }
         
         else
         {
        	
             int categoryId=Integer.parseInt(cat.trim());
             l1=pdao.getProductByCategory(categoryId);	 
              
         }
       
    %>


<!-- SHOW PRODUCTS -->
<div class="text-center"><%@ include file="components/message.jsp"%></div>
	<div class="container-fluid">
		<div class="row">
   
		   <%
		       if(searchResult==null)
		       {
					   %>
					                    
					   	<%
					    	String stock="Out Of Stock!!!"; 
					    	for(Product p:l1)
					        {
					     %>
			                       
			             <div class=" col-md-3" style="margin-top:15px; margin-bottom: 15px;">
			             	<div class="card">           
				            	<img id="slika" src="slike/<%=p.getProductPhoto() %>" style="max-height:270px;max-width:100%;width:auto;" class="card-img-top rounded mx-auto d-block m-2" alt="img">
				                         
				                <div class="card-body">
				                	<h5 class="card-title" style="text-align: left; font-weight: 700;"><a href="product.jsp?productId=<%=p.getProductId()%>" style="text-decoration: none;color:white; font-size:22px;"> <%=p.getProductTitle() %></a></h5>
				                    <p style="font-size:20px; text-align: left; font-weight: 500;"><span><b>&#8364;<%=Helper.getProductSellingPrice(p.getProductPrice(), p.getProductDiscount()) %><%if(p.getProductDiscount()>0){%>/-<%}%></b></span>
				                    <span class="ml-2" style="font-size:20px;color:red"><%if(p.getProductDiscount()>0){%><s>&#8364;<%=p.getProductPrice()%></s><%}%></span>
				                    <span class="ml-2" style="font-size:18px;color:lightgreen"><%if(p.getProductDiscount()>0){%><%=p.getProductDiscount() %>&#37 off<%}%></span> </p>
				                    <ul class="card-text" style="text-align: left; color: gray;"><%=Helper.get10Words(p.getProductDescription()) %></ul>  
				                </div>
									
								<a href="product.jsp?productId=<%=p.getProductId()%>" style="text-decoration: none; font-size:16px;"><button>+ Buy</button></a>
							</div>
			            </div>
			                       
			            <%
			             	}
			            %>
			        </div>
				</div>
				
			     <%
         	} 
   
       else
       {
    	   List<Product> listOfProductFromSearch=new ProductDaoImp().getSearchedProduct(searchResult);
     %>
                 
			<%
		    	String stock="Out Of Stock!!!"; 
		    	for(Product p:l1)
		        {
		     %>
                       
             <div class=" col-md-3" style="margin-top:15px; margin-bottom: 15px;">
             	<div class="card">           
	            	<img src="slike/<%=p.getProductPhoto() %>" style="max-height:270px;max-width:100%;width:auto;" class="card-img-top rounded mx-auto d-block m-2" alt="img">
	                         
	                <div class="card-body">
	                	<h5 class="card-title" style="text-align: left; font-weight: 700;"><a href="product.jsp?productId=<%=p.getProductId()%>" style="text-decoration: none;color:white; font-size:22px;"> <%=p.getProductTitle() %></a></h5>
	                    <p style="font-size:20px; text-align: left; font-weight: 500;"><span><b>&#8364;<%=Helper.getProductSellingPrice(p.getProductPrice(), p.getProductDiscount()) %><%if(p.getProductDiscount()>0){%>/-<%}%></b></span>
	                    <span class="ml-2" style="font-size:20px;color:red"><%if(p.getProductDiscount()>0){%><s>&#8364;<%=p.getProductPrice()%></s><%}%></span>
	                    <span class="ml-2" style="font-size:18px;color:lightgreen"><%if(p.getProductDiscount()>0){%><%=p.getProductDiscount() %>&#37 off<%}%></span> </p>
	                    <ul class="card-text" style="text-align: left; color: gray;"><%=Helper.get10Words(p.getProductDescription()) %></ul>  
	                </div>
						
					<a href="product.jsp?productId=<%=p.getProductId()%>" style="text-decoration: none; font-size:16px;"><button>+ Buy</button></a>
				</div>
            </div>
          
            <%
            	}
            %>
           
     <%
       }
     %> 
    
       
      <!-- JOIN OUR COMPANY -->
    <%@ include file="components/joinourcompany.jsp"%>

	<!-- FOOTER -->
 	<%@ include file="components/footer.jsp"%>

 
 <!-- Ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> 
 
<!--  JS Owl Carousel Slideshow -->
<script src="assets/owl.carousel.min.js"></script>
<script src="assets/jquery.mousewheel.min.js"></script>

<!-- JavaScript Externally -->
<script src="js/design.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> 
</body>
</html>
<%@ page import ="com.maturski.pojo.*"%>
<%@ page import ="com.maturski.dao.*"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>

	<%
	     User user=(User)session.getAttribute("active-user"); 
	%>

	<%
	         CategoryDaoImp cdao=new CategoryDaoImp();
	         List<Category> cl=cdao.getAllCategory();
	%>
	

<header>
	<!-- Pre Header -->
    <div class="pre-header"> 
        <div class="container-fluid">
             <div class="row">
                <ul>
                    <li><a href="#">Our COVID-19 Response</a></li>
                    <li><a href="#"> <img src="images/language/english.png" style="position:relative; bottom:1px;" alt=""> EN</a></li>
      				<li>
					<%
						if(user!=null)
						{
										        	  
							%>
							
							<%
								if(user.getUserType().equals("normal"))
								{
							%>
							
							<%
								}
							%>
												          
							<a href="#" data-toggle="modal" data-target="#showprofilemodal"><%= user.getUserName()%></a>
												       
												   
							<%
						}
										    
						else
						{
							%>
							
							<%
						}
							%>         
					<li> 
                </ul>
            </div>
        </div>
    </div>
    
    
    <!-- Pre Header - Navigation Bar -->
	<nav>
		<div class="container-fluid">
			<div class="row" id="navrow">
		  		<div id="logo" class="col-md-3" style="text-align:left;"><a href="index.jsp"><img src="images/logo.png" alt=""></a></div>
		
	            	<div class="col-md-6" id="categories">
	                	<!-- <a href="products.jsp?category=0">All products</a> -->         
							<%
								for(Category c: cl)
								{    	
									%> 
								   		<a href="products.jsp?category=<%=c.getCategoryId()%>"><%=c.getCategoryTitle() %></a>
								    <%
								}
							%>
	                </div>
	                
		    <%
		        if(user!=null)
		        {
		        	  
		    %>
		          <ul class="col-md-3" style="text-align:right; list-style:none;">
		              
		              <%
		                  if(user.getUserType().equals("normal"))
		                  { 
		              %>
		              	  	<li class="nav-item active" style="display: inline-block;">
		      					<a class="nav-link" href="#" id="search-btn"><img src="images/search.png" style="width:18px;"></a>
		      				</li> 
		      	
					      	<div class="search-wrapper">
					      		<a  href="#" id="close-search"><img src="images/xmark.png" style="width:24px;"></a>
					      		
							    <form action="ProductOperationServlet" method="post">
							        
							        <input type="hidden" name="action" value="searchProduct">
					      			<input  type="text" placeholder="Search product" aria-label="Search products" name="search">
					      			<button type="submit" class="btn"><img src="images/search.png" style="width:22px;"></button>
					      
							    </form>
							</div>
							
		                     <li class="nav-item active" style="display: inline-block;" data-toggle="modal" data-target="#showmycartmodal">
		                        <div style="color:white;" class="nav-link"><img src="images/cart.png" style="width:23px;" alt="img"><a style="background-color:#FF2147;  position:relative; top:-5px; padding-top:1.5px; padding-bottom:1.5px; padding-right:5px; padding-left:5px; border-radius:50px;"><%=new CartDaoImp().totalCartByUserId(user.getUserId()) %></a></div>
		                     </li> 
		                     
		                     <li class="nav-item active" style="display: inline-block;" data-toggle="modal" data-target="#showmyordermodal">
		                        <a class="nav-link" href="#"><img src="images/torder.png" style="width:22px;"></a>
		                     </li>
		              <%
		                  }
		              %>
		                 
		             
					<%
					         if(user!=null)
					         {
					        	 String userType=user.getUserType();
					        	 
					        	 if(userType.equals("admin"))
					        	 {
					  				%>
						                <li class="nav-item active" style="display: inline-block; list-style: none;">
						                    <a class="nav-link" href="admin.jsp" style="color:white"><b>Admin Page</b> <span class="sr-only">(current)</span></a>
						                 </li>
					    	        <%
					        	 }
					         }
					%>
					
		    
		    		<li class="nav-item active" style="display: inline-block;"data-toggle="modal" data-target=".logout-modal">
		             	<a class="nav-link" href="#"><img src="images/logout.png" style="width:22px;"></a>
		             </li> 
		         </ul>
		    <%
		        }
		    
		    
	
		        else
		        {
		    %>
		 
		    <ul class="col-md-3" style="text-align:right; list-style: none;">
		    	<li class="nav-item active" style="display: inline-block;">
		      		<a class="nav-link" href="#" id="search-btn"><img src="images/search.png" style="width:18px;"></a>
		      	</li> 
		      	
		      	<div class="search-wrapper">
		      		<a  href="#" id="close-search"><img src="images/xmark.png" style="width:24px;"></a>
				    <form action="ProductOperationServlet" method="post">
				        <input type="hidden" name="action" value="searchProduct">
		      			<input  type="text" placeholder="Search product" aria-label="Search products" name="search">
		      			<button type="submit" class="btn"><img src="images/search.png" style="width:22px;"></button>
				    </form>
				</div>
		      
				<li class="nav-item active" style="display: inline-block;">
		        	<a class="nav-link" href="login.jsp"><img src="images/usernav.png" style="width:18px;"></a>
		        </li> 
		    </ul>
		    
		    <%
		        }
		    %>  
		 	</div>
		</div>
	</nav>
</header>




<!-- SHOW PROFILE MODAL -->
<div class="modal fade" id="showprofilemodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
    	<div class="modal-content">
  
		      		<div class="modal-header custom-bg text-white text-center">
		        		<h5 class="modal-title" id="exampleModalLongTitle" >MY PROFILE</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
		      		</div>
		      
		      <div class="modal-body">
				<form>  
					<div class="form-row mt-3">
						<div class="form-group col-md-4">
							<label for="inputEmail4">Name</label>
							<input type="text" class="form-control" id="inputEmail4" value="<%if(user!=null){ %><%=user.getUserName() %><%} %>" readonly>
						</div>
							    
						<div class="form-group col-md-4">
							<label for="inputPassword4">Email</label>
							<input type="email" class="form-control" id="inputPassword4" value="<%if(user!=null){ %><%=user.getUserEmail() %><%} %>" readonly>
						</div>
							    
						<div class="form-group col-md-4">
							<label for="inputPassword4">Phone</label>
							<input type="text" class="form-control" id="inputPassword4" value="<%if(user!=null){ %><%=user.getUserPhone() %><%} %>" readonly>
						</div>
					</div>
						  
					<div class="form-group">
						<label for="inputAddress">Address</label>
						<textarea class="form-control" id="inputAddress" placeholder="1234 Main St" rows="3" readonly><%if(user!=null){ %><%=user.getUserAddress() %><%} %></textarea>
					</div>
						  
					<div class="container text-center">
						<button type="button" class="btn  btn-secondary text-light" data-dismiss="modal">Close</button>
						<button type="button" class="btn text-light" data-toggle="modal" data-target=".changepasswordmodal" style="background-color:green; border:0; outline:none;">Change Password
					</div>           
				</form>
			</div>
		</div>
	</div>
</div>



<!-- SHOW MY CART MODAL -->
<div class="modal fade" id="showmycartmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
    
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >MY CART</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      
     <%
      if(user!=null)
      {
    	  List<Cart> l=new CartDaoImp().getCartByUserId(user.getUserId());
     %>
      <div class="modal-body">
        
	        <%
	            if(l.isEmpty())
	            {
			%>
			        <div class="text-center">
				        <h1>CART IS EMPTY!</h1>
				        <hr>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        </div>
			<%
	            }
	        
	        
	            else
	            {		
	        %>
	        
	        <div class="table-responsive">
				<table class="table">
					  <thead class="custom-bg text-white">
					    <tr>
					      <th scope="col" style="text-align:center;">Product Image</th>
					      <th scope="col" style="text-align:center;">Product Title</th>    
					      <th scope="col" style="text-align:center;">Product Description</th>
					      <th scope="col" style="text-align:center;">Quantity</th>
					      <th scope="col" style="text-align:center;">Price</th>
					      <th scope="col" style="text-align:center;">Action</th>
					    </tr>
					  </thead>
					  
					  <tbody>
						   <%
						      CartDaoImp ctdao=new CartDaoImp();
						   %>
						  
						   <%
						      for(Cart c:l)
						      {
						    	  int productId=c.getProductId();
						    	  Product p=new ProductDaoImp().getProductById(productId);
						   %>
						    <tr class="text-center">
						      <td><img style="max-height:100px;max-width:70px;width:auto;" class="img-fluid mx-auto d-block" src="slike/<%=p.getProductPhoto() %>" alt="users_pic" ></td>
						      <td class="mid-align" style="text-align:center;"><%=p.getProductTitle() %></td>
						      <td class=""><%=p.getProductDescription() %></td>
						      <td class="mid-align"><%=c.getQuantity() %></td>
						      <td class="mid-align"><%=c.getPrice() %></td>
						      <td class="" ><a href="CartServlet?cartId=<%=c.getCartId()%>&action=delete"><button type="button" class="btn btn-danger" style="background-color:orange; border:0; outline:none;">Remove</button></a></td>
						    </tr>
						    <%
						      }
						    %>
					  </tbody>
				</table>
			</div>
			
			<hr>
			
			<div class="text-right">
			    <p style="font-size:25px;"><b>Total Price :&#8364;<%=new CartDaoImp().totalPriceFromCart(user.getUserId()) %>/- </b></p> 
			</div>
	
			<hr>
					
			<div class="row">
				<form action="OrderServlet" method="post" onsubmit="sendEmailOrder();">
			    	<input type="hidden" name="action" value="order">
			        <input type="hidden" name="userId" value="<%=user.getUserId()%>">
			        <input type="submit" class="btn  text-light center"   style="background-color:green; border:0; outline:none; margin-bottom: 7.5px; width:100%;" value="Order"></input>
				</form>
			    
			</div>
    
	       <%
	            }
	       %>
      </div>
  <%   
      }
  %>
    </div>
  </div>
</div>


<!-- SHOW MY ORDER MODAL -->
<div class="modal fade" id="showmyordermodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
    
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >MY ORDERS</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      
     <%
      if(user!=null)
      {
    	  List<Order> l=new OrderDaoImp().getOrderByUserId(user.getUserId());
     %>
      <div class="modal-body">
        
	        <%
	            if(l.isEmpty())
	            {
			%>
			        <div class="text-center">
				        <h1>NO ORDERS MADE BY YOU!</h1>
				        <hr>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        </div>
			<%
	            }
	        
	        
	            else
	            {		
	        %>
	        
	        <div class="table-responsive">
				<table class="table">
					  <thead class="custom-bg text-white">
					    <tr>
						     <th scope="col" style="text-align:center;">Product Image</th>
	      					 <th scope="col"style="text-align:center;">Product Title</th> 
						     <th scope="col"style="text-align:center;">Product Description</th>    
						     <th scope="col"style="text-align:center;">Quantity</th>
						     <th scope="col"style="text-align:center;">Price</th>
						     <th scope="col"style="text-align:center;">Ordered Date</th>
						     <th scope="col"style="text-align:center;">Delivery Date</th>
						    </tr>
					  </thead>
					  
					  <tbody>
						   <%
						      OrderDaoImp otdao=new OrderDaoImp();
						   %>
						  
						   <%
						      for(Order o:l)
						      {
						    	  int productId=o.getProdctId();
						    	  Product p=new ProductDaoImp().getProductById(productId);
						   %>
						    <tr class="text-center">
						      <td><img style="max-height:100px;max-width:70px;width:auto;" class="img-fluid mx-auto d-block" src="slike/<%=p.getProductPhoto() %>" alt="users_pic" ></td>
						      <td class="mid-align"><%=p.getProductTitle() %></td>
						      <td class=""><%=p.getProductDescription() %></td>
						      <td class="mid-align"><%=o.getQuantity() %></td>
						      <td class="mid-align"><%=o.getPrice() %></td>
						      <td class="mid-align"><%=o.getOrderesDate() %></td>
      						  <td class="mid-align"><%if(o.getDeliveryDate().equals("0")){ %><span style="color:red;"> <%="processing.."%></span>    <%} else { %> <%=o.getDeliveryDate() %><%} %></td>
						    </tr>
						    <%
						      }
						    %>
					  </tbody>
				</table>
			</div>
			
			<hr>
			
			<div class="text-right">
			     <p style="font-size:25px;"><b>Total Price :&#8364;<%=new OrderDaoImp().totalOrderPrice(user.getUserId()) %>/- </b></p>
			</div>
	
			<hr>
					
			<button type="button" class="btn btn-secondary" style=" width:100%;" data-dismiss="modal">Close</button>
			
	       <%
	            }
	       %>
      </div>
  <%   
      }
  %>
    </div>
  </div>
</div>




<!-- LOGOUT MODAL -->
<div class="modal fade logout-modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
	    <div class="modal-header custom-bg text-white text-center">
	        <h5 class="modal-title" id="exampleModalLongTitle" >Log Out</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	    </div>
	    
	    <div class="modal-body text-center">
			<h5>Do you want to logout?</h5>
			
	         <div class="text-center">
	            <a href="LoginServlet"><button type="button" class="btn custom-bg text-white">Yes</button></a>
	            <button type="button" class="btn btn-secondary ml-5" data-dismiss="modal">No</button>
	         </div> 
	     </div>     
    </div>
  </div>
</div>



<!-- ABOUT US MODAL -->
<div class="modal fade aboutusmodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
    
       <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >About Us</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div> 
      
      <div class="modal-body">
        <div class="container">
        <p style="font-size:20px;"><b>
              An GAMEUP website, by definition, is a website that allows you to buy and sell tangible goods,
              digital products or services online. Trade, be it barter exchange or buying and selling of goods and
              services has been prevalent for centuries. No one can be self-sufficient. And this brings out the need
              for demand and supply of goods and services.<br><br> Transactions have been going on all over the world
              for centuries, locally, and across locations. Keeping the same concept in mind, now think electronic.
              However, also bear in mind that with the whole world going online, data privacy laws have become increasingly stringent.
              And before you begin, an eCommerce venture you should be aware of all the legal policies required for your online website.
          </b></p>
        </div>
      </div>
      
      <div class="modal-footer">
      	<div class="text-center">
        	<button type="button" class="btn custom-bg text-white" data-dismiss="modal">Close</button>
       	</div>
      </div>
    </div>
  </div>
</div>


<!-- CONTACT US -->
<div class="modal fade contactusmodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
       <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Contact Us</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
        <div class="container text-center">
        <p style="font-size:23px;">
            <b>
                <img src="images/phone.png" style="width:27px; margin-right: 10px;" alt="img">+91 8767663594 / +91 7845961032<br>
                <img src="images/mail.png" style="width:29px; margin-right: 10px;" alt="img">gameup.info.eu@gmail.com
            </b>
        </p>
        </div>
      </div>
      <div class="modal-footer">
       <div class="text-center">
        <button type="button" class="btn custom-bg text-white" data-dismiss="modal">Close</button>
       </div>
      </div>
    </div>
  </div>
</div>


<!-- CHANGE PASSWORD MODAL -->
<div class="modal fade changepasswordmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Change Password</h5>
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      
			<div class="modal-body">
          		<form action="LoginServlet" method="post">
	          		<input type="hidden" name="action" value="changePassword">
	          		
			  		  <div class="form">
					      <div class="form-group ">
					      	<label for="inputPassword4">Email</label>
					      	<input type="email" class="form-control" id="inputPassword4" value="<%if(user!=null){ %><%=user.getUserEmail() %><%} %>" readonly>
					      </div>
					    
					      <div class="form-group">
					      	<label for="inputPassword4">Password</label>
					      	<input type="password" class="form-control" id="pass" name="pass" >
					      </div>
					    
					      <div class="form-group">
					      	<label for="inputPassword4">Confirm Password</label>
					      	<input type="password" class="form-control" id="cpass" name="cpass">
					      </div>
			  		  </div>
			 
				  	  <div class="container text-center">
				      	<input type="submit" class="btn custom-bg text-light" value="Change">
				       	<button type="button" class="btn custom-bg text-light ml-5" data-dismiss="modal">Close</button>                                
				  	  </div>   
				</form>
      		</div>
    	</div>
	</div>
</div>


<!-- FORGET PASSWORD MODAL -->
<div class="modal fade forgetpasswordmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Forget Password</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="LoginServlet" method="post">
          <input type="hidden" name="action" value="forgetPassword">
         
  <div class="form">
 
    <div class="form-group ">
      <label for="inputPassword4">Email</label>
      <input type="email" class="form-control" id="email" name="email" required>
    </div>
    <div class="form-group ">
      <label for="inputPassword4">Phone</label>
      <input type="text" class="form-control" id="phone" name="phone" required>
    </div>
    <div class="form-group">
      <label for="inputPassword4">Password</label>
      <input type="password" class="form-control" id="pass" name="pass" required>
    </div>
    <div class="form-group">
      <label for="inputPassword4">Confirm Password</label>
      <input type="password" class="form-control" id="cpass" name="cpass"required>
    </div>
  </div>
 
  <div class="container text-center">
       
       <input type="submit" class="btn text-light" value="Change" style="background-color:orange; border:0; outline:none;">
       <button type="button" class="btn custom-bg text-light ml-5" data-dismiss="modal">Close</button>
                                      
  </div>   
</form>
      </div>
    </div>
  </div>
</div>



<script>
	    function sendEmailOrder()
	    {
	        Email.send({
	        Host : "smtp.elasticemail.com",
	        Username : "gameup.info.eu@gmail.com",
	        Password : "99FDFC033B7325A97BCE867ED3DD53D81B2E",
	        To : "<%if(user!=null){ %><%=user.getUserEmail() %><%} %>",
	        From : "gameup.info.eu@gmail.com",
	        Subject : "Gameup Product Order!",
	        Body : "Hi " + "<%if(user!=null){ %><%=user.getUserName() %><%} %>" + ", <br>" + "You made order on our website. <br> Full price is: <%if(user!=null){ %><%=new CartDaoImp().totalPriceFromCart(user.getUserId()) %><%} %>" +"<span>&#8364;</span>" 
	        }).then(
	        message => alert(message)
	        );
		}
    </script>
    


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> 

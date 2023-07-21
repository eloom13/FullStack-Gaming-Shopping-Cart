<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login-Gameup</title>
<%@ include file="components/common_cs_js.jsp"%>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
  <%@ include file="components/navbar.jsp"%>
  
 <div class="login">

    <h1>Login</h1>
    <a href="register.jsp">Create Account</a>
    
     <%@ include file="components/message.jsp"%>
         
	<div class="vh-50 gradient-custom">
		<div class="container py-4 h-100">
		 	<div class="row d-flex justify-content-center align-items-center h-50">
		     	<div class="col-12 col-md-8 col-lg- col-xl-5">
		        	<div class="card bg-dark text-white" style="border-radius: 1rem;">
		             	<div class="card-body p-5 text-left">
		                        
		                    <form action="LoginServlet" method="post">
								<div class="mb-md-1 mt-md-1 pb-1">
		                             <div class="form-group">
                           				<label for="exampleInputEmail1" style="position: relative; top:7.5px;">Email</label>
                           				<input type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp" placeholder="" required>
                       				 </div>
                       											
						             <div class="form-group">
						             	<label for="exampleInputPassword1" style="position: relative; top:7.5px;">Password</label>
						             	<input type="password" class="form-control" id="exampleInputPassword1" name="password" placeholder="" required>
						             </div>
		                
		                             <p class="small mb-4 pb-lg-4"><a class="text-white-50" data-toggle="modal" data-target=".forgetpasswordmodal" >Forgot password?</a></p>

		                
		                             <div class="container text-center">
                            			<button type="submit" id="loginbtn" class="btn">Submit</button>
                       				</div>
		                    	</div>
							</form>         
		            	</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


	<!-- JOIN OUR COMPANY -->
    <%@ include file="components/joinourcompany.jsp"%>


    <!-- FOOTER -->
 	<%@ include file="components/footer.jsp"%>
    

</body>
</html>
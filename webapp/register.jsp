<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register-Gameup</title>
<%@ include file="components/common_cs_js.jsp"%>
<link rel="stylesheet" href="css/registration.css">

</head>
<body>
  <%@ include file="components/navbar.jsp"%>
  

<div class="registration">

    <h1>Create Account</h1>
    <a href="index.jsp">Return to Store</a>
    
    <%@ include file="components/message.jsp"%>
    
    <div class="vh-50 gradient-custom">
        <div class="container py-4 h-10">
            <div class="row d-flex justify-content-center align-items-center h-50">
                <div class="col-12 col-md-8 col-lg- col-xl-5">
                    <div class="card bg-dark text-white" style="border-radius: 1rem;">
                        <div class="card-body p-5 text-left">
                            <form  action="RegisterServlet" method="post"  onsubmit="sendEmailUser();">
                                <div class="form-group">
				                     <label for="name" style="position: relative; top:7.5px;">Full Name</label>
				                     <input type="text" id="fullname" class="form-control" id="name" aria-describedby="emailHelp" name="username" placeholder="" required>
				                 </div>
				                 
				                  <div class="form-group">
				                     <label for="email" style="position: relative; top:7.5px;"> Email</label>
				                     <input type="email" id="register" class="form-control" aria-describedby="emailHelp" name="useremail" placeholder="" required>
				                 </div>
				                 
				                 <div class="form-group">
				                     <label for="password" style="position: relative; top:7.5px;">Password</label>
				                     <input type="password" class="form-control" id="password" aria-describedby="emailHelp" name="userpassword" placeholder="" required>
				                 </div>
				                 
				                 <div class="form-group">
				                     <label for="phone" style="position: relative; top:7.5px;">Phone</label>
				                     <input type="number" class="form-control" id="phone" aria-describedby="emailHelp" name="userphone" placeholder="" required>
				                 </div>
				                 
				                 <div class="form-group">
				                     <label for="phone" style="position: relative; top:7.5px;">Address</label>
				                     <textarea class="form-control" placeholder="" name="useraddress" required></textarea>
				                 </div>
				                 
				                 <div class="container text-center">
				                      <button type="submit" id="registerbtn">Register</button>
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
    
   <script>
	    function sendEmailUser()
	    {
	        Email.send({
	        Host : "smtp.elasticemail.com",
	        Username : "gameup.info.eu@gmail.com",
	        Password : "99FDFC033B7325A97BCE867ED3DD53D81B2E",
	        To : document.getElementById("register").value,
	        From : "gameup.info.eu@gmail.com",
	        Subject : "WELCOME TO GAMEUP!",
	        Body : "Dear " + document.getElementById("fullname").value + "," + " <br> You recently created an Gameup account. <br> The Gameup Team"
	        }).then(
	        message => alert(message)
	        );
		}
    </script>
</body>
</html>
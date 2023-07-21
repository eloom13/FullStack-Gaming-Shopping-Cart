 <!-- JOIN OUR COMPANY -->
    <div class="join-our-company">
        <div class="container">
            <div class="row">
                <h3>STAY IN TOUCH WITH THE <span>GAMEUP</span></h3>
                <p>Join Our Community</p>
                <form onsubmit="sendEmailSubscribe(); reset(); return false;">
                    <input style="border:0; outline:none; width:30%;" id="subscribe" type="email" placeholder="Enter your email">
                    <input type="submit">
                </form>
            </div>
        </div>
    </div>
    
    
    
    <script>
	    function sendEmailSubscribe()
	    {
	        Email.send({
	        Host : "smtp.elasticemail.com",
	        Username : "gameup.info.eu@gmail.com",
	        Password : "99FDFC033B7325A97BCE867ED3DD53D81B2E",
	        To : document.getElementById("subscribe").value,
	        From : "gameup.info.eu@gmail.com",
	        Subject : "Welcome to GAMEUP!",
	        Body : "You will be the first to know about the latest GAMEUP news, delas and events. <br> The Gameup Team"
	        	 
	        }).then( //message => alert(message)
	        		
	        );
		}
    </script>
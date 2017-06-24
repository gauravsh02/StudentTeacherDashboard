<!DOCTYPE html> 
<html>

<head>
  <title>S T Dashboard</title>
  <link rel="stylesheet" type.........="text/css" href="css/style.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <!--<script type="text/javascript" src="js/modernizr-1.5.min.js"></script> -->
</head>

<body>

  <div id="main">		

    <header>
	  <div id="strapline">
	    <div id="welcome_slogan">
	      <h3><span>STUDENT TEACHER DASHBOARD </span></h3>
	    </div><!--close welcome_slogan-->
      </div><!--close strapline-->	  
	  <nav>
	    <div id="menubar">
          <ul id="nav">
            <li class="current"><a href="index.jsp">Home</a></li>
            <li><a href="noice.jsp">Notices</a></li>
            <!-- <li><a href="calendar.jsp">Calendar</a></li> -->
            <li><a href="login.jsp">Login</a></li>
			<li><a href="register.jsp">Signup</a></li>
            <li><a href="contact.jsp"> Contact Us</a></li>
          </ul>
        </div><!--close menubar-->	
      </nav>
    </header>
    
   
         <div id="slideshow_container">  
	  <div class="slideshow">
	    <ul class="slideshow">
          <li class="show"><img width="1280" height="240" src="images/home_1.jpg" alt="&quot;Student Teacher Dashboard&quot;" /></li>
	      <li class="show"><img width="1280" height="240" src="images/home_2.jpg" alt="&quot;Student Teacher Dashboard&quot;" /></li>
		  <li class="show"><img width="1280" height="240" src="images/home_3.jpg" alt="&quot;Student Teacher Dashboard&quot;" /></li>
        </ul>
	  </div>
	  <!--close slideshow-->  	
	</div><!--close slideshow_container-->   
	
	<div id="site_content">		
	   
	  <div id="content">
	  <div class="content_item">
		  <h1 align="center">Welcome To Student Teacher Dashboard</h1> 
          <p>The Student Teacher Dashboard system is designed to improve communication between teachers and students by using an online dashboard as a communication channel. </p>
             	
          <br>		
		</div>
	  <div class="content_container">
		    <p>Already registered User Login here.</p>
		  	<div class="button_small">
		      <a href="signin.jsp">Login</a>
		    </div><!--close button_small-->
		  </div><!--close content_container-->
          <div class="content_container">
		    <p>New Student register here.</p>          
		  	<div class="button_small">
		      <a href="register.jsp">Register</a>
		    </div><!--close button_small-->		  
		  </div><!--close content_container-->
	  	<div class="clear" ></div>
        <!--close content_item-->
      </div><!--close content-->   
	</div><!--close site_content-->  	
<br><br>
    <footer>
	  <jsp:include page="footer.jsp" />
    </footer>
	
  </div><!--close main-->
  
  <script>
var slideIndex = 0;
carousel();
function carousel() {
    var i;
    var x = document.getElementsByClassName("show");
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none"; 
    }
    slideIndex++;
    if (slideIndex > x.length) {slideIndex = 1;} 
    x[slideIndex-1].style.display = "block"; 
    setTimeout(carousel, 2000); // Change image every 2 seconds

}
  </script>
</body>
</html>

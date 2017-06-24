<!DOCTYPE html> 
<html>

<head>
  <title>S T Dashboard</title>
  <link rel="stylesheet" type="text/css" href="css/style1.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <!--<script type="text/javascript" src="js/modernizr-1.5.min.js"></script> -->
  <style type="text/css">
<!--
.style4 {color: #0066FF}
-->
  </style>
</head>

<body>

  <div id="main">		

    <header>
	  <div id="strapline">
	    <div id="welcome_slogan">
	      <h3><span>STUDENT TEACHER DASHBOARD </span></h3>
	    </div><!--close welcome_slogan-->
      </div><!--close strapline-->	  
    </header>
 	
<div id="site_content">
<div class="leftside">
	<jsp:include page="adminmenu.jsp" /></div>

<div class="rightside">

<div class="rightside_head">Welcome <%= (String) session.getAttribute("name") %> to Teacher <a href="ateacherview.jsp"> <span class="style4">View</span></a></div>  
<br>
<br> 
<h2>New Teacher Sign Up..</h2>
<form action="ateacher1.jsp" >
Check Email ID  <input type="email" name="t1" placeholder="email id"/> <input type="submit" value="Check"/><br>
<%
try{
String z= request.getParameter("a1");
if(z.equalsIgnoreCase("error")){
out.print("<font color=red size=2>Email ID is Already Registered. Try Another</font>");
}
}catch(Exception e){  }
%>
</form> 


</div>
</div>
<!--close site_content-->

<br><br><br><br><br><br><br><br><br><br><br><br>

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

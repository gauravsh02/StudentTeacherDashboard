<!DOCTYPE html> 
<html>

<head>
  <title>S T Dashboard</title>
  <link rel="stylesheet" type="text/css" href="css/style1.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <!--<script type="text/javascript" src="js/modernizr-1.5.min.js"></script> -->
  <script language="javascript">
window.history.forward(-1);
</script>
  <style type="text/css">
<!--
.style4 {color: #0066FF}
-->
  </style>
</head>

<body>
<% 
     String x= (String)session.getAttribute("name"); 
      
      if(x==null)
  {
      %>
      <jsp:forward page="signin.jsp"  >
	  <jsp:param name="a1" value="error" />
	  </jsp:forward>  
<%
  }
  
  %>
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

<div><span class="rightside_head">Welcome <%= (String) session.getAttribute("name") %> to Sign Out. </span></div>.  <br>
<br>

 <font size="3">   Please Confirm to <a href="index1.jsp" class="style4">Sign out</a></font> </div>
</div>
<!--close site_content-->

<br><br><br><br><br><br><br><br><br><br><br>

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

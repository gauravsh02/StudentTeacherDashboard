<!DOCTYPE html> 
<html>

<head>
  <title>S T Dashboard</title>
  <link rel="stylesheet" type="text/css" href="css/style1.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <!--<script type="text/javascript" src="js/modernizr-1.5.min.js"></script> -->
  <style type="text/css">
<!--
.style3 {
	font-size: 20px;
	color: #660000;
	font-weight: bold;
}
-->
  </style>
</head>

<body>
<% 
     String z= (String)session.getAttribute("name"); 
      
      if(z==null)
  {
      %>
      <jsp:include page="signin.jsp"  >
	  <jsp:param name="a1" value="error" />
	  </jsp:include>  
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

<div class="rightside_head">Welcome <%= (String) session.getAttribute("name") %> to Calendar Event <a href="acalview.jsp">View</a>.</div>  <br>
<br>
<h2>Enter Calendar Event</h2>
<form action="acal1.jsp">
<table width="499" height="270">
<tr><td width="90">Year</td> 
<td width="397"> <select name="yr"> 
<%	for(int i=2017 ;i<2100;i++){	%>
  	<option value="<%=i %>"><%=i %></option>
<%	} %>
</select></td></tr>

<tr><td>Month</td> 
<td> <select name="mon"> 
<%	for(int j=0 ;j<12;j++){	%>
  	<option value="<%=j%>"><%=(j+1)%> </option>
<%	} %>
</select></td></tr>

<tr><td>Date</td> 
<td> <select name="dt"> 
<%	for(int k=1 ; k<32; k++){	%>
  	<option value="<%=k%>"><%=k%></option>
<%	} %>
</select></td></tr>

<tr><td>Event</td> 
<td><textarea name="ev" rows="8" cols="40"></textarea></td></tr>

<tr><td></td> 
<td><input type="submit" value="Submit"> <input type="reset" value="Reset"></td></tr>
</table>
</form>


</div>
</div>
<!--close site_content-->

<br><br><br><br>

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

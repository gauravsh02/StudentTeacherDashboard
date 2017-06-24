<%@ include file="dbcon.jsp" %>
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
<h2></h2>
<%
try{
String z= request.getParameter("a1");
st.executeUpdate("delete from teacher where tid='"+z+"'");
st.executeUpdate("delete from login where uid='"+z+"'");
out.print("<font color=green size=2>Teacher Reomved Successfully.</font>");
con.close();
}catch(Exception e){  }
%>



</div>
</div>


<br><br><br><br><br><br><br><br><br><br><br><br>

    <footer>
	  <jsp:include page="footer.jsp" />
    </footer>
	
  </div>
  
  
</body>
</html>

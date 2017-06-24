<%@ include file="dbcon.jsp"  %>
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
<h2>Calendar Entry Status</h2>

<%
try{ 
 String yr= request.getParameter("yr");
 String mon= request.getParameter("mon");
 String dt= request.getParameter("dt");
 String ev= request.getParameter("ev");
 ResultSet rs=st.executeQuery("select * from calevent where yr="+yr+" and mon="+mon+" and dt="+dt+" and event='"+ev+"'");
 if(rs.next()){
	 out.print("<font color=red size=3>The Event is Already published.</font>"); 
 }else{
	 String	qry="insert into calevent(yr,mon,dt,event) values("+yr+", "+mon+", "+dt+", '"+ev+"')";
	 st.executeUpdate(qry);
	 out.print("<font color=green size=3>The Event is published.</font>");
 }
 con.close();
}catch(Exception e){ }
%>


</div>
</div>
<!--close site_content-->

<br><br><br><br><br><br><br><br><br><br>

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

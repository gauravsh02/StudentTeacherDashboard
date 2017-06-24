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
	<jsp:include page="studmenu.jsp" /></div>

<div class="rightside">

<div class="rightside_head">Welcome <%= (String) session.getAttribute("name") %> to Student View.</div>  <br>
<br>

<%
try{
ResultSet rs= st.executeQuery("select * from student where sid='"+request.getParameter("sid")+"'");
if(rs.next()) {  %>
<table width="585" height="248">
<tr> <td width="133">Name</td>
<td width="440"><%=rs.getString(2)%></td></tr>
<tr> <td>Regdno</td><td><%=rs.getString(3)%></td></tr>
<tr> <td>Brnch</td><td><%=rs.getString(4)%></td></tr>
<tr> <td>Phone No</td><td><%=rs.getString(5)%></td></tr>
<tr> <td>Mail ID</td><td><%=rs.getString(6)%></td></tr>
<tr> <td>Date of Birth</td><td><%=rs.getString(7)%></td></tr>
<tr> <td>Gender</td><td><%=rs.getString(8)%></td></tr>
<tr> <td>Marital Status</td> <td><%=rs.getString(9)%></td></tr>
<tr> <td>Current Address</td><td><%=rs.getString(10)%></td></tr>
<tr> <td>College</td><td><%=rs.getString(11)%></td></tr>
</table>
<%
}
con.close();
}catch(Exception e){   out.print(e);   }   %>


</div>
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

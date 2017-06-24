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
	<jsp:include page="teachmenu.jsp" /></div>

<div class="rightside">

<div class="rightside_head">Welcome <%= (String) session.getAttribute("name") %> to Query Answer <a href="tqueryview.jsp">View</a></div>  <br>
<br>


<%
try{ 
ResultSet rs= st.executeQuery("select * from fquery where slno="+request.getParameter("a1"));	 
if(rs.next()) { 
%>
<form action="tquery2.jsp">
<input type="hidden" name="a1" value="<%=request.getParameter("a1")%>" />
<table width="701" height="229">
<tr><td width="83">Student</td><td width="606"><%=rs.getString(2)%></td></tr>
<tr><td>Query</td><td><%=rs.getString(3)%></td></tr>
<tr><td>Answer</td><td><textarea rows="10" cols="60" name="ans"></textarea></td></tr>
<tr><td>Query</td><td><input type="submit" value="Submit"> <input type="reset" value="Reset"></td></tr>
</table>
</form>
<% 	}
con.close();
}catch(Exception e){  }
%>
 
 
 
</div>
</div>
<!--close site_content-->

<br><br><br><br><br><br><br><br>

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

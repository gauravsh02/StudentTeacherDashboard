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
.style5 {color: #0066FF; font-size: 12px; }
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

<div class="rightside_head">Welcome <%= (String) session.getAttribute("name") %> to Student View</div>  
<br>
<br> 
<form action="astudview1.jsp">
<h2></h2>
Choose Student <select name="sid">
<%
try{
ResultSet rs= st.executeQuery("select * from student order by name");
while(rs.next()){ %>
<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
<%
}
}catch(Exception ee){  }
%>
</select> <input type="submit" value="Go"> </form><br>

<%
try{
ResultSet rs= st.executeQuery("select * from student limit 10");
%>
<table border="1" ><tr> 
<td>Name</td>
<td>Regdno</td>
<td>Brnch</td>
<td>Phone No</td>
<td>Mail ID</td>
<td>Date of Birth</td>
<td>Gender</td>
<td>Marital Status</td> 
<td>Current Address</td>
<td>College</td>
<td>Action</td>
</tr>


<%    while(rs.next()) {   %>
<tr>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)%></td>
<td><%=rs.getString(8)%></td>
<td><%=rs.getString(9)%></td> 
<td><%=rs.getString(11)%></td>
<td><%=rs.getString(12)%></td>
<td><a href="astudel.jsp?a1=<%=rs.getString(1)%>">Delete</a></td>
</tr>
<%    }   %>
</table>
<%
con.close();
}catch(Exception e){   out.print(e);   }   %>



</div>
</div>
<!--close site_content-->

<br><br><br><br><br><br><br><br><br><br><br><br>

    <footer>
	  <jsp:include page="footer.jsp" />
    </footer>
	
  </div><!--close main-->
  
  
</body>
</html>

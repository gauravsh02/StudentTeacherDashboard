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
.style4 {
	font-size: 16px;
	color: #0066FF;
}
.style6 {
	font-size: 12px;
	color: #0066FF;
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

<div class="rightside_head">Welcome <%= (String) session.getAttribute("name") %> to Subject <a href="tsubview.jsp" class="style4">View</a></div>  
<br>
<br>

<%
try{
ResultSet  rs=st.executeQuery("select * from subject");
if(rs.next()){
	rs.beforeFirst();
%>
	<table width="507" height="56">
	<tr><td width="69">Sl. no</td>
		<td width="121">Subject ID</td>
		<td width="214">Subject Name</td>
		<td width="83">Action</td>
	</tr>
<%
	int cnt=1;
	while(rs.next()){
	
%>
	<tr><td><%= cnt++ %></td>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td>  <a href="tsubedit.jsp?a1=<%=rs.getString(1)%>&a2=E" class="style6">Edit</a> <a href="tsubedit.jsp?a1=<%=rs.getString(1)%>&a2=D" class="style6">Delete</a>  </td>
	</tr>
<%
	}
%>	
	</table>
<%
	
}
con.close();			 
}catch(Exception e){ out.print(e); }
%>


</div>
</div>
<!--close site_content-->

<br><br><br><br><br><br><br><br><br><br><br>

    <footer>
	  <jsp:include page="footer.jsp" />
    </footer>
	
  </div><!--close main-->
</body>
</html>

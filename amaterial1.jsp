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
.style1 {
	color: #0066FF;
	font-size: 16px;
}
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

<div class="rightside_head">Welcome <%= (String) session.getAttribute("name") %> to Material <a href="amaterial.jsp" class="style1">View </a>.</div>  
<br>
<br>

<table width="755" cellpadding="5" border="1"> 
<tr>
<td>Material Type</td>
<td>Description</td>
<td>View</td>
<td>Uploaded By</td>
<td>Action</td>
</tr>      
<%
try{
String s1=request.getParameter("sub");
String ar[]=s1.split("-");
out.print("<h2>Subject : " +ar[1]+"</h2>");
//out.print("select * from material a where  a.subid='"+ar[0]+"'");
ResultSet rs= st.executeQuery("select * from material a, teacher b where  a.subid='"+ar[0]+"' and a.uid=b.tid");
while(rs.next()){
%>
<tr>
<td width="110"><%=rs.getString(4)%> </span></td>
<td width="423"><%=rs.getString(6)%> </span></td>
<td width="99"> <span class="style6"><a href="amaterial2.jsp?a1=<%=rs.getString(1)%>&a2=<%=ar[1]%>"><%= rs.getString(5)%></a></span></td>
<td width="423"><%=rs.getString(9)%> </span></td>
<td width="71"><span class="style5"><a href="amaterial3.jsp?a1=<%=rs.getString(1)%>">Delete</a> </span></td>
</tr>
<%
}
con.close();
}catch(Exception e){ out.print(e); }
%>
</table>



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

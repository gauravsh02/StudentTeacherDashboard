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

<div class="rightside_head">Welcome <%= (String) session.getAttribute("name") %> to Notice Detail.</div>  <br>
<br>


<br /> <img src="images/line.jpg" width="950" height="5" alt="" class="fl" /> <br />
<%
try{  
 String qry="select * from notice order by ndate desc limit 6";
 ResultSet rs=st.executeQuery(qry);
 while(rs.next()){
%>
<br />
<table><tr><td>
 <table width="658">
 	 <tr><td width="150" height="28" valign="top">  Notice No :  <%=rs.getString(1)%>  </td><td width="539" valign="top"><div align="right">  Dated :  </div></td><td width="143" valign="top"> <%=rs.getString(3)%>  </td></tr>
	   
 	 <tr>
 	   <td height="31" valign="top"> Subject :  </td> <td colspan="2" align="left" valign="top"> <%=rs.getString(4)%> </td></tr>
	 
 	 <tr>
 	   <td height="58" valign="top"> Matter :  </td>
 	   <td colspan="2" valign="top"><div align="justify"> <%=rs.getString(5)%>  </div></td></tr>
	 
 	 <tr><td height="26" valign="top"> </td> <td valign="top"> Contact Person : </div></td><td valign="top">  <%=rs.getString(6)%> </td></tr>
	 
 	 <tr><td valign="top"> </td> <td valign="top"> Phone : </div></td><td valign="top">  <%=rs.getString(7)%> </td></tr> 
 </table>
 </td>
 <td><img src="images/notice/<%=rs.getString(9)%>" width="270" height="175" alt="" class="fl" /> </td>
 </tr>
 </table>
 <br /> <img src="images/line.jpg" width="950" height="5" alt="" class="fl" /> <br />
 
 
<%
 }
 con.close();
}catch(Exception e){ }
%>


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

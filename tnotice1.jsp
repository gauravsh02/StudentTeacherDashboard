<%@ include file="dbcon.jsp"  %>
<%@ page language="java" %>

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

<div class="rightside_head">Welcome <%= (String) session.getAttribute("name") %> to Notice <a href="tnoticeview.jsp">View.</a></div>  <br><br>
<h2> Notice Image Upload </h2>

<%
try{ 
 String sub= request.getParameter("subj");
 String mat= request.getParameter("mat");
 String per= request.getParameter("per");
 String phn= request.getParameter("pho");
 String dt= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
 String qry="select * from notice where subject='"+sub+"' and matter='"+mat+"' and contprsn='"+per+"' and phone='"+ phn+"' and ndate='"+dt+"'";
 ResultSet rs=st.executeQuery(qry);
 if(rs.next()){
 	out.print("<font color=#993300 size=3>The notice is already published.</font>");
 }else{
	qry="select max(substr(nid, 2)) from notice";
	rs=st.executeQuery(qry);
	int cnt=0;
	if(rs.next())
		cnt=rs.getInt(1);
	cnt++;
	String nid="N"+cnt+"-"+dt.substring(0,4);
	qry="insert into notice values('"+nid+"', '"+(String)session.getAttribute("uid")+"', '"+dt+"', '"+sub+"', '"+ mat+"', '"+per+"', '"+phn+"', 'A','')";
	st.executeUpdate(qry);
	session.setAttribute("notice",nid);
	out.print("<font color=green size=3>The notice is published.</font>");
 }
 con.close();
}catch(Exception e){ }
%>
<font color=green size=3>Choose Picture of Notice.</font>
<FORM ENCTYPE="multipart/form-data" ACTION="upservlet3" METHOD=POST>

<table border="0" bgcolor=#ccFDDEE>
<tr>
	<td colspan="2" align="center"><B>UPLOAD THE FILE</B></td>
</tr>
<tr><td colspan="2" align="center"> </td></tr>
<tr><td><b>Choose the file To Upload:</b></td>
<td><INPUT NAME="file" TYPE="file"></td>
</tr>
<tr><td colspan="2" align="center"> </td></tr>
<tr>
  <td colspan="2" align="center"><input name="submit" type="submit" value="Send File" /></td>
</tr>
</table>

</FORM>



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

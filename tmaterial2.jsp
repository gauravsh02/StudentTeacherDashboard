<%@ include file="dbcon.jsp" %>
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

<div class="rightside_head">Welcome <%= (String) session.getAttribute("name") %> to Material <a href="tmatview.jsp">View</a>.</div>  <br>
<br>

<%! String p1="", id="";%>
<%
try{  
String subj = request.getParameter("subj"); 
String type = request.getParameter("typ"); 
String cat = request.getParameter("cat");  
String descrip = request.getParameter("descrip");
String dt = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
id=(String) session.getAttribute("uid");
String qry="select * from material where uid='"+id+"' and subid='"+subj+"'  and type='"+type+"' and category='"+cat+"' and  descrip='"+descrip+"'";
ResultSet rs=st.executeQuery(qry);
//if(rs.next()){	
	//out.print("<font color=red size=+1 >Material is already Registered. !!</font>");
//}else{
	rs=st.executeQuery("select max(substr(matid,2)) from material");
	int cnt=0;
	String matid="";
	try{
		if(rs.next()) {
			cnt=rs.getInt(1);
		}
	}catch(Exception ee){  }
	cnt++;
	if(cnt >0 & cnt <10)
		matid="M000"+cnt;
	else if(cnt >9 & cnt <100)
		matid="M00"+cnt;
	else if(cnt > 99 & cnt <1000)
		matid="M0"+cnt;
	else  
		matid="M"+cnt;
	qry="insert into material values('"+matid+"', '"+id+"', '"+subj+"', '"+type+"','"+cat+"','"+descrip+"',  'NO')";
	//out.print(qry);
	st.executeUpdate(qry);
	session.removeAttribute("matid");
	session.setAttribute("matid",matid);
	out.print("<font color=green size=3>Material's details have been entered !!</font>");
//
con.close();
}catch(Exception e){ out.print(e);  }  %> 
<br /><br />
<font color=green size=3>Choose the material to be uploaded.</font>
<FORM ENCTYPE="multipart/form-data" ACTION="upservlet4" METHOD=POST>

<table border="0" bgcolor=#ccFDDEE>
 
<tr><td colspan="2" align="center"> </td></tr>
<tr>
  <td><b>Choose the file</b></td>
  <td><INPUT NAME="file" TYPE="file" required></td>
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

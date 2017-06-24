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
	color: #0066FF;
	font-size: 14px;
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

<div class="rightside_head">Welcome <%= (String) session.getAttribute("name") %> to Subject <a href="asubview.jsp" class="style4"> View</a></div>  
<br>
<br>

<%
try{
String  z1=request.getParameter("t1");
ResultSet rs = st.executeQuery("select * from subject where sname='"+z1+"'");
if(rs.next()){
	out.print("<font color=red size=3>Subject already Available.</font>");   
}else{
	rs=st.executeQuery("select max(substr(subid,2)) from subject");
	int cnt=0;
	try{
	  if(rs.next()){
		 cnt=rs.getInt(1);
	  }
	}catch(Exception e){ }
	cnt++;
	String sid="";
	if(cnt>0 && cnt <10)
	   sid="S00"+cnt;
	else if(cnt>9 && cnt <100)
	   sid="S0"+cnt;
	else  
	   sid="S"+cnt;
	String qry="insert into subject values('"+sid+"','"+z1+"')";
	st.executeUpdate(qry); 
	out.print("<font color=green size=3>Subject Stored Successfully. !!</font>");
}
out.print("<br><br>");
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

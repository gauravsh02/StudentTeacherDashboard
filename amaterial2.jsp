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

<%
String z1="", z2="";
try{
String m1=request.getParameter("a1");
String s1="";
ResultSet rs= st.executeQuery("select * from subject where subid=(select subid from material  where  matid='"+m1+"')");
if(rs.next())
  s1=rs.getString(2);
out.print("<h2>Subject : " +s1+"</h2>");

 rs= st.executeQuery("select * from material  where  matid='"+m1+"'");
if(rs.next()){
	z1=rs.getString(6);
	z2=rs.getString(7);
}
con.close();
}catch(Exception e){  }
%>

<% 
	if(z1.endsWith(".mp3")){	%>
		<audio controls  > 
			<source src="./amaterial/<%=z2%>" type="audio/mp3" />
			Your browser does not support the <audio> element.
		</audio>
<%	}else if(z1.endsWith(".mp4")) {		%>
		<video width="600" height="350" controls>
			<source src="./amaterial/<%=z2%>" type="video/mp4">
			Your browser does not support video tag.
		</video> 
<% 	}else {		%>
	<a href="./material/<%=z2%>" >Click</a>
<%	}	%>



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

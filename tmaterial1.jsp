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

<%
String s1=request.getParameter("sub");
String ar[]=s1.split("-");
%>
<form action="tmaterial2.jsp" method=get>
<input type="hidden" name="subj" value="<%=ar[0]%>" />
<table border=0 width=900>

<tr><td>Subject</td> <td><%=ar[1]%></td></tr>
 <tr><td>Type</td> <td><select name="typ">
	<option value="Pdf" selected="selected" >Pdf</option>
	<option value="Doc" >Doc</option>
	<option value="Audio" >Audio</option>
	<option value="Video" >Video</option>
	</select></td></tr>
 <tr><td>Category</td> <td><select name="cat">
	<option value="Assignment" selected="selected" >Assignment</option>
	<option value="Notes" >Notes</option>
	<option value="Question" >Question</option> 
	</select></td></tr>
<tr><td>Decription of Material</td> <td><textarea name="descrip" rows="15" cols="80"  placeholder"within 500  character"></textarea></td></tr>
<tr><td></td> <td><input type="submit" value="Submit" /> <input type="reset" value="Reset" /></td></tr>
</table>
</form>

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

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
 <script language="javascript">
 function verify(){
 	var s1=document.f1.p1.value;
 	var s2=document.f1.p2.value;
	if(s1 ==""){
		alert("Password Cannot Be Empty");
		document.f1.p1.focus();
		return false;
	}else if(s2==""){
		alert("Confirm Password Cannot Be Empty");
		document.f1.p2.focus();
		return false;
	}else  if(s1!=s2){
		alert("Password & Confirm Password is not matching");
		document.f1.p1.focus();
		return false;
	}else  if(document.f1.p1.value.length <6){
		alert("Password is less than 6 character");
		document.f1.p1.focus();
		return false;
	}else 
		return true;
 }
 </script>
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

<div class="rightside_head">Welcome <%= (String) session.getAttribute("name") %>  to Change Password.</div>  <br>
<br>
<form name="f1" method="get" action="achngpwd1.jsp">
  <table width="336" border="1">
    <tr>
      <td>Choose User </td>
      <td>&nbsp;
        <select name="s1">
<%
try{
ResultSet rs= st.executeQuery("select * from login");
	while(rs.next()){  %>
		<option value="<%=rs.getString(1)%>"> <%=rs.getString(2)%></option>
<% 	}
con.close();
}catch(Exception e){ }
%>
        </select>
      </td>
    </tr>
    <tr>
      <td>Password</td>
      <td>&nbsp;<input name="p1" type="password" required></td>
    </tr>
    <tr>
      <td>Confirm Password</td>
      <td>&nbsp;<input name="p2" type="password" required></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;<input name="" type="submit" value="Submit" onClick="return verify()"> <input name="" type="reset" value="Reset"></td>
    </tr>
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

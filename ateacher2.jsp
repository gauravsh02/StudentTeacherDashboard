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
-->
  </style>
  <script language="javascript">
 function verify(){
 	var s1=document.f1.pas.value;
 	var s2=document.f1.pas1.value;
	if(s1 ==""){
		alert("Password Cannot Be Empty");
		document.f1.pas.focus();
		return false;
	}else if(s2==""){
		alert("Confirm Password Cannot Be Empty");
		document.f1.pas1.focus();
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
<div class="rightside_head">Welcome <%= (String) session.getAttribute("name") %> to Teacher <a href="ateacherview.jsp"> <span class="style4">View</span></a></div>  
<br>
<br> 
<h2>New Teacher Sign Up..</h2>
<form action="ateacher3.jsp" id="f1" method="get" name="f1">
<table width="897" height="334">
<tr>
  <td width="17%"><strong>Login Name</strong></td>
  <td width="42%"><input type="text" name="logna" value="<%=request.getParameter("a1")%>" readonly="true" /> <span class="style7">(available)</span> </td> 
  <td width="16%"><strong>Full Name</strong></td>
  <td width="25%"><input type="text" name="nam" placeholder="Full Name" required pattern="[A-Za-z\s]{3,}"/></td>
</tr>

<tr>
    <td><strong>Password</strong></td>
    <td><input type="password" name="pas" id="pas" placeholder="Password" required /></td>
    <td><strong>Confirm Password</strong></td>
   <td><input type="password" name="pas1" id="pas1" placeholder="Confirm Password" required /></td>
</tr>

<tr>
      <tr><td><strong>DOB</strong></td> 
       <td><input type="date" name="dob" required /></td>
       <td><strong>Phone</strong></td> 
       <td><input type="text" name="phno" placeholder="Phone No." pattern="(?=.*\d).{10,10}"/></td>
</tr>

<tr>
       <td><strong>Gender</strong></td> 
       <td><input type="radio" name="gender" value="Male" />Male <input type="radio" name="gender" value="Female" />Female</td>
       <td><strong>Marital Status</strong></td> 
      <td><input type="radio" name="mstatus" value="Married">Married <input type="radio" name="mstatus" value="Single">Single </td>
</tr>

<tr>
  <td><strong>Qualification</strong></td>
  <td><input type="text" name="qual" required/></td>
  <td align="left" valign="top"><strong>Designation</strong></td>
  <td><input type="text" name="desig" required/></td>
</tr>

<tr>
  <td><strong>Organizaion Address</strong></td>
  <td><input type="text" name="orga" required/></td>
  <td align="left" valign="top"><strong>Display Name</strong></td>
  <td><input type="text" name="dispname" required placeholder="Display Name" pattern="[A-Za-z\s]{3,}"/></td>
</tr>

<tr>
       <td><strong>Security Question</strong></td> 
       <td><select name="secques">
               <option>What is your pet name</option> 
               <option>Who is your favourite singer ?</option>  
               <option>What is your favourite movie ?</option>  
               <option>Who is your best friend ?</option> 
               <option>Where is your home town ?</option> 
               <option>Where is your mothers maiden name ?</option>  
               <option>What is make of your 1st bike ?</option>  
               <option>What is your 1st school name ?</option>
       </select></td>
       <td><strong>Security Answer</strong></td> 
       <td><input type="text" name="secans" required/></td>
</tr>



<tr>
       <td><strong>Present Address</strong></td> 
       <td><textarea name="cadd" rows="6" cols="30" required ></textarea></td>
       <td align="left" valign="top">&nbsp;</td>
       <td>&nbsp;<input name="submit" type="submit" class="button" onClick="return verify()" value="Submit" />
    <input name="reset" type="reset" class="button" value="Reset" /></td>
</tr>
</table>
</form>  



</div>
</div>
<!--close site_content-->

<br><br><br>

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

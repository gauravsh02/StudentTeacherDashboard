<!DOCTYPE html> 
<html>

<head>
  <title>S T Dashboard</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
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
	  <nav>
	    <div id="menubar">
          <ul id="nav">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="noice.jsp">Notices</a></li>
            <li ><a href="login.jsp">Login</a></li>
			<li class="current"><a href="register.jsp">Signup</a></li>
            <li><a href="contact.jsp"> Contact Us</a></li>
          </ul>
        </div><!--close menubar-->	
      </nav>
    </header>
  <div id="site_content">
      <div id="content">
        <div class="content_item">
          <center>
            <h2>New User Sign Up..</h2>

<form action="register3.jsp" id="f1" method="get" name="f1">
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
       <td><strong>Gender</strong></td> 
       <td><input type="radio" name="gender" value="Male" />Male <input type="radio" name="gender" value="Female" />Female</td>
       <td><strong>Marital Status</strong></td> 
      <td><input type="radio" name="mstatus" value="Married">Married <input type="radio" name="mstatus" value="Single">Single </td>
</tr>

<tr>
      <tr><td><strong>Regdno</strong></td> 
       <td><input type="text" name="regd" placeholder="Reg. No."required pattern="(?=.*\d).{1,}"/></td>
       <td><strong>Branch</strong></td> 
       <td><input type="text" name="brnh" placeholder="Barnch" required pattern="[A-Za-z\s]{3,}"/></td>
</tr>


<tr>
      <tr><td><strong>DOB</strong></td> 
       <td><input type="date" name="dob" placeholder="DOB" required /></td>
       <td><strong>Phone</strong></td> 
       <td><input type="text" name="phno" placeholder="Phone No." pattern="(?=.*\d).{10,10}"/></td>
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
       <td><input type="text" name="secans" placeholder="Security Answer" required /></td>
</tr>


<tr>
  <td><strong>College</strong></td>
  <td><input type="text" name="clg" placeholder="College Name" pattern="[A-Za-z\s]{3,}"/></td>
  <td align="left" valign="top"><strong>Display Name</strong></td>
  <td><input type="text" name="dispname" placeholder="Display Name" required pattern="[A-Za-z\s]{3,}"/></td>
</tr>
<tr>
       <td><strong>Present Address</strong></td> 
       <td><textarea name="cadd" rows="6" cols="30" required></textarea></td>
       <td align="left" valign="top">&nbsp;</td>
       <td>&nbsp;<input name="submit" type="submit" class="button" onClick="return verify()" value="Submit" />
    <input name="reset" type="reset" class="button" value="Reset" /></td>
</tr>
</table>
</form>  


          </center>
        </div>
        <!--close content_item-->
      </div>
      <!--close content-->
    </div>
  <!--close site_content-->
  </div>
  <br>
 <br>
  <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br> 
    <footer>
	  <jsp:include page="footer.jsp" />
    </footer>
  <!--</div> close main-->

</body>
</html>

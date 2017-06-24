<%@ include file="dbcon.jsp" %>
<!DOCTYPE html> 
<html>

<head>
  <title>S T Dashboard</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
 
</head>

<body>
 <script language="javascript">
 function verify(){
 	var s1=document.f1.t1.value;
 	var s2=document.f1.t2.value;
	if(s1 ==""){
		alert("Password Cannot Be Empty");
		document.f1.t1.focus();
		return false;
	}else if(s2==""){
		alert("Confirm Password Cannot Be Empty");
		document.f1.t2.focus();
		return false;
	}else  if(s1!=s2){
		alert("Password & Confirm Password is not matching");
		document.f1.t1.focus();
		return false;
	}else  if(document.f1.t1.value.length <6){
		alert("Password is less than 6 character");
		document.f1.t1.focus();
		return false;
	}else 
		return true;
 }
 </script>
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
            <li><a href="calendar.jsp">Calendar</a></li>
            <li class="current"><a href="login.jsp">Login</a></li>
			<li><a href="register.jsp">Signup</a></li>
            <li><a href="contact.jsp"> Contact Us</a></li>
          </ul>
        </div><!--close menubar-->	
      </nav>
    </header>
  <div id="site_content">
      <div id="content">
        <div class="content_item">
          <center>
            <h2>Registered User Password Recovery</h2>

<%! String s2="", sans="";  %>
<%
try{
s2=request.getParameter("h1");
sans=request.getParameter("t1");
ResultSet rs=st.executeQuery("select * from login where logname='"+s2+"' and secans='"+sans+"'");
if(rs.next()){
%>
            <form name="f1" action="forgetpwd3.jsp" >
			 <input type="hidden" name="h1" value="<%=s2%>" >
              <table>
                <tr>
                  <td> Enter New Password </td>
                  <td width="20"> </td>
                  <td><input type="password" name="t1" /></td>
                </tr>
                <tr>
                  <td>Enter Confirm New Password </td>
                  <td width="20"> </td>
                  <td><input type="password" name="t2"/></td>
                </tr>
                <tr>
                  <td></td>
                  <td width="20"> </td>
                  <td><input name="submit" type="submit" value="submit" onClick="return verify()"/>
                      <input name="reset"  type="reset" value="reset" />
                  </td>
                </tr>
				
              </table>  </form>
              <%
}else{
	s2="error";
	out.print("ERROR");
}
con.close();
}catch(Exception e){  }
 %>
         
            <br>
		 
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
    <footer>
	  <jsp:include page="footer.jsp" />
    </footer>
  <!--</div> close main-->

</body>
</html>

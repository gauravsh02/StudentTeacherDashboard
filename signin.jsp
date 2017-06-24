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
           <!-- <li><a href="calendar.jsp">Calendar</a></li> -->
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
            <h2>Registered User Sign In..</h2>
            <form action="login.jsp" >
              <table>
                <tr>
                  <td> Name </td>
                  <td width="20"> </td>
                  <td><input type="email" name="t1" placeholder="email id" /></td>
                </tr>
                <tr>
                  <td>Password </td>
                  <td width="20"> </td>
                  <td><input type="password" name="t2" placeholder="Password" /></td>
                </tr>
                <tr>
                  <td></td>
                  <td width="20"> </td>
                  <td><input name="submit" type="submit" value="submit" />
                      <input name="reset"  type="reset" value="reset" />
                  </td>
                </tr>
				
              </table>
              <%
try{
  String z= request.getParameter("a1");
  if(z.equalsIgnoreCase("error")){
      out.print("");
  }
  else{
	  out.print("Incorrect User");
  }
}catch(Exception e){  }
%>
            </form> <br>
		<a href="forgetpwd.jsp">Forgot Password ? </a>
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

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
            <h2>Registered User Password Recovery (Or contact Admin)</h2>
            <form action="forgetpwd1.jsp" >
              <table>
                <tr>
                  <td> Enter Login Name </td>
                  <td width="20"> </td>
                  <td><input type="text" name="t1" placeholder="Enter Mail Id"/></td>
                </tr>
                <tr>
                  <td></td>
                  <td width="20"> </td>
                  <td><input name="submit" type="submit" value="submit" />
                      <input name="reset"  type="reset" value="reset" />
                  </td>
                </tr>
				<tr>
					
				</tr>
				
              </table>
              <%
try{
  String z= request.getParameter("a1");
  if(z.equalsIgnoreCase("error")){
      out.print("<font color=red>Login Name/Email ID Does Not Exist</font>");
  }
}catch(Exception e){  }
%>
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
    <footer>
	  <jsp:include page="footer.jsp" />
    </footer>
  <!--</div> close main-->

</body>
</html>

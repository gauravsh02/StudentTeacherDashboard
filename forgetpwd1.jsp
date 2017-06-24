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

<%! String ss1="";  %>
<%
try{
ss1=request.getParameter("t1");   
ResultSet rs=st.executeQuery("select * from login where logname='"+ss1+"'");
if(rs.next()){
%>
            <form action="forgetpwd2.jsp" >
			 <input type="hidden" name="h1" value="<%=ss1%>" >
              <table>
                <tr>
                  <td> Security Question </td>
                  <td width="20"> </td>
                  <td><%= rs.getString(6) %></td>
                </tr>
                <tr>
                  <td>Enter Security Answer </td>
                  <td width="20"> </td>
                  <td><input type="text" name="t1" /></td>
                </tr>
                <tr>
                  <td></td>
                  <td width="20"> </td>
                  <td><input name="submit" type="submit" value="submit" />
                      <input name="reset"  type="reset" value="reset" />
                  </td>
                </tr>
				
              </table>
			   </form>
              <% 
  }else {
    ss1="error";
  }
  con.close();
}catch(Exception e){  }
if(ss1.equals("error")) {
%>
  <jsp:forward page="forgetpwd.jsp" >
   <jsp:param name="a1" value="<%=ss1%>" />
   </jsp:forward>
<% } %>
              

              <%
try{
  String z= request.getParameter("b1");
  if(z.equalsIgnoreCase("error")){
      out.print("<font color=red>Security Answer Does Not Match</font>");
  }
}catch(Exception e){  }
%>
 
   
   
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
    <footer>
	  <jsp:include page="footer.jsp" />
    </footer>
  <!--</div> close main-->

</body>
</html>

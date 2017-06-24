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
            <h2>New User Sign Up..</h2>
 <%
try{  

String logna = request.getParameter("logna");
ResultSet rs=st.executeQuery("select * from login where logname='"+logna+"' ");
if(rs.next()){
	out.println("<font color=red size=+1>"+logna+" is Already Registred.</font>");
}else{
	String pas = request.getParameter("pas");
	String name = request.getParameter("nam");
	String regd = request.getParameter("regd");
	String brnh = request.getParameter("brnh");
	String phno = request.getParameter("phno"); 
	String dob = request.getParameter("dob");
	String gender = request.getParameter("gender");
	String mstatus = request.getParameter("mstatus"); 
	String secques = request.getParameter("secques");
	String secans = request.getParameter("secans");
	String cadd = request.getParameter("cadd"); 
	String clg = request.getParameter("clg");
	String dispname = request.getParameter("dispname"); 

	String mid="";
	int cnt=0;
    rs=st.executeQuery("select max(substr(sid,2)) from student");
	try{
	    if(rs.next())
		 {
		   cnt=rs.getInt(1);
		  }
       }catch(Exception ee){  }
	 cnt++;
	 if(cnt>0 && cnt<10)
         mid="S0000"+cnt;
	else if(cnt>9 && cnt<100)
	      mid="S000"+cnt;
	else if(cnt>99 && cnt<1000)
	      mid="S00"+cnt;
	else if(cnt>999 && cnt<10000)
	      mid="S0"+cnt;
	else
	      mid="S"+cnt;
	
	String dt=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());		  
	String qry="insert into student values('"+mid+"', '"+name+"', '"+regd+"', '"+brnh+"', '"+phno+"', '"+logna+"' ,'"+dob+"', '"+gender+"', '"+mstatus+"', '"+dt+"', '"+cadd+"', '"+clg+"')";
	//out.print("<br>"+qry+"<br>");
	st.executeUpdate(qry);

 
	qry="insert into login values('"+mid+"', '"+logna+"', '"+pas+"', 'Student', 'Y', '"+secques+"', '"+secans+"','2015-10-25 12:06:54','"+dispname+"')";
	
	//out.print("<br>"+qry+"<br>");
	st.executeUpdate(qry);
	out.println("<font color=green size=+1>"+logna+" is Successfully Registred.</font>");
}
con.close();
}catch(Exception e){ } 
%>     

<br />
<a href="index.jsp" class="style7">Please Login</a>


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

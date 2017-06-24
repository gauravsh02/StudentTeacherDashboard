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
.style4 {color: #0066FF}
-->
  </style>
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

<div class="rightside_head">Welcome <%= (String) session.getAttribute("name") %> to Teacher <a href="ateacherview.jsp"> <span class="style4">View</span></a></div>  
<br>
<br> 
<h2>New Teacher Sign Up..</h2>

<%
try{  
String logna = request.getParameter("logna");
ResultSet rs=st.executeQuery("select * from login where logname='"+logna+"' ");
if(rs.next()){
	out.println("<font color=red size=+1>"+logna+" is Already Registred.</font>");
}else{
	String pas = request.getParameter("pas");
	String name = request.getParameter("nam");
	String phno = request.getParameter("phno"); 
	String dob = request.getParameter("dob");
	String gender = request.getParameter("gender");
	String mstatus = request.getParameter("mstatus"); 
	String secques = request.getParameter("secques");
	String secans = request.getParameter("secans");
	String cadd = request.getParameter("cadd"); 
	String desig = request.getParameter("desig");
	String orga = request.getParameter("orga"); 
	String qual = request.getParameter("qual");
	String dispname = request.getParameter("dispname"); 

	String mid="";
	int cnt=0;
    rs=st.executeQuery("select max(substr(tid,2)) from teacher");
	try{
	    if(rs.next())
		 {
		   cnt=rs.getInt(1);
		  }
       }catch(Exception ee){  }
	 cnt++;
	 if(cnt>0 && cnt<10)
         mid="T0000"+cnt;
	else if(cnt>9 && cnt<100)
	      mid="T000"+cnt;
	else if(cnt>99 && cnt<1000)
	      mid="T00"+cnt;
	else if(cnt>999 && cnt<10000)
	      mid="T0"+cnt;
	else
	      mid="T"+cnt;
		  
	String dt=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());		  
	String qry="insert into teacher values('"+mid+"', '"+name+"', '"+dob+"', '"+gender+"', '"+mstatus+"', '"+phno+"', '"+logna+"', '"+qual+"', '"+desig+"', '"+orga+"',  '"+cadd+"', '"+dt+"')";
	//out.print("<br>"+qry+"<br>");
	st.executeUpdate(qry);
 
	qry="insert into login values('"+mid+"', '"+logna+"', '"+pas+"', 'Teacher', 'Y', '"+secques+"', '"+secans+"','2015-10-25 12:06:54','"+dispname+"')";
	
	//out.print("<br>"+qry+"<br>");
	st.executeUpdate(qry);
	out.println("<font color=green size=+1>"+logna+" is Successfully Registred.</font>");
}
con.close();
}catch(Exception e){ out.print(e); } 
%>     

</div>
</div>
<!--close site_content-->

<br><br><br><br><br><br><br><br><br><br><br><br>

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

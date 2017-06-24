<%@ include file="dbcon.jsp"  %>
<%@ page import="com.devdaily.calendar.Month,java.util.*,util.*,java.io.*,java.sql.*,com.devdaily.*" errorPage="error.jsp" %>
<%@ include file="calendarCommon.jsp" %>
<!DOCTYPE html> 
<html>

<head>
  <title>S T Dashboard</title>
  <link rel="stylesheet" type="text/css" href="css/style1.css" />
  
  <link rel="StyleSheet" href="/blog/calendar.css" type="text/css" media="screen" />
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
	<jsp:include page="studmenu.jsp" /></div>

<div class="rightside">

<div class="rightside_head">Welcome <%= (String) session.getAttribute("name") %> to Calendar View.</div>  <br>
<br>


<div id="calendar_main_div">
<%
try{
  ResultSet rs=null;
  String data="";
%>
<table width="626" height="300" border="1" cellpadding="4" cellspacing="0" id="calendar_table">
  <tr>
    <td width="100%" colspan="7" class="month_year_header"><%=monthName%>, <%=intYear%> </td>
  </tr>
  <tr class="week_header_row">
    <th width="14%" class="th_day_cell day">Sun</th>
    <th width="14%" class="th_day_cell day">Mon</th>
    <th width="14%" class="th_day_cell day">Tue</th>
    <th width="14%" class="th_day_cell day">Wed</th>
    <th width="14%" class="th_day_cell day">Thu</th>
    <th width="15%" class="th_day_cell day">Fri</th>
    <th width="15%" class="th_day_cell day">Sat</th>
  </tr>
  <%
{ 
  Month aMonth = Month.getMonth( Integer.parseInt(currentMonthString), Integer.parseInt(currentYearString) );
  int [][] days = aMonth.getDays(); //days[][] returns date
  //out.print("<br>MONTH : "+ Integer.parseInt(currentMonthString)+"<br>");  //month 0-jan
  //out.print("<br>Year : "+ Integer.parseInt(currentYearString)+"<br>");  //month 0-jan
  
/*  for(int m=0; m<days.length ; m++){
     for(int n=0; n<days[m].length ; n++){  
    	 out.print(days[m][n]+",  "); // gives u date
	 }
      out.print("<br>");
  }
  out.print("<br>");   */
  
  for( int i=0; i<aMonth.getNumberOfWeeks(); i++ )
  {
    %>
  <tr class="week_data_row">
    <%
    for( int j=0; j<7; j++ )
    {
      if( days[i][j] == 0 )
      {
        %>
    <td class="empty_day_cell">&nbsp;</td>
    <%
      }
      else
      {
        // this is "today"
		rs=st.executeQuery("select * from calevent where yr="+aMonth.getYear()+" and mon="+aMonth.getMonth()+" and dt="+days[i][j]);
		//out.print("<br>"+"select * from calevent where yr="+aMonth.getYear()+" and mon="+aMonth.getMonth()+" and dt="+days[i][j]+"<br>");
		if(rs.next()){
			data="&nbsp;:&nbsp;"+rs.getString(5);
		}else {
			data="";
		}
		rs.close(); 
        if( currentDayInt == days[i][j] && currentMonthInt == aMonth.getMonth() && currentYearInt == aMonth.getYear() )
        { 
          %>
    <td class="today_cell"><%=days[i][j] +data %> </td>
    <%   //today
        }
        else
        {			
          %>
    <td class="day_cell"><%=days[i][j] +data%></td>
    <%
        }
      } // end outer if
    } // end for
    %>
  </tr>
  <%}
}
%>
</table>
<%
 con.close();
}catch(Exception ee){ out.print(ee); }
%>
<%-- end of "calendar_div" --%>
</div>

<table id="calendar_nav_table" border="0">
  <tr>
    <td id="prev_link">
      <form method="post">
        <input type="submit" name="PREV" value=" << ">
        <input type="hidden" name="month" value="<%=prevMonth%>">
        <input type="hidden" name="year" value="<%=prevYear%>">
      </form>
    </td>

    <td id="next_link">
      <form method="post">
        <input type="submit" name="NEXT" value=" >> ">
        <input type="hidden" name="month" value="<%=nextMonth%>">
        <input type="hidden" name="year" value="<%=nextYear%>">
      </form>
    </td>
  </tr>
</table>


</div>
</div>
<!--close site_content-->

<br><br><br><br>

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

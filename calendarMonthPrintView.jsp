<%@ page import="com.devdaily.calendar.Month,java.util.*,util.*,java.io.*,java.sql.*,com.devdaily.*" errorPage="error.jsp" %>

<%
  // TODO: WHAT IS THE DIFFERENCE BETWEEN SPAN AND DIV?
  // TODO: CAN I SHARE MY COMMON CODE SOMEWHERE ELSE?
  // TODO: CAN I REPLACE THE 'MONTH' CLASS WITH SOMETHING ELSE?
%>

<%@ include file="calendarCommon.jsp" %>

<html>
<head>
  <title>devdaily.com calendar :: month view</title>
  <link rel="StyleSheet" href="/blog/calendar.css" type="text/css" media="screen" />
</head>

<body id="print_view_page">

<div id="calendar_print_view_main_div">
<table border="1" cellspacing="0" cellpadding=4 width="100%" height="100%" id="calendar_table">
  <tr>
    <td colspan="7" class="month_year_header">
      <%=monthName%>, <%=intYear%>
    </td>
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
  int [][] days = aMonth.getDays();
  for( int i=0; i<aMonth.getNumberOfWeeks(); i++ )
  {%>
    <tr>
    <%
    for( int j=0; j<7; j++ )
    {
      if( days[i][j] == 0 )
      {%>
        <td class="empty_day_cell">&nbsp;</td>
      <%}
      else
      {
      %>
        <td align="right" valign="top" class="day_cell"><%=days[i][j]%></td>
      <%
      }
    } // end for %>
    </tr>
  <%}
}
%>
</table>
</div>

</body>
</html>



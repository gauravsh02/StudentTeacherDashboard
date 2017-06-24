<%@ include file="dbcon.jsp" %>
<%@page import="java.sql.*"%>
<html>
<head>
  <title>S T Dashboard</title>
  <link rel="stylesheet" type="text/css" href="css/style1.css" />
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
		
          <h2>Add Query Here:</h2> 			
		      <form name="forum" method="post" action="addquery.jsp" >
		        <table width="401" border="1" cellpadding="0" cellspacing="0" bordercolor="#3399CC" rules="none">
				<tr>
					<td>Query</td>
					<td><textarea name="qu" rows="6" cols="30"></textarea></td>
				</tr>
				<tr>
				<td><input name="submit" type="submit" class="button" value="Submit" /></td>
				</tr>
                </table>
		        
		      </form> 
                <p>&nbsp;</p>
		        <p>&nbsp;</p>
		        <p>&nbsp;</p>
		        <p>&nbsp;</p>
		        <p>&nbsp;</p>
		        <p>&nbsp;</p>
		        <p>&nbsp;</p>  
               
                <table width="668" border="1" cellpadding="0" cellspacing="0" bordercolor="#0099FF" rules="none">
              <tr>
                <td>Sl No</td>
                <td>Query</td>
                <td>Answer</td>
              </tr>
              <%
			
					ResultSet rs= st.executeQuery("select * from fquery ");
			%>
			<%    while(rs.next()) {   %>
			
              <tr>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
              </tr>
             
			<% }
			%>
			
            </table>

</body>
</html>
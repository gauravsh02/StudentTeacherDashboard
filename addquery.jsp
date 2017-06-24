<%@ include file="dbcon.jsp" %>
<%@page import="java.sql.*"%>

<%

String q = request.getParameter("qu");
ResultSet rs=st.executeQuery("select MAX(slno) from fquery ");
int i = 0;
if(rs.next())
  i=rs.getInt(1);
i++;
String s =(String) session.getAttribute("name");
String qry="insert into fquery values('"+i+"', '"+s+"', '', '"+q+"', 'N')";
st.executeUpdate(qry);

out.println("<font color=green size=+1>Query added is Successfully.</font>");

%>
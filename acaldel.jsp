<%@ include file="dbcon.jsp"  %>
<%
try{ 
 String ids= request.getParameter("a1"); 
 st.executeUpdate("delete from calevent where ceid="+ids);
 con.close();
}catch(Exception e){ }
%>
<jsp:forward page="acalview.jsp" />
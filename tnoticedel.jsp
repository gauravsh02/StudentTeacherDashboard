<%@ include file="dbcon.jsp" %>
<%
try{
String s1=request.getParameter("a1");
st.executeUpdate("delete from notice where nid='"+s1+"'"); 
con.close();
}catch(Exception e){ out.print(e); }
%>
 
<jsp:forward page="tnoticeview.jsp" />
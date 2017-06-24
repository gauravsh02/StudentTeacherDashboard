<%@ include file="dbcon.jsp" %>
<%
try{
String s1=request.getParameter("a1");
st.executeUpdate("delete from student where sid='"+s1+"'");
st.executeUpdate("delete from login where uid='"+s1+"'");
con.close();
}catch(Exception e){   out.print(e);   }   
%>
<jsp:forward page="astudview.jsp" />
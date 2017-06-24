<%@ include file="dbcon.jsp"%>
<%
try{
    String s1=request.getParameter("t1");
    ResultSet rs=st.executeQuery("select * from login where logname='"+s1+"' ");
	if(rs.next()){
%>
    <jsp:forward page="ateacher.jsp">
	<jsp:param name="a1" value="error"/>
	</jsp:forward>
<% }else{	%>
    <jsp:forward page="ateacher2.jsp">
	<jsp:param name="a1" value="<%=s1 %>" />
	</jsp:forward>
<% }
	con.close();
 }catch(Exception ee) {		out.print(ee);    }   
%>`
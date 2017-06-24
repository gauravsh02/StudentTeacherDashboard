<%@ include file="dbcon.jsp" %>
<html>
<head>
<script language="javascript"> 
   window.history.forward(-1);
</script>

</head>
<body>
<%!
String s1="",s2="",s3="",type="", uid="";
%>
<%
try{
type="";
s1=request.getParameter("t1");
s2=request.getParameter("t2"); 
String qry="select * from login where logname='"+s1+"'  and pwd='"+s2+"' and  status='Y'";
System.out.println("login.jsp "+qry);
ResultSet rs=st.executeQuery(qry);
if(rs.next()){
  type=rs.getString("type");
  uid=rs.getString("uid");
  session.removeAttribute("name");
  session.removeAttribute("type");
  session.removeAttribute("uid");
  

  session.setAttribute("name", rs.getString("dispname"));
  session.setAttribute("type", type);
  session.setAttribute("uid", uid);
}
System.out.println("---------------------       "+type+"<br>");
if(!type.equals("")){
 String dt=new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new java.util.Date());
 st.executeUpdate("update login set lstlog='"+dt+"' where uid='"+uid+"'");
}
con.close();
}catch(Exception e){    System.out.println(e);     }

if(type.equalsIgnoreCase("admin")){
%>  
      <jsp:forward page="adminhome.jsp"  />
<%    
}else if(type.equalsIgnoreCase("teacher")){
%>  
      <jsp:forward page="teachhome.jsp"  />
<%    
}else if(type.equalsIgnoreCase("student")){
%>  
      <jsp:forward page="studhome.jsp"  />
<%    
}else {  
%>
      <jsp:include page="signin.jsp"  >
	  <jsp:param name="a1" value="error" />
	  </jsp:include>  
<%  }    %>
</body></html>
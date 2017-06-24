<%@ include file="dbcon.jsp" %>
<html>
<head>S T DASHBOARD</head>
<body>
<%
session.invalidate();
%>
<jsp:forward page="index.jsp" />
</body>
</html>
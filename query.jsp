<%@page import="data.DateTime"%>
<%@page import="java.sql.*"%>
<%@page import="data.DBConnection"%>
<%@page import="java.sql.Connection"%>
?<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Online Expert</title>
<meta name="keywords" content="company template, free website templates, green color bar, CSS, HTML" />
<meta name="description" content="Company Template (Green) is a free website template provided by templatemo.com" />
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/s3slider.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/s3Slider.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#slider').s3Slider({
            timeOut: 3000
        });
    });
</script>
<style type="text/css">
<!--
.style1 {
	color: #0000FF;
	font-weight: bold;
}
.style2 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
<script language="javascript" type="text/javascript">
function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}

function check(ob)
{
	question=document.frm.question.value;
	if(question=="")
	{
		alert("Plz add a Question!");
		document.frm.question.focus();
		return false;	
	}

}

</script>
<style type="text/css">
<!--
.style3 {font-size: 18px}
-->
</style>
</head>
<body>

<div id="templatemo_site_title_bar_wrapper">
    <div id="templatemo_site_title_bar">
        <div id="site_title">
            <h1>
            <a href="">Online Expert
            <span>We Provide Solution</span></a>
            </h1>
        </div>
    </div> <!-- end of site title bar -->
</div> <!-- end of site title bar wrapper -->


<div id="templatemo_menu_wrapper">
	<jsp:include page="admintop.jsp" />
</div> <!-- end of menu wrapper -->

<div id="templatemo_content">
 <div id="main_column">
	<div class="section_w560">
 <h4>
  <%
//String status=request.getParameter("status");
//out.println(data.Utility.showStatusMessage(status));
%>          
</h4>


<a href="show_query.jsp">Show Queries</a>	            
     
<%
    String type=(String)session.getAttribute("type");
    if("Expert".equals(type))
    {
        %>
        
        <%
    }
    int x=0;
    String uid="";
	String user=null;
	uid=(String)session.getAttribute("uid");
	String add=request.getParameter("add");
        Connection con=DBConnection.getConnection();
	if("yes".equals(add))
	{
	   	String query=request.getParameter("question");
		String name="";
	
		
		//PreparedStatement pstmt=con.prepareStatement("select fname,lname,userid,email from registration where userid='"+uid+"'");
		//ResultSet rs=pstmt.executeQuery();
		
                /*if(rs.next())
                {
                        name=rs.getString("fname")+" "+rs.getString("lname");
                        String email=rs.getString("email");
                        user=rs.getString("userid");
                }
               */

	PreparedStatement pstmt=con.prepareStatement("insert into user_query(userid,query,answer,entrydate,status) values(?,?,?,?, ?)");
	pstmt.setString(1,user);
	pstmt.setString(2,query);
	pstmt.setString(3,"");
	pstmt.setString(4,DateTime.sysDate());
	pstmt.setString(5,"New");
	
	 x=pstmt.executeUpdate();
	
	//con.close();
	
	}

%>

          <h2>Add Query Here:</h2> 			
		      <form id="form1" name="frm" method="post" action="query.jsp?add=yes" onsubmit="return check(this)">
		        <table width="401" border="1" cellpadding="0" cellspacing="0" bordercolor="#3399CC" rules="none">
				<%
					if(x==1)
					{
				%>
                  <tr>
                    <td colspan="2"><div align="center" class="style2">Query Is Added Successfully...</div></td>
                  </tr>
				  <%
				  }
				  %>
                  <tr>
                    <td width="147"><div align="left" class="style1">Question:</div></td>
                    <td width="248"><textarea name="question" id="question" rows="5" cols="100"></textarea></td>
                  </tr>
                  <tr>
                    <td>
                      <div align="left"><a href="edituserquery.jsp"></a></div></td>
                    <td><input name="Submit" type="submit" class="button" value="ADD" /></td>
                  </tr>
                </table>
		        <p>&nbsp;</p>
		        <p>&nbsp;</p>
		        <p>&nbsp;</p>
		        <p>&nbsp;</p>
		        <p>&nbsp;</p>
		        <p>&nbsp;</p>
		        <p>&nbsp;</p>
		      </form> 
                  
               <hr/>
               
                <table width="668" border="1" cellpadding="0" cellspacing="0" bordercolor="#0099FF" rules="none">
              <tr>
                <td width="56" height="19" bgcolor="#3399CC"><div align="center" class="style1">Sl No </div></td>
                <td width="69" bgcolor="#3399CC"><div align="center" class="style1">Query</div></td>
                <td width="100" bgcolor="#3399CC"><div align="center" class="style1">Answer</div></td>
                <td width="94" bgcolor="#3399CC"><div align="center" class="style1">Entry Date </div></td>
                <td width="98" bgcolor="#3399CC"><div align="center" class="style1">Answer Date </div></td>
              </tr>
              <% 
                                      //con=DBConnection.getConnection();
		String sid=(String)session.getAttribute("uid");	
			int count=0;
			
			//PreparedStatement pstmt=con.prepareStatement("select * from user_query where userid='"+sid+"'");
			PreparedStatement pstmt1=con.prepareStatement("select * from user_query");
            ResultSet rs=pstmt1.executeQuery(); 
			while(rs.next())
			{
			  
				  int slnoint=rs.getInt(1); 
				  uid=rs.getString(2);
				  String answer_by=rs.getString(3);
				  String query=rs.getString(4);
				  String answer=rs.getString(5);
				  String entrydate=rs.getString(6);
				  String ansdate=rs.getString(7);
				  String status=rs.getString(8);
				  if(answer==null)
				  answer="New";
	   %>
              <tr>
                <td><%= ++count%></td>
                <td><%= query%></td>
                <td><%= answer%></td>
                <td><%= entrydate%></td>
                <td><%= ansdate%></td>
                <td><a href="answer_query.jsp?slno=<%=slnoint %>" > Answer </a></td>
              </tr>
              <%
			}
			//pstmt1.close();
			//con.close();
		
		%>
            </table>
                  
                  
	</div>
    <div class="cleaner_h50"></div>
 </div> <!-- end of main column -->
            
<div id="side_column">
<div class="side_column_box">
<h2>Admin Panel</h2>
<div class="news_section">
		<jsp:include page="adminleft.jsp" />
</div>
<div class="news_section">
</div>
</div>
    
                
                

            </div> <!-- end of side column -->

	<div class="cleaner"></div>
    
</div> <!-- end of content -->

<div id="templatemo_footer_wrapper">
	<jsp:include page="footer.jsp" />
</div> <!-- end of footer wrapper -->
</body>
</html>
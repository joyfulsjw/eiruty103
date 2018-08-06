<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@page import="java.sql.*"%>




<html>
<head>
</head>
<body>

this is test

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
out.println(id+" "+pw);

String DBGsql = "select * from test where id='"+id+"' and pw='"+pw+"'";
out.println(DBGsql+"<p>");
%>

<%
 Connection con = null;
 Statement stmt = null;  
 ResultSet rs = null;
 
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@//10.250.230.209:1521/orcl","hr","hr");
stmt = con.createStatement();
out.print("DEBUG : db connect ok!");

String sql = "select * from test where id='"+id+"' and pw='"+pw+"'";
rs = stmt.executeQuery(sql);

out.print("<p>");


if(rs.next())
{
	out.println(id+" "+pw+" login ok!");
	session.setAttribute("id",id);
	response.sendRedirect("../main.jsp");
}

}catch(Exception e)
{
out.println(e);
}

%>


</body>
</html>





























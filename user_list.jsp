<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@page import="java.sql.*"%>

<% 
out.print("is a tag works?");
%>


<html>
<head>
</head>
<body>

<table>
<%
 Connection con = null;
 Statement stmt = null;  
 ResultSet rs = null;
 
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@//192.168.65.131:1521/orcl","hr","hr");
stmt = con.createStatement();
out.print("DEBUG : db connect ok!");

String sql = "select * from test";
rs = stmt.executeQuery(sql);
}catch(Exception e)
{
out.println(e);
}
			
while(rs.next())
{
	String s1 = rs.getString("pk");
	String s2 = rs.getString("id");
	String s3 = rs.getString("pw");
	out.print("<tr>");
	out.print("<td>");
	out.print(s1+" "+s2+" "+s3);
	out.print("</td>");
	out.print("</tr>");
}
%>
</table>
</body>
</html>


















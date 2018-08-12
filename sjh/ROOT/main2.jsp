<%@ page language="java" pageEncoding="UTF-8" %>

<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.sql.*"%>
<%@page import="org.apache.tomcat.dbcp.dbcp.*"%>


<%
out.print("DEBUG : is this really work?");
String test = "test";
out.print(test);
String pathstr = request.getContextPath();
out.print(pathstr);
%>



<%


try{
	 Statement stmt = null;  
 ResultSet rs = null;
	
	Context initContext = new InitialContext();
Context envContext  = (Context)initContext.lookup("java:/comp/env");
DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
Connection conn = ds.getConnection();
out.print("conn ok!");
stmt = conn.createStatement();
String sql = "select * from test";
rs = stmt.executeQuery(sql);
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

}catch(Exception e)
{
	out.print("error!");
	e.printStackTrace();
}

%>










<html>
<head>
</head>
<body>
<p>

<table border="1" style="height:100%; width:100%">

<tr style="height:33%">
<td colspan="3">
</td>
</tr>

<tr>
<td rowspan="2" style="width:33%">
</td>
<td colspan="2" rowspan="2">
and this is ftp test
<p>
<p>
<a href="user_list.jsp">유저 목록 확인</a>

<p>
<p>
<%

%>


그리고 이건 sjh 이전 테스트
</td>
</tr>

</table>


</body>
</html>

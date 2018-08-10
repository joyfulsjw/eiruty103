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
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
out.print("start");

Context ct = new InitialContext(); 
out.print("contexting");

DataSource ds = (DataSource)ct.lookup("java:comp/env/jdbc/myoracle");
out.print("datasourcing<p>");
out.print(ds);

Connection conn2 = ds.getConnection();
out.print("connecting");
out.print("DEBUG : db connect ok!");
}catch(Exception e)
{
	out.print("<p>error");
e.printStackTrace();
}


try{
Connection con = null;
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@//10.250.230.209:1521/orcl","hr","hr");
Statement stmt = null;
stmt = con.createStatement();
out.print("DEBUG : db connect ok!");
} catch(Exception e){
out.print(e);
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

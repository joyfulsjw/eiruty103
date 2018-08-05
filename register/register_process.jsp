<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@page import="java.sql.*"%>




<html>
<head>
</head>
<body>

this is test

<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
out.print(id+" "+pw);
%>

<%
 Connection con = null;
 Statement stmt = null;  
 ResultSet rs = null;
 
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@//192.168.65.131:1521/orcl","hr","hr");
stmt = con.createStatement();
out.print("DEBUG : db connect ok!");

String sql = "insert into test(pk,id,pw) values (test_seq.nextval(),"+id+","+pw+")";
rs = stmt.executeUpdate(sql);
}catch(Exception e)
{
out.println(e);
}
			
%>


</body>
</html>





























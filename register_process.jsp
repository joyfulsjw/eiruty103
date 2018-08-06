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
out.print(id);
String pw = request.getParameter("pw");
out.print(pw);
String email = request.getParameter("email");
out.print(email);
String phone = request.getParameter("phone");
out.print(phone);
String addr = request.getParameter("addr");
out.print(addr);
String addr2 = request.getParameter("addr2");
out.print(addr2);
String pwq = request.getParameter("pwq");
out.print(pwq);
String pwa = request.getParameter("pwa");
out.print(pwa+"<p>");

String DBGsql = "insert into test(pk,id,pw,email,phone,addr,pwq,pwa,addr2) values (test_seq.nextval,'"+id+"','"+pw+"','"+email+"','"+phone+"','"+addr+"','"+pwq+"','"+pwa+"','"+addr2+"')";
out.print(DBGsql+"<p>");


%>


<%
 Connection con = null;
 Statement stmt = null;  
 ResultSet rs = null;
 int ri = 0;
 
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@//10.250.230.209:1521/orcl","hr","hr");
stmt = con.createStatement();
out.print("DEBUG : db connect ok!");

String sql = "insert into test(pk,id,pw,email,phone,addr,pwq,pwa) values (test_seq.nextval,'"+id+"','"+pw+"','"+email+"','"+phone+"','"+addr+"','"+pwq+"','"+pwa+"')";
ri = stmt.executeUpdate(sql);
if(ri > 0)
{
	out.print("<p> register ok!");
}
}catch(Exception e)
{
out.println(e);
}
			
%>




</body>
</html>





























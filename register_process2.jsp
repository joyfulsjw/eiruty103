<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@page import="java.sql.*"%>
<%@page import="java.security.MessageDigest"%>



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
 
 String sha = null;
 try{
 MessageDigest sh = MessageDigest.getInstance("SHA-256");
sh.update(pw.getBytes("UTF-8"));
byte data[] = sh.digest();
StringBuffer sb = new StringBuffer();
for(int i=0; i< data.length; i++)
{
	sb.append(Integer.toString((data[i]&0xff)+0x100,16).substring(1));
}
sha = sb.toString();
}catch(Exception e)
{
	e.printStackTrace();
}
	 
 
 
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@//10.250.230.209:1521/orcl","hr","hr");
stmt = con.createStatement();
out.print("DEBUG : db connect ok!");

String sql = "insert into test2(pk,id,pw,email,phone,addr,addr2,pwq,pwa) values (test_seq.nextval,'"+id+"','"+sha+"','"+email+"','"+phone+"','"+addr+"','"+addr2+"','"+pwq+"','"+pwa+"')";
ri = stmt.executeUpdate(sql);
if(ri > 0)
{
	out.print("<p> register ok!");
	response.sendRedirect("../login/login_form2.jsp");
}
}catch(Exception e)
{
out.println(e);
}
			
%>




</body>
</html>





























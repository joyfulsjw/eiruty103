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
String pw = request.getParameter("pw");
out.println(id+" "+pw);


%>

<%
 Connection con = null;
 Statement stmt = null;  
 ResultSet rs = null;
 
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
 
 
 String DBGsql = "select * from test2 where id='"+id+"' and pw='"+sha+"'";
out.println(DBGsql+"<p>");
 
 
 
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@//10.250.230.209:1521/orcl","hr","hr");
stmt = con.createStatement();
out.print("DEBUG : db connect ok!");

String sql = "select * from test2 where id='"+id+"' and pw='"+sha+"'";
rs = stmt.executeQuery(sql);

out.print("<p>");


if(rs.next())
{
	String s1 = rs.getString("id");
	out.println(id+" "+pw+" login ok!");
	session.setAttribute("id",s1);
	session.setAttribute("sha",sha);
	response.sendRedirect("../main.jsp");
}

}catch(Exception e)
{
out.print(e);
}

%>


</body>
</html>





























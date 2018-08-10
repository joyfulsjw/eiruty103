<%@ page language="java" pageEncoding="UTF-8" %>

<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@page import="java.sql.*"%>

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pw_before = request.getParameter("pw_before");
String pw_after = request.getParameter("pw_after");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String addr = request.getParameter("addr");
String addr2 = request.getParameter("addr2");
String pwq = request.getParameter("pwq");
String pwa = request.getParameter("pwa");

Connection con = null;
Statement stmt = null;  
ResultSet rs = null;
int ri = 0;
 
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@//10.250.230.209:1521/orcl","hr","hr");
stmt = con.createStatement();
out.print("DEBUG : db connect ok!");

String sql = "select * from test where pw='"+pw_before+"'";
rs = stmt.executeQuery(sql);
}catch(Exception e)
{
e.printStackTrace();
}
			
if(rs.next())
{
	String s1 = rs.getString("pk");
	String s2 = rs.getString("id");
	String s3 = rs.getString("pw");
	out.print("<tr>");
	out.print("<td>");
	out.print(s1+" "+s2+" "+s3);
	out.print("</td>");
	out.print("</tr>");
	
	try{
	String sql = "update test set pw='"+pw_after+"',email='"+email+"',phone='"+phone+"',addr='"+addr+"',addr2='"+addr2+"',pwq='"+pwq+"',pwa='"+pwa+"' where id='"+id+"' and pw='"+pw_before+"'";
	ri = stmt.executeUpdate(sql);
	if(ri > 0)
	{
		
	out.print("<p> sql update ok!");
	}
	session.setAttribute("id",id);
	response.sendRedirect("../main.jsp");
	
	
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>
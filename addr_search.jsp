<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@page import="java.sql.*"%>

<html>
<head>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");
String dong = request.getParameter("dong");

if(dong == null)
{
%>

<form method="post" action="addr_search.jsp">

<table border="1" style="width:100%;height:30%">

<tr>
<td>
우편번호 검색
</td>
</tr>

<tr>
<td>
동 입력<input type="text" size="10" name="dong"></input> <input type="submit" value="검색"></input>
</td>
</tr>

</table>

</form>



<table border="1" style="width:100%">

<tr>
<td style="width:30%;height:10%">
우편번호
</td>
<td style="width:70%;height:10%">
주소
</td>
</tr>
</table>

<%
}
else
{
	
%>
<form method="post" action="addr_search.jsp">

<table border="1" style="width:100%;height:30%">

<tr>
<td>
우편번호 검색
</td>
</tr>

<tr>
<td>
동 입력<input type="text" size="10" name="dong"></input> <input type="submit" value="검색"></input>
</td>
</tr>

</table>

</form>



<table border="1" style="width:100%">

<tr>
<td style="width:30%;height:10%">
우편번호
</td>
<td style="width:70%;height:10%">
주소
</td>
</tr>
	
	
	
<%
out.println(dong+"<p>");
String DBGsql = "select * from zipcode where dong='"+dong+"'";

out.println(DBGsql+"<p>");
Connection con = null;
Statement stmt = null;  
ResultSet rs = null;
 
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@//10.250.230.209:1521/orcl","hr","hr");
stmt = con.createStatement();
out.print("DEBUG : db connect ok!");

String sql = "select * from zipcode where dong like '%"+dong+"%'";
rs = stmt.executeQuery(sql);

out.print("<p>");


while(rs.next())
{
	String strdong = null;
	String strzipcode = null;
	strdong = rs.getString("dong");
	strzipcode = rs.getString("zipcode");
	
	
	out.print("<tr>");
	out.print("<td>");
	out.print(strzipcode);
	out.print("</td>");
	out.print("<td>");
	out.print(strdong);
	out.print("</td>");
	out.print("</tr>");
}

}catch(Exception e)
{
out.println(e);
}
}
%>

</table>


</body>
</html>



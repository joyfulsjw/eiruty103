<Host name="sjh" appBase="/usr/local/src/server/tomcat/webapps" unpackWARs="true" autoDeploy="true" xmlValidation="false" xmlNamespaceAware="false">
<Context docBase="sjh" path="" reloadable="true">



<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@page import="java.sql.*"%>

<html>
<head>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");

if(id == null)
{
	out.print("모징");
}
else
{
out.print(id);

Connection con = null;
Statement stmt = null;  
ResultSet rs = null;
 
try{

Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@//10.250.230.209:1521/orcl","hr","hr");
stmt = con.createStatement();
out.print("DEBUG : db connect ok!");

String sql = "select * from test2 where id='"+id+"'";
rs = stmt.executeQuery(sql);

out.print("<p>");


if(rs.next())
{
	out.print(id+"는 사용이 불가능");
}
else
{
	out.print(id+"는 사용이 가능");
%>
<input type="submit" value="사용하기" onClick="Fiduse()"></input>
<%
}
}
catch(SQLException e)
{
	out.print(e);
}
catch(Exception e)
{
	e.printStackTrace();
}
}
%>
</body>
</html>

<script>
function Fiduse()
{
	opener.document.myform.id_chk.value="Y";
	window.self.close();
}
</script>
<script>

var id = document.frm.id.value;
document.write(id);
</script>


<%@ page language="java" pageEncoding="UTF-8" %>




<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@page import="java.sql.*"%>



<%
out.print("DEBUG : is this really work?");
String test = "test";
out.print(test);
String pathstr = request.getContextPath();
out.print(pathstr);
%>





<%
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
<%@ include file="top.jsp"%>
</td>
</tr>

<tr>
<td rowspan="2" style="width:33%">
<%@ include file="left.jsp"%>
</td>
<td colspan="2" rowspan="2">
<%@ include file="login/login_form.jsp"%>
and this is ftp test
</td>
</tr>

</table>


</body>
</html>

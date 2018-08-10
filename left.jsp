<%@ page language="java" pageEncoding="UTF-8" %>

<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.sql.*"%>

<html>
<head>
</head>
<body>

<table border="1" style="width:100%;height:100%">

<tr>
<td>
temp
sjh 홈디렉토리 이전 테스트
<%



try{
	out.print("start");

Context ct = new InitialContext(); 
out.print("contexting");

DataSource ds = (DataSource)ct.lookup("java:comp/env/jdbc/myoracle");
out.print("datasourcing");
Connection conn2 = ds.getConnection();
out.print("connecting");

PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		pstmt = conn2.prepareStatement("select * from test");
		rs = pstmt.executeQuery();
		while (rs.next()) {
			out.print("<p>1");
		}
	} catch (Exception e) {
		out.println(e);
	}




out.print("DEBUG : db connect ok!");
}catch(Exception e)
{
e.printStackTrace();
}

%>

</td>
</tr>

<tr>
<td>
temp2
sjh 홈디렉토리 이전 테스트
</td>
</tr>

</table>

</body>
</html>
























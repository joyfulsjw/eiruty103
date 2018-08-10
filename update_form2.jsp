<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@page import="java.sql.*"%>
<%


 Connection con = null;
 Statement stmt = null;  
 ResultSet rs = null;
 int ri = 0;
 
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@//10.250.230.209:1521/orcl","hr","hr");
stmt = con.createStatement();
out.print("DEBUG : db connect ok! <p>");

String ses = null;
ses = (String)session.getAttribute("id");
if(!ses.isEmpty())
{
	out.println("session : "+ses + "<p>");
}

String sql = "select * from test2 where id='"+ses+"'";
out.print(sql+"<p>");
rs = stmt.executeQuery(sql);
if(rs.next())
{
	String id = rs.getString("id");
	String pw = rs.getString("id");
	String email = rs.getString("email");
	String phone = rs.getString("phone");
	String addr = rs.getString("addr");
	String addr2 = rs.getString("addr2");
	String pwq = rs.getString("pwq");
	String pwa = rs.getString("pwa");

	out.print(id);
	out.print(pw);
	out.print(email);
	out.print(phone);
	out.print(addr);
	out.print(addr2);
	out.print(pwq);
	out.print(pwa+"<p>");
%>

<html>
<head>
</head>
<body>

this is test
<p>
<p>
<form method="post" action="update_process2.jsp">
ID
<input type="text" size="10" name="id" value="<%=id%>"></input> 
<p>
이전 PW
<input type="text" size="10" name="pw_before"></input>
<p>
미래 PW
<input type="text" size="10" name="pw_after"></input>
<p>
미래 PW 확인
<input type="text" size="10" name="pw_after_conf"></input>
<p>
email
<input type="text" size="10" name="email" value="<%=email%>"></input>
<p>
phone
<input type="text" size="10" name="phone" value="<%=phone%>"></input>
<p>
addr
<input type="text" size="10" name="addr" value="<%=addr%>"></input>
<p>
addr2
<input type="text" size="10" name="addr2" value="<%=addr2%>"></input>
<p>
pwQ
<input type="text" size="10" name="pwq" value="<%=pwq%>"></input>
<p>
pwA
<input type="text" size="10" name="pwa" value="<%=pwa%>"></input>
<p>
<p>
<p>
<p>
<input type="submit" value="수정" onclick="FCompare()"></input>
</form>

</body>
</html>
	
	
<%	
}



}catch(Exception e)
{
e.printStackTrace();
}
			
%>

<script>
function FCompare()
{
	if(pw_after_conf == pw_after)
	{
		location.href="update_process2.jsp";
	}
	else
	{
		alert("비밀번호 불일치");
	}
}
</script>



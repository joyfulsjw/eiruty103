
<%@ page language="java" pageEncoding="UTF-8" %>





<html>
<head>
</head>
<body>

<table border="1" style="width:100%; height:100%">

<tr>
<td>
main image
</td>
<td>
board
</td>
<td>
<%
String ses = null;
String ses2 = null;
ses = (String)session.getAttribute("id");
ses2 = (String)session.getAttribute("sha");
if(ses==null)
{
%>
<a href="register/register_form.jsp">register</a>
<%
}
else
{	
if(ses2 != null)
{
%>
<a href="register/update_form2.jsp">수정(해시)</a>
<%
}
else{
	%>
	<a href="register/update_form.jsp">수정</a>
<%
}
}
%>

</td>
<td>
<%
if(ses==null)
{
%>
<a href="login/login_form.jsp">로그인</a>
<p>
<a href="login/login_form2.jsp">로그인(해시)</a>
<%
}
else
{

%>
<a href="login/logout.jsp">로그아웃</a>
<%
}
%>
</td>
</tr>

</table>


</body>
</html>















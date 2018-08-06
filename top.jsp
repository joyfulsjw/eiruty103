
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
ses = (String)session.getAttribute("id");
if(ses==null)
{
%>
<a href="register/register_form.jsp">register</a>
<%
}
else
{

%>
<a href="register/update_form.jsp">수정</a>
<%
}
%>

</td>
<td>
login
</td>
</tr>

</table>


</body>
</html>















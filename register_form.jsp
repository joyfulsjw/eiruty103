<%@ page language="java" pageEncoding="UTF-8" %>



<html>
<head>
</head>
<body>

this is test
<p>
<p>
<form method="post" action="register_process.jsp">
ID
<input type="text" size="10" name="id"></input> ID 중복체크 <input type="button" size="10" value="체크"></input>
<p>
PW
<input type="text" size="10" name="pw"></input>
<p>
email
<input type="text" size="10" name="email"></input>
<p>
phone
<input type="text" size="10" name="phone"></input>
<p>
addr
<input type="text" size="10" name="addr"></input> 주소찾기 <input type="button" size="10" value="주소찾기" onclick="Fsearch()"></input>
<p>
addr2
<input type="text" size="10" name="addr2"></input>
<p>
pwQ
<input type="text" size="10" name="pwq"></input>
<p>
pwA
<input type="text" size="10" name="pwa"></input>
<p>
<p>
<p>
<p>
<input type="submit" value="회원가입"></input>
</form>

</body>
</html>

<script>
function Fsearch()
{
	window.open("addr_search.jsp","새창","width=400, height=500, toolbar=no, menubar=no, resizable=yes");
}
</script>


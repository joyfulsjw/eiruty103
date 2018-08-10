<%@ page language="java" pageEncoding="UTF-8" %>


<script>
function Fsearch()
{
	window.open("addr_search.jsp","새창","width=400, height=500, toolbar=no, menubar=no, resizable=yes");
}


function Fidcheck()
{
	var frm = document.myform;
	var param = frm.id.value;
	window.open("id_check2.jsp?id="+param,"window2","width=400, height=500, resizable=yes");
}

function Fsubmit()
{
	if(document.myform.id_chk.value == 'Y')
	{
		document.myform.submit();
		return true;
	}
	else
	{
		alert("아이디 중복체크 필수");
		return false;
	}
}
function Fchkreset()
{
	document.myform.id_chk.value='N';
}
</script>


<html>
<head>
</head>
<body>

이건 해시되는 회원가입
<p>
<p>
<form name="myform" method="post" action="register_process2.jsp"  onSubmit="return Fsubmit()">
ID
<input type="text" size="10" name="id" onkeypress="Fchkreset()"></input> 
ID 중복체크 
<input type="button" size="10" value="주소찾기" onclick="Fidcheck();"></input>
<input type="hidden" name="id_chk" value='N'></input>
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
<input type="text" size="10" name="addr"></input> 주소찾기 <input type="button" size="10" value="주소찾기" onclick="Fsearch();"></input>
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




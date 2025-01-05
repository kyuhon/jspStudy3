<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>회원탈퇴</title>
<link href="css/deleteForm.css" rel="stylesheet" type="text/css" />
<!-- 내부자바스크립트 -->
<script language="javascript">
	function begin() {
		document.myForm.pass.focus();
	}
	function checkPass() {
		if (!document.myForm.pass.value) {
			alert("비밀번호를 입력하지 않았습니다");
			document.myForm.pass.focus();
			return false;
		}
	}
</script>
</head>
<body onload="begin()">
	<%@ include file="/buatan/piece/header.jsp"%>
	<div class="main_image">
		<img src="image/원주_반계리야간2_horiz_241108_hongjukwon.jpg" alt="배경"
			width="100%" height="670px">
	</div>
	<div class="deleteForm">
	<form name="myForm" method="post" action="deleteProc.jsp"
		onsubmit="return checkPass()">
		<table width="260" border="1" align="center">
			<tr>
				<td colspan="2" align="center" font-size="100px">회원 탈퇴</td>
			</tr>
			<tr>
				<td width="150">비밀번호입력</td>
				<td width="110">
					<input type="password" name="pass" id="pass" size="15">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="회원탈퇴"> 
				<input type="button" value="취  소"
					onclick="javascript:window.location='mypage.jsp'">
				</td>
			</tr>
		</table>
	</form>
	</div>
	<footer>
		<p>footer</p>
	</footer>
</body>
</html>
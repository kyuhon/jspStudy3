<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SignIn</title>
<link rel="stylesheet" href="css/signIn.css">
<script language="javascript" src="script.js?timestamp=<%= System.currentTimeMillis() %>"></script>
</head>
<body>
	<%@ include file="/buatan/piece/header.jsp"%>
	<div class="main_image">
		<img src="image/원주_반계리야간2_horiz_241108_hongjukwon.jpg" alt="배경"
			width="100%" height="670px">
	</div>
	
	<div class="signIn">
	<form method="post" action="sign/loginProc.jsp">
			<table width="300" border="1">
				<tr>
					<td align="right" width="100">ID</td>
					<td width="200">&nbsp;&nbsp; <input type="text" id="id" name="id"/></td>
				</tr>
				<tr>
					<td align="right" width="100">PASSWORD</td>
					<td width="200">&nbsp;&nbsp; <input type="password"name="pass" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="LOGIN" />&nbsp;&nbsp; 
					<input type="button" value="SIGN UP" onClick="javascript:window.location='signUp.jsp'"/>
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
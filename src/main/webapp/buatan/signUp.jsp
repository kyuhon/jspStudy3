<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SignUp</title>
<link rel="stylesheet" href="css/signUp.css">
<script language="javascript" src="script.js?timestamp=<%= System.currentTimeMillis() %>"></script>
</head>
<body>
	<header>
		<ul>
			<a href="title.jsp"><p>buatan</p></a>
			<li class="dropdown"><a href="#" class="dropbtn">Images</a>
				<div class="dropdown-content">
					<a href="#">Image homepage</a> <a href="#">Photos</a> <a href="#">Vectors</a>
					<a href="#">Illustrations</a> <a href="#">panoramic images</a> <a
						href="#">Image categories</a> <a href="#">Contributor
						spotlight</a>
				</div></li>
			<li class="dropdown"><a href="#" class="dropbtn">Videos</a>
				<div class="dropdown-content">
					<a href="#">Videos homepage</a> <a href="#">Video collections</a>
				</div></li>
			<li class="dropdown"><a href="#" class="dropbtn">Creative</a>
				<div class="dropdown-content">
					<a href="#">Image homepage</a> <a href="#">Fresh picks</a>
				</div></li>
			<li class="dropdown"><a href="#" class="dropbtn">More</a>
				<div class="dropdown-content">
					<a href="#">Editorial</a> <a href="#">Archive</a> <a href="#">Blog</a>
					<a href="#">Enterprise</a>
				</div></li>
		</ul>
		<ul class="header_right">
			<li class="x"><a href="#">About us</a></li>
			<li class="x"><a href="#">Sell</a></li>
			<li class="x"><a href="board.do">Board</a></li>
			<li class="x"><a href="signUp.jsp">Sign up</a></li>
			<li class="x"><a href="signIn.jsp">Sign in</a></li>
		</ul>
	</header>
	<div class="main_image">
		<img src="image/원주_반계리야간2_horiz_241108_hongjukwon.jpg" alt="배경"
			width="100%" height="670px">
	</div>

		<div class="signUp">
			<form method="post" action="regProc.jsp" name="regForm1">
				<table border="1">
					<tr>
						<td align="right">ID</td>
						<td>&nbsp;&nbsp;<input type="text" id="id" name="id" />&nbsp; <input
							type="button" value="중복확인" onClick="idCheck()" /></td>
					</tr>
					<tr>
						<td align="right">PASSWORD</td>
						<td>&nbsp;&nbsp;<input type="password" name="pass" /></td>
					</tr>
					<tr>
						<td align="right">CONFIRM PASSWORD</td>
						<td>&nbsp;&nbsp;<input type="password" name="repass" /></td>
					</tr>
					<tr>
						<td align="right">NAME</td>
						<td>&nbsp;&nbsp;<input type="text" id="name" name="name" /></td>
					</tr>
					<tr>
						<td align="right">TEL</td>
						<td>&nbsp;&nbsp;<select name="phone1">
								<option value="02">02</option>
								<option value="010">010</option>
						</select> - <input type="text" id="phone2" name="phone2" size="5" /> - <input
							type="text" id="phone3" name="phone3" size="5" /></td>
					</tr>
					<tr>
						<td align="right">EMAIL</td>
						<td>&nbsp;&nbsp;<input type="text" id="email" name="email" /></td>
					</tr>
					<tr>
						<td align="right">ZIP</td>
						<td>&nbsp;&nbsp;<input type="text" id="zipcode" name="zipcode" /> <input
							type="button" value="찾기" onClick="zipCheck()" /></td>
					</tr>
					<tr>
						<td align="right">ADDRESS</td>
						<td>&nbsp;&nbsp;<input type="text" id="address1" name="address1" /></td>
					</tr>
					<tr>
						<td align="right">DETAILED ADDRESS</td>
						<td>&nbsp;&nbsp;<input type="text" id="address2" name="address2" /></td>
					</tr>
					<tr class="bt">
						<td colspan="2" align="center"><input type="button"
							value="회원가입" onClick="inputCheck()" />&nbsp;&nbsp; <input
							type="reset" value="다시입력" /></td>
					</tr>
				</table>
			</form>
			</div>

	<footer>
		<p>footer</p>
	</footer>
</body>
</html>
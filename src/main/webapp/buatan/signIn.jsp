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
			<li class="x"><a href="#">Board</a></li>
			<li class="x"><a href="signUp.jsp">Sign up</a></li>
			<li class="x"><a href="signIn.jsp">Sign in</a></li>
		</ul>
	</header>
	<div class="main_image">
		<img src="image/원주_반계리야간2_horiz_241108_hongjukwon.jpg" alt="배경"
			width="100%" height="670px">
	</div>
	<div class="signIn">
	<form method="post" action="loginProc.jsp">
			<table width="300" border="1">
				<tr>
					<td align="right" width="100">ID</td>
					<td width="200">&nbsp;&nbsp; <input type="text" id="id" name="id"
						/></td>
				</tr>
				<tr>
					<td align="right" width="100">PASSWORD</td>
					<td width="200">&nbsp;&nbsp; <input type="password"
						name="pass" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="LOGIN" />&nbsp;&nbsp; 
					<input type="button" value="SIGN UP"
						onClick="javascript:window.location='regForm.jsp'"/>
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
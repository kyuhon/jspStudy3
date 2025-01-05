<%@page import="com.kh.edu.buatan.model.StudentDAO"%>
<%@page import="com.kh.edu.buatan.model.StudentVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 회원정보수정 -->
<!-- 1.클라이언트가 보내준 사용자정보(request)를 가져온다. -->
<!-- 그 이외에 정보를 가져오는것 ( 세션, application, request)를 가져온다 -->
<%
String id2 = (String) session.getAttribute("id");
String pass = (String) session.getAttribute("pass");
%>
<!--2. curd -->
<%
StudentVO svo = new StudentVO();
svo.setId(id2);
StudentDAO sdao = new StudentDAO();
svo = sdao.selectOneDB(svo);
%>
<!-- 3.화면설계 -->
<html>
<head>
<title>Update Form</title>
<link rel="stylesheet" href="css/signUp.css">
<script language="javascript" src="script.js?timestamp=<%= System.currentTimeMillis() %>"></script>
</head>
<body>
	<%@ include file="/buatan/piece/header.jsp"%>
	<div class="main_image">
		<img src="image/원주_반계리야간2_horiz_241108_hongjukwon.jpg" alt="배경"
			width="100%" height="670px">
	</div>
	<div class="signUp">
	<form name="regForm" method="post" action="sign/modifyProc.jsp">
		<table border="1">
			<tr>
				<td colspan="2" align="center">회원 수정 정보 입력</td>
			</tr>
			<tr>
				<td align="right">ID</td>
				<td>&nbsp;&nbsp;<%=svo.getId()%></td>
			</tr>
			<tr>
				<td align="right">PASSWORD</td>
				<td>&nbsp;&nbsp;<input type="password" name="pass"
					value="<%=svo.getPass()%>" /></td>
			</tr>
			<tr>
				<td align="right">CONFIRM PASSWORD</td>
				<td>&nbsp;&nbsp;<input type="password" name="repass"
					value="<%=svo.getPass()%>" /></td>
			</tr>
			<tr>
				<td align="right">NAME</td>
				<td>&nbsp;&nbsp;<%=svo.getName()%></td>
			</tr>
			<tr>
				<td align="right">TEL</td>
				<td>&nbsp;&nbsp;<input type="text" name="phone1" id="phone1" size="5"
					value="<%=svo.getPhone1()%>" /> - <input type="text" name="phone2"
					id="phone2" size="5" value="<%=svo.getPhone2()%>" /> - <input type="text"
					name="phone3" id="phone3" size="5" value="<%=svo.getPhone3()%>" /></td>
			</tr>
			<tr>
				<td align="right">EMAIL</td>
				<td>&nbsp;&nbsp;<input type="text" name="email" id="email" value="<%=svo.getEmail()%>" /></td>
			</tr>
			<tr>
				<td align="right">ZIP</td>
				<td>&nbsp;&nbsp;<input type="text" name="zipcode"
				id="zipcode" value="<%=svo.getZipcode()%>" /> 
				<input type="button" value="찾기" onClick="zipCheck()" />
				</td>
			</tr>
			<tr>
				<td align="right">ADRESS</td>
				<td>&nbsp;&nbsp;<input type="text" name="address1" id="address1" size="50"
					value="<%=svo.getAddress1()%>" /></td>
			</tr>
			<tr>
				<td align="right">DETAILED ADDRESS</td>
				<td>&nbsp;&nbsp;<input type="text" name="address2" id="address2" size="30"
					value="<%=svo.getAddress2()%>" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="button" value="정보수정" onClick="updateCheck()" />&nbsp;&nbsp; 
				<input type="button" value="취소" onClick="javascript:window.location='myPage.jsp'" /></td>
			</tr>
		</table>
	</form>
	</div>
	<footer>
		<p>footer</p>
	</footer>
</body>
</html>
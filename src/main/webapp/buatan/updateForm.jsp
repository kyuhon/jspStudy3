<%@page import="com.kh.edu.buatan.model.BoardVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
String pageNum = (String)request.getAttribute("pageNum");
BoardVO article = (BoardVO)request.getAttribute("article");
%>
<html>
<head>
<title>게시판</title>
<link href="css/board.css" rel="stylesheet" type="text/css">
<script language="javascript" src="script.js?timestamp=<%= System.currentTimeMillis() %>"></script>
</head>
<body >
	<%@ include file="/buatan/piece/header.jsp"%>
	<div class="main_image">
		<img src="image/원주_반계리야간2_horiz_241108_hongjukwon.jpg" alt="배경"
			width="100%" height="670px">
	</div>

	<div class="board">
		<b>글수정</b> <br>
		<form method="post" name="writeform" action="updateProc.do?pageNum=<%=pageNum%>"
			onsubmit="return writeSave()">
			<input type="hidden" name="num" value="<%=article.getNum()%>">
			<table width="400" border="1" cellspacing="0" cellpadding="0"
				align="center">
				<tr>
					<td width="70" align="center">이 름</td>
					<td align="left" width="330">
					<input type="text" size="10"
						maxlength="10" name="writer" value="<%=article.getWriter()%>">
						</td>
				</tr>
				<tr>
					<td width="70"  align="center">제 목</td>
					<td align="left" width="330">
					<input type="text" size="40"
						maxlength="50" name="subject" value="<%=article.getSubject()%>"></td>
				</tr>
				<tr>
					<td width="70"  align="center">Email</td>
					<td align="left" width="330">
					<input type="text" size="40"
						maxlength="30" name="email" value="<%=article.getEmail()%>"></td>
				</tr>
				<tr>
					<td width="70"  align="center">내 용</td>
					<td align="left" width="330">
					<textarea name="content" rows="13" cols="40">
						<%=article.getContent()%></textarea></td>
				</tr>
				<tr>
					<td width="70"  align="center">비밀번호</td>
					<td align="left" width="330"><input type="password" size="8"
						maxlength="12" name="pass"></td>
				</tr>
				<tr>
					<td colspan=2 align="center">
						<input type="submit" value="글수정">
						<input type="reset" value="다시작성">
						<input type="button" value="목록보기" onclick="document.location.href='board.do?pageNum=<%=pageNum%>'">
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
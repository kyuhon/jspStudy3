<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
int num = (Integer) request.getAttribute("num");
String pageNum = (String) request.getAttribute("pageNum");
%>
<html>
<head>
<title>게시판</title>
<link href="css/board.css" rel="stylesheet" type="text/css">
<script language="JavaScript"
	src="script.js?timestamp=<%=System.currentTimeMillis()%>"></script>
</head>
<body>

	<%@ include file="/buatan/piece/header.jsp"%>
	<div class="main_image">
		<img src="image/원주_반계리야간2_horiz_241108_hongjukwon.jpg" alt="배경"
			width="100%" height="670px">
	</div>
	
	<div class="board">
		<b>글삭제</b> <br></br>
		<form method="POST" name="delForm"
			action="deleteProcB.do?pageNum=<%=pageNum%>"
			onsubmit="return deleteSave()">
			<input type="hidden" name="num" value="<%=num%>">
			<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
				<tr height="30">
					<td align=center ><b>비밀번호를 입력해 주세요.</b></td>
				</tr>
				<tr height="30">
					<td align=center>비밀번호 : <input type="password" name="pass"
						size="8" maxlength="12">
					</td>
				</tr>
				<tr height="30">
					<td align=center ><input type="submit" value="글삭제"> 
						<input type="button" value="글목록"
						onclick="document.location.href='board.do?pageNum=<%=pageNum%>'">
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

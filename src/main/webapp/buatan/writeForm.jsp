<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
 //새로운 글로 입력하던지(num=0, ref=0, step=0, depth=0), 
 //부모글을 누르고 입력한다.(num=부모값, ref=부모값, step=부모값, depth=부모값)
int num=0, ref=0, step=0, depth=0;
num = (Integer)request.getAttribute("num");
ref = (Integer)request.getAttribute("ref");
step = (Integer)request.getAttribute("step");
depth = (Integer)request.getAttribute("depth");
 %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>writeForm</title>
    <link rel="stylesheet" href="css/board.css">
    <script language="javascript" src="script.js?timestamp=<%= System.currentTimeMillis() %>"></script>
</head>
<body>
   <%@ include file="/buatan/piece/header.jsp"%>
    
    <div class="main_image">
        <img src="image/원주_반계리야간2_horiz_241108_hongjukwon.jpg" alt="배경" width="100%" height="670px">
    </div>
    
	<br></br>
	<div class="board">
	<form method="post" name="writeForm" action="writeProc.do" onsubmit="return writeSave()">
		<input type="hidden" name="num" value="<%=num%>">
 		<input type="hidden" name="ref" value="<%=ref%>">
 		<input type="hidden" name="step" value="<%=step%>">
 		<input type="hidden" name="depth" value="<%=depth%>">  
		<table >
			<tr>
				<td align="right" colspan="2" >
				<a href="board.do">글목록</a></td>
			</tr>
			<tr>
				<td width="70" align="center">이름</td>
				<td width="330"><input type="text" size="12" maxlength="12"
					name="writer" /></td>
			</tr>
			<tr>
				<td width="70" align="center">이메일</td>
				<td width="330"><input type="text" size="30" maxlength="30"
					name="email" /></td>
			</tr>
			<tr>
				<td width="70"  align="center">제목</td>
				<td width="330">
				<%if(num == 0){%>
   			<input type="text" size="50" maxlength="50" name="subject"/>
 <%
 }else{
 %>
   <input type="text" size="50" maxlength="50" name="subject" value="[답변]"/>
 <%
 }
 %>
  </td>
			</tr>
			<tr>
				<td width="70" align="center">내용</td>
				<td width="330">
				<textarea name="content" rows="13" cols="50"></textarea>
				</td>
			</tr>
			<tr>
				<td width="70" align="center">비밀번호</td>
				<td width="330">
				<input type="password" size="10" maxlength="10" name="pass" />
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="글쓰기" /> 
				<input type="reset" value="다시작성" /> 
				<input type="button" value="목록" onClick="window.location='board.do'">
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
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.kh.edu.buatan.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String pageNum = (String)request.getAttribute("pageNum");
BoardVO bvo = (BoardVO)request.getAttribute("article");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>content</title>
    <link rel="stylesheet" href="css/board.css">
</head>
<body>
    <div class="head">
	 		<%@ include file="/buatan/piece/header.jsp"%>
    </div>
    
    <div class="main_image">
        <img src="image/원주_반계리야간2_horiz_241108_hongjukwon.jpg" alt="배경" width="100%" height="670px">
    </div>
    <div class="board">
		<form>
			<table border="1" cellspacing="0" cellpadding="0"  align="center">
				<tr height="30">
					<td align="center" width="125" >Post</td>
					<td align="center" width="125" align="center"><%=bvo.getNum()%></td>
					<td align="center" width="125" >Views</td>
					<td align="center" width="125" align="center"><%=bvo.getReadcount()%></td>
				</tr>
				<tr height="30">
					<td align="center" width="125" >Writer</td>
					<td align="center" width="125" align="center"><%=bvo.getWriter()%></td>
					<td align="center" width="125" >Date</td>
					<td align="center" width="125" align="center"><%=sdf.format(bvo.getRegdate())%></td>
				</tr>
				<tr height="30">
					<td align="center" width="125" >Title</td>
					<td align="center" width="375" align="center" colspan="3"><%=bvo.getSubject()%></td>
				</tr>
				<tr>
					<td align="center" width="125" >content</td>
					<td align="center" width="375" colspan="3"><pre><%=bvo.getContent()%></pre></td>
				</tr>
				<tr height="30">
					<td colspan="4"  align="right">
					<input type="button" value="Modify" onclick="document.location.href='updateForm.do?num=<%=bvo.getNum()%>&pageNum=<%=pageNum%>'">
						&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="button" value="Delete" onclick="document.location.href='deleteFormB.do?num=<%=bvo.getNum()%>&pageNum=<%=pageNum%>'">
						&nbsp;&nbsp;&nbsp;&nbsp; 
						<!-- 수정<1> -->
						<input type="button" value="Reply" onclick="document.location.href='writeForm.do?num=<%=bvo.getNum()%>&ref=<%=bvo.getRef()%>&step=<%=bvo.getStep()%>&depth=<%=bvo.getDepth()%>'">
             &nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="button" value="List"	 onclick="document.location.href='board.do?pageNum=<%=pageNum%>'">
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
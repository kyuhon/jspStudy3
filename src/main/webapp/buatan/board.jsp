<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.kh.edu.buatan.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//보여줄 리스트
int currentPage = (Integer)request.getAttribute("currentPage");
int startRow = (Integer)request.getAttribute("startRow");
int count = (Integer)request.getAttribute("count");
int pageSize = (Integer)request.getAttribute("pageSize");
int number = (Integer)request.getAttribute("number");
List<BoardVO> articleList = (List<BoardVO>)request.getAttribute("articleList");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Board</title>
<link rel="stylesheet" href="css/board.css">
<script language="javascript" src="script.js?timestamp=<%= System.currentTimeMillis() %>"></script>
</head>
<body>
	<%@ include file="/buatan/piece/header.jsp"%>
	
	<div class="main_image">
		<img src="image/원주_반계리야간2_horiz_241108_hongjukwon.jpg" alt="배경"
			width="100%" height="670px">
	</div>
	
	<div class="body">
	<div class="board" >
		<div class="tableHead">
			<tr>
				<b>글목록(전체 글:<%=count%>)</b>
				<p><a href="writeForm.do">글쓰기</a></p>
			</tr>
			</div>
		<%
		if (count == 0) {
		%>
		<table>
			<tr>
				<td align="center">게시판에 저장된 글이 없습니다.</td>
		</table>
		<%
		} else {
		%>
		<table>
			<tr>
				<th>번 호</th>
				<th>제 목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조 회</th>
				<th>IP</th>
			</tr>
			<%
			for (BoardVO article: articleList) {
			%>
			<tr >
				<td ><%=number--%></td>
				<!-- 위에 -- 모지? -->
				<td >
					<!-- 수정 <5> --> 
				<a href="content.do?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
				<%
				  //6. depth 값에 따라서 5배수로 증가를 해서 화면에 보여줘야한다.
				// depth : 1 => 길이 : 5, depth : 2 => 길이 : 10
      int wid=0; 
      if(article.getDepth()>0){
        wid=5*(article.getDepth());
 %>
  		<img src="image/level.gif" width="<%=wid%>" height="16">
  		<img src="image/re.gif">
 <%	
 } else {
 %>
 			 <img src="image/level.gif" width="<%=wid%>" height="16">
 <%}%>		 
					<!-- 수정<6> -->
						<%=article.getSubject()%>
						</a> 
						<% if (article.getReadcount() >= 20) { %> 
						<img src="image/hot.gif" border="0" height="16">
					<%
					}
					%>
				</td>
				<td >
				<a href="mailto:<%=article.getEmail()%>"> <%=article.getWriter()%></a></td>
				<td ><%=sdf.format(article.getRegdate())%></td>
				<td ><%=article.getReadcount()%></td>
				<td ><%=article.getIp()%></td>
			</tr>
			<%
			}
			%>
	 <%
		}
	 %>
		</table>
	</div>
	</div>
	<br>
		<div class="page">
	 <%	//페이지번호
    if (count > 0) {
        int pageBlock = 10;	//보여줄페이지
        int imsi = count % pageSize == 0 ? 0 : 1;
        int pageCount = count / pageSize + imsi;
        int startPage = (int)((currentPage-1)/pageBlock)*pageBlock + 1;
        int endPage = startPage + pageBlock - 1;
        if (endPage > pageCount) endPage = pageCount;  
        if (startPage > pageBlock) {    
   %>
        <a href="board.do?pageNum=<%=startPage-pageBlock%>">이전</a>
   <%
        }
        for (int i = startPage ; i <= endPage ; i++) { 
        	if(currentPage == i){
   %>     		
        		<a href="board.do?pageNum=<%= i %>">[<%= i %>]</a>
   <%     		
        	} else {
   %>     		
        		<a href="board.do?pageNum=<%= i %>">[<%= i %>]</a>
   <%     		
        	}
        }
        
        if (endPage < pageCount) { 
   %>
        <a href="board.do?pageNum=<%=startPage+pageBlock%>">다음</a>
   <%
          }
      }
   %>
		<!-- 수정 <7> -->
</div>
	
	<footer>
		<p>footer</p>
	</footer>
	
</body>
</html>
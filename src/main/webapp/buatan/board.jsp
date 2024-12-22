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
	
	<div class="board" align="center">
		<b>글목록(전체 글:<%=count%>)</b>
		<table width="700">
			<tr>
				<td align="right"><a href="writeForm.do">글쓰기</a></td>
			</tr>
		</table>
		<%
		if (count == 0) {
		%>
		<table width="700" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">게시판에 저장된 글이 없습니다.</td>
		</table>
		<%
		} else {
		%>
		<table border="1" width="700" cellpadding="0" cellspacing="0" align="center">
			<tr height="30" ">
				<td align="center" width="50">번 호</td>
				<td align="center" width="250">제 목</td>
				<td align="center" width="100">작성자</td>
				<td align="center" width="150">작성일</td>
				<td align="center" width="50">조 회</td>
				<td align="center" width="100">IP</td>
			</tr>
			<%
			for (BoardVO article: articleList) {
			%>
			<tr height="30">
				<td align="center" width="50"><%=number--%></td>
				<!-- 위에 -- 모지? -->
				<td width="250">
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
						<img src="images/hot.gif" border="0" height="16">
					<%
					}
					%>
				</td>
				<td align="center" width="100">
				<a href="mailto:<%=article.getEmail()%>"> <%=article.getWriter()%></a></td>
				<td align="center" width="150"><%=sdf.format(article.getRegdate())%></td>
				<td align="center" width="50"><%=article.getReadcount()%></td>
				<td align="center" width="100"><%=article.getIp()%></td>
			</tr>
			<%
			}
			%>
	 <%
		}
	 %>
		</table>
	</div>
	<br>
		<div align="center">
	 <%	//페이지번호
    if (count > 0) {
        int pageBlock = 5;	//보여줄페이지
        int imsi = count % pageSize == 0 ? 0 : 1;
        int pageCount = count / pageSize + imsi;
        int startPage = (int)((currentPage-1)/pageBlock)*pageBlock + 1;
        int endPage = startPage + pageBlock - 1;
        if (endPage > pageCount) endPage = pageCount;  
        if (startPage > pageBlock) {    
   %>
        <a href="board.do?pageNum=<%=startPage-pageBlock%>">[이전]</a>
   <%
        }
        for (int i = startPage ; i <= endPage ; i++) { 
        	if(currentPage == i){
   %>     		
        		<a href="board.do?pageNum=<%= i %>">[[<%= i %>]]</a>
   <%     		
        	} else {
   %>     		
        		<a href="board.do?pageNum=<%= i %>">[<%= i %>]</a>
   <%     		
        	}
        }
        
        if (endPage < pageCount) { 
   %>
        <a href="board.do?pageNum=<%=startPage+pageBlock%>">[다음]</a>
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
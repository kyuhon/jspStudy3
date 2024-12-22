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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>buatan</title>
    <link rel="stylesheet" href="css/title.css">
</head>
<body>
    <header>
        <ul>
            <a href="title.jsp"><p>buatan</p></a>
            <li class="dropdown">
                <a href="#" class="dropbtn">Images</a>
                <div class="dropdown-content">
                    <a href="#">Image homepage</a>
                    <a href="#">Photos</a>
                    <a href="#">Vectors</a>
                    <a href="#">Illustrations</a>
                    <a href="#">panoramic images</a>
                    <a href="#">Image categories</a>
                    <a href="#">Contributor spotlight</a>
                </div>
            </li>
            <li class="dropdown">
                <a href="#" class="dropbtn">Videos</a>
                <div class="dropdown-content">
                    <a href="#">Videos homepage</a>
                    <a href="#">Video collections</a>
                </div>
            </li>
            <li class="dropdown">
                <a href="#" class="dropbtn">Creative</a>
                <div class="dropdown-content">
                    <a href="#">Image homepage</a>
                    <a href="#">Fresh picks</a>
                </div>
            </li>
            <li class="dropdown">
                <a href="#" class="dropbtn">More</a>
                <div class="dropdown-content">
                    <a href="#">Editorial</a>
                    <a href="#">Archive</a>
                    <a href="#">Blog</a>
                    <a href="#">Enterprise</a>
                </div>
            </li>
        </ul>
        <ul class="header_right">
            <li class="x"><a href="#" >About us</a></li>
            <li class="x"><a href="#" >Sell</a></li>
            <li class="x"><a href="board.do">Board</a></li>
            <li class="x"><a href="signUp.jsp">Sign up</a></li>
            <li class="x"><a href="signIn.jsp">Sign in</a></li>
        </ul>
    </header>
    
    <div class="main_image">
        <img src="image/원주_반계리야간2_horiz_241108_hongjukwon.jpg" alt="배경" width="100%" height="670px">
    </div>
    <div>
    	<b>글내용 보기</b> <br></br>
		<form>
			<table width="500" border="1" cellspacing="0" cellpadding="0"  align="center">
				<tr height="30">
					<td align="center" width="125" >글번호</td>
					<td align="center" width="125" align="center"><%=bvo.getNum()%></td>
					<td align="center" width="125" >조회수</td>
					<td align="center" width="125" align="center"><%=bvo.getReadcount()%></td>
				</tr>
				<tr height="30">
					<td align="center" width="125" >작성자</td>
					<td align="center" width="125" align="center"><%=bvo.getWriter()%></td>
					<td align="center" width="125" >작성일</td>
					<td align="center" width="125" align="center"><%=sdf.format(bvo.getRegdate())%></td>
				</tr>
				<tr height="30">
					<td align="center" width="125" >글제목</td>
					<td align="center" width="375" align="center" colspan="3"><%=bvo.getSubject()%></td>
				</tr>
				<tr>
					<td align="center" width="125" >글내용</td>
					<td align="left" width="375" colspan="3"><pre><%=bvo.getContent()%></pre></td>
				</tr>
				<tr height="30">
					<td colspan="4"  align="right">
					<input type="button" value="글수정" onclick="document.location.href='updateForm.do?num=<%=bvo.getNum()%>&pageNum=<%=pageNum%>'">
						&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="button" value="글삭제" onclick="document.location.href='deleteForm.do?num=<%=bvo.getNum()%>&pageNum=<%=pageNum%>'">
						&nbsp;&nbsp;&nbsp;&nbsp; 
						<!-- 수정<1> -->
						<input type="button" value="답글쓰기" onclick="document.location.href='writeForm.do?num=<%=bvo.getNum()%>&ref=<%=bvo.getRef()%>&step=<%=bvo.getStep()%>&depth=<%=bvo.getDepth()%>'">
             &nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="button" value="글목록"	 onclick="document.location.href='list.do?pageNum=<%=pageNum%>'">
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
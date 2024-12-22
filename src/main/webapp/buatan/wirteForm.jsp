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
    <link rel="stylesheet" href="css/writeForm.css">
    <script language="javascript" src="script.js?timestamp=<%= System.currentTimeMillis() %>"></script>
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
  <b>글쓰기</b>
	<br></br>
	<form method="post" name="writeForm" action="writeForm.do" onsubmit="return writeSave()">
		<input type="hidden" name="num" value="<%=num%>">
 		<input type="hidden" name="ref" value="<%=ref%>">
 		<input type="hidden" name="step" value="<%=step%>">
 		<input type="hidden" name="depth" value="<%=depth%>">  
		<table width="400" border="1" cellpadding="0" cellspacing="0" align="center" >
			<tr>
				<td align="right" colspan="2" >
				<a href="list.do">글목록</a></td>
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
				<td colspan="2" " align="center">
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/header.css">
<title>header</title>
</head>
<body>
	<header>
        <ul>
            <a href="./title.jsp"><p>buatan</p></a>
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
            <li class="x"><a href="check/checkSession.jsp?target=/jspStudy3/buatan/productList.jsp" >Sell</a></li>
            <li class="x"><a href="check/checkSession.jsp?target=/jspStudy3/buatan/board.do">Board</a></li>
            <li class="x"><a href="./signUp.jsp">Sign up</a></li>
						<% if(id != null){ %>
						<li class="dropdown">
                <a href="#" class="dropbtn"><%=id%></a>
                <div class="dropdown-content">
                    <a href="myPage.jsp">MyPage</a>
                    <a href="sign/logoutProc.jsp">Logout</a>
                </div>
            </li>
            <% }else{ %>
            <li class="x"><a href="signIn.jsp">Sign in</a></li>
            <%} %>
        </ul>
    </header>
</body>
</html>
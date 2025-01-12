<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String role = (String) session.getAttribute("role");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myPage</title>
    <link rel="stylesheet" href="css/myPage.css">
</head>
<body>
    <div class="head">
	 		<%@ include file="/buatan/piece/header.jsp"%>
    </div>
    
    <div class="main_image">
        <img src="image/원주_반계리야간2_horiz_241108_hongjukwon.jpg" alt="배경" width="100%" height="670px">
    </div>

		<div class="myPage">
				<% 
        if ("ADMIN".equals(role)) { 
        %>
				<a href="productForm.jsp">Product Regist</a>
				<% }%>
				<a href="cartList.jsp">Cart List</a>
				<a href="modifyForm.jsp">Edit Member</a>
				<a href="deleteForm.jsp" class="logout">Cancel Member</a>
		</div>
    
    <footer>
        <p>footer</p>
    </footer>


</body>
</html>
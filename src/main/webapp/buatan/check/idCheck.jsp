<%@page import="com.kh.edu.buatan.model.StudentDAO"%>
<%@page import="com.kh.edu.buatan.model.StudentVO"%>
<%@page contentType="text/html; charset=UTF-8"%>
<!-- 1.사용자정보를 가져온다  -->
<!-- 2.curd  -->
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");

StudentVO svo = new StudentVO();
svo.setId(id);
StudentDAO sdao = new StudentDAO();
boolean flag = sdao.selectIdCheck(svo);
%>
<!-- 3.화면설계(자바코드에 해야되는데 - > jsp service함수에서 진행한다. -->
<html>
<head>
<title>ID중복체크</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="script.js?timestamp=<%= System.currentTimeMillis() %>"></script>
</head>
<body>
	<br>
	<main>
<%
		if (flag == true) {
			out.println(id+"는 이미 존재하는 ID입니다.<br></br>");
		} else {
			out.println(id+"는 사용 가능 합니다.<br></br>");
		}
%>
	</main>
	 <hr>
	<button onClick="javascript:self.close()">닫기</button>
</body>
</html>
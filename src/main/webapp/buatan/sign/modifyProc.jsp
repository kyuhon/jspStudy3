<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="sdao" class="com.kh.edu.buatan.model.StudentDAO" />
<jsp:useBean id="svo" class="com.kh.edu.buatan.model.StudentVO">
	<jsp:setProperty name="svo" property="*" />
</jsp:useBean>

<%
String id = (String) session.getAttribute("id");
svo.setId(id);
boolean flag = sdao.updateDB(svo);
%>
<html>
<head>
<title>Update Process</title>
</head>
<meta http-equiv="Refresh" content="3;url=../title.jsp">
<body>
	<main>
		<%
		if (flag == true) {
			session.setAttribute("pass", svo.getPass());
		%>
		<p>
			입력하신 내용대로 <b>회원정보가 수정 되었습니다.</b><br></br> 3초후에 main Page로 이동합니다
		</p>
		<%
		} else {
		%>
		<p>
			입력하신 내용대로 <b>회원정보가 수정 안되었습니다.</b><br></br> 3초후에 main Page로 이동합니다
		</p>
		<%
		}
		%>
	</main>
</body>
</html>
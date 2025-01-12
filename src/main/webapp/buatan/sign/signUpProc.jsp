<%@page import="com.kh.edu.buatan.model.StudentDAO"%>
<%@page import="java.rmi.StubNotFoundException"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<% 
 request.setCharacterEncoding("utf-8");
 StudentDAO sdao = new StudentDAO(); 
%>
<jsp:useBean id="svo" class="com.kh.edu.buatan.model.StudentVO" />
<jsp:setProperty name="svo" property="*" />
<% 
	boolean flag = sdao.insertDB(svo);

if(flag){
%>
	<script>
		alert("회원가입이 완료되었습니다.");
		window.location.href = "../signIn.jsp"; // 회원가입 완료 후 로그인 페이지로 이동
	</script>
<%
	}else{
%>
	  <script>
		alert("회원가입에 실패하였습니다. 다시 시도해주세요.");
		window.location.href = "../signUp.jsp"; // 실패 시 회원가입 페이지로 이동
	</script>
<%	
	}
%>

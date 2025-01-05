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
	  out.println("<b>회원가입 완료</b><br/>");
	  out.println("<a href=../signIn.jsp>로그인</a>");
	}else{
	  out.println("<b>다시 입력하여 주십시오.</b><br/>");
	  out.println("<a href=../signUp.jsp>다시 가입</a>");
	}
%>

<%@page import="com.kh.edu.buatan.control.ActionForward"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 세션에서 로그인 상태 확인
    String id = (String) session.getAttribute("id");
		String targetPage = request.getParameter("target");
    if (id != null) {
    	response.sendRedirect(targetPage);
    } else {
    	// 로그인하지 않은 경우
        out.println("<script>alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.'); location.href='../signIn.jsp';</script>");
        return;
    }
%>

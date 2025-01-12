<%@page import="com.kh.edu.buatan.model.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String userId = (String) session.getAttribute("userId");
    String productNumParam = request.getParameter("productNum");

    if (userId == null || productNumParam == null) {
        response.sendRedirect(request.getContextPath() + "/buatan/cartList.jsp");
        return;
    }

    int productNum = Integer.parseInt(productNumParam);
    CartDAO cartDAO = CartDAO.getInstance();

    boolean isDeleted = cartDAO.deleteCartItem(userId, productNum);

    if (isDeleted) {
        out.println("<script>alert('상품이 삭제되었습니다.'); location.href='" + request.getContextPath() + "/buatan/cartList.jsp';</script>");
    } else {
        out.println("<script>alert('삭제 중 문제가 발생했습니다.'); history.back();</script>");
    }
%>

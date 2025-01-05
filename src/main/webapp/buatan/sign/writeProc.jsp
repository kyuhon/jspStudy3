<%@ page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 사용자정보 -->
<%
boolean flag = (Boolean) request.getAttribute("flag");
if (flag == true) {
	response.sendRedirect("board.do");
} else {
%>
<script>
	alert("게시판글등록이 실패되었습니다.");
	history.go(-1);
</script>
<%
}
%>

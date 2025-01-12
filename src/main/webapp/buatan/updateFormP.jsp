<%@page import="com.kh.edu.buatan.model.ProductVO"%>
<%@page import="com.kh.edu.buatan.model.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // 로그인 상태와 role 확인
    String userId = (String) session.getAttribute("userId");
    String role = (String) session.getAttribute("role");

    // 디버깅: 로그인 정보 출력
    System.out.println("updateForm.jsp 접근: userId=" + userId + ", role=" + role);

    // 로그인되지 않거나 admin이 아닌 경우 로그인 페이지로 리다이렉트
    if (userId == null || userId.isEmpty() || !"ADMIN".equalsIgnoreCase(role)) {
        session.setAttribute("redirectUrl", request.getRequestURI());
        response.sendRedirect(request.getContextPath() + "/buatan/signIn.jsp");
        return;
    }

    // 상품 번호 가져오기
    String productNumParam = request.getParameter("productNum");
    if (productNumParam == null || productNumParam.isEmpty()) {
        response.sendRedirect(request.getContextPath() + "/buatan/productList.jsp");
        return;
    }

    int productNum = Integer.parseInt(productNumParam);

    // DAO를 통해 상품 정보 가져오기
    ProductDAO productDAO = ProductDAO.getInstance();
    ProductVO product = productDAO.selectOne(productNum);

    // 상품 정보가 없으면 목록으로 이동
    if (product == null) {
        response.sendRedirect(request.getContextPath() + "/buatan/productList.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 수정</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/buatan/css/productForm.css">
    <script>
        function validateForm() {
            const name = document.productForm.name.value.trim();
            const price = document.productForm.price.value.trim();

            if (name === "") {
                alert("상품 이름을 입력하세요.");
                document.productForm.name.focus();
                return false;
            }

            if (price === "" || isNaN(price)) {
                alert("상품 가격을 올바르게 입력하세요.");
                document.productForm.price.focus();
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
		<div class="head">
	 		<%@ include file="/buatan/piece/header.jsp"%>
    </div>
    
    <div class="main_image">
        <img src="image/원주_반계리야간2_horiz_241108_hongjukwon.jpg" alt="배경" width="100%" height="670px">
    </div>
    

    <main>
        <section>
            <article class="productFormArticle">
                <h2 class="productTitle">상품 수정</h2>
                <form name="productForm" method="post" action="sign/updateProcP.jsp" enctype="multipart/form-data" onsubmit="return validateForm()">
                    <!-- 작성자 ID 및 상품 번호 hidden 필드로 설정 -->
                    <input type="hidden" name="studentId" value="<%= product.getStudentId() %>">
                    <input type="hidden" name="productNum" value="<%= product.getNum() %>">
                    <table class="productTable">
                        <tr>
                            <th>상품 이름</th>
                            <td>
                                <input type="text" name="name" class="inputField" maxlength="40" value="<%= product.getName() %>">
                            </td>
                        </tr>
                        <tr>
                            <th>상품 가격</th>
                            <td>
                                <input type="text" name="price" class="inputField" maxlength="15" value="<%= product.getPrice() %>">
                            </td>
                        </tr>
                        <tr>
                            <th>상품 설명</th>
                            <td>
                                <textarea name="detail" class="textArea" rows="5" maxlength="300"><%= product.getDetail() %></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>새로운 첨부파일</th>
                            <td>
                                <input type="file" name="originFile" class="inputField" accept="image/*">
                            </td>
                        </tr>
                    </table>
                    <div class="productButtonGroup">
                        <button type="submit" class="productButton submit">수정</button>
                        <button type="button" class="productButton list" onclick="window.location='<%= request.getContextPath() %>/buatan/productList.jsp'">목록</button>
                    </div>
                </form>
            </article>
        </section>
    </main>
    <%@ include file="/buatan/piece/footer.jsp"%>

</body>
</html>

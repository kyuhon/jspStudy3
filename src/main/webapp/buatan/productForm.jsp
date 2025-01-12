<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // 로그인 상태와 role 확인
    String userId = (String) session.getAttribute("userId");
    String role = (String) session.getAttribute("role");

    // 디버깅: 로그인 정보 출력
    System.out.println("productForm.jsp 접근: userId=" + userId + ", role=" + role);

    // 로그인되지 않거나 admin이 아닌 경우 로그인 페이지로 리다이렉트
    if (userId == null || userId.isEmpty() || !"ADMIN".equalsIgnoreCase(role)) {
        session.setAttribute("redirectUrl", request.getRequestURI());
        response.sendRedirect(request.getContextPath() + "/signIn.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 등록</title>
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
                <h2 class="productTitle">ProductRegist</h2>
                <form name="productForm" method="post" action="sign/productProc.jsp" enctype="multipart/form-data" onsubmit="return validateForm()">
                    <!-- 작성자 ID를 hidden 필드로 설정 -->
                    <input type="hidden" name="studentId" value="<%= userId %>">
                    <table class="productTable">
                        <tr>
                            <th>Name</th>
                            <td>
                                <input type="text" name="name" class="inputField" maxlength="40">
                            </td>
                        </tr>
                        <tr>
                            <th>Price</th>
                            <td>
                                <input type="text" name="price" class="inputField" maxlength="15">
                            </td>
                        </tr>
                        <tr>
                            <th>Description</th>
                            <td>
                                <textarea name="detail" class="textArea" rows="5" maxlength="300"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>ImageFile</th>
                            <td>
                                <input type="file" name="originFile" class="inputField" accept="image/*">
                            </td>
                        </tr>
                    </table>
                    <div class="productButtonGroup">
                        <button type="submit" class="productButton submit">Regist</button>
                        <button type="reset" class="productButton reset">Reset</button>
                        <button type="button" class="productButton list" onclick="window.location='productList.jsp'">productList</button>
                    </div>
                </form>
            </article>
        </section>
    </main>
    
    <%@ include file="/buatan/piece/footer.jsp"%>
</body>
</html>

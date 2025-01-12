<%@page import="com.kh.edu.buatan.model.ProductDAO"%>
<%@page import="com.kh.edu.buatan.model.ProductVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>

<%
String userId = (String) session.getAttribute("userId");
String role = (String) session.getAttribute("role");
%>
<%
// DAO 인스턴스 생성
ProductDAO pdao = ProductDAO.getInstance();

// 상품 목록 조회
List<ProductVO> productList = pdao.selectAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link rel="stylesheet" href="css/productList.css">
</head>
<body>
 		<div class="head">
	 		<%@ include file="/buatan/piece/header.jsp"%>
    </div>
    
    <div class="main_image">
        <img src="image/원주_반계리야간2_horiz_241108_hongjukwon.jpg" alt="배경" width="100%" height="670px">
    </div>

	<!-- 메인 -->
	<main>
		<section>
			<article class="product-list-container">
				<div class="productBoardTitle">
					<span class="productBoardTitleSpan">상품 목록</span>
				</div>
				<div class="product-list">
					<%
					if (productList.isEmpty()) {
					%>
					<p style="text-align: center; color: #666;">등록된 상품이 없습니다.</p>
					<%
					} else {
					for (ProductVO product : productList) {
					%>
					<div class="product-item">
						<div class="product-image">
							<%
							if (product.getSysFile() != null && !product.getSysFile().isEmpty()) {
							%>
							<img
								src="<%=request.getContextPath()%>/uploads/<%=product.getSysFile()%>"
								alt="상품 이미지">
							<%
							} else {
							%>
							<img src="<%=request.getContextPath()%>/images/no-image.png"
								alt="이미지 없음">
							<%
							}
							%>
						</div>
						<div class="product-details">
							<p class="product-name"><%=product.getName()%></p>
							<p class="product-price">
								가격:
								<%=product.getPrice()%>원
							</p>
							<p class="product-description"><%=product.getDetail()%></p>
							<!-- 관리자용 버튼 -->
							<%
							if ("admin".equalsIgnoreCase(role)) {
							%>
							<div class="admin-buttons">
								<form method="get" action="<%=request.getContextPath()%>/buatan/updateFormP.jsp"
									style="display: inline;">
									<input type="hidden" name="productNum" value="<%=product.getNum()%>">
									<button type="submit" class="admin-button update">수정</button>
								</form>
								<form method="post" action="<%=request.getContextPath()%>/buatan/sign/deleteProcP.jsp"
									style="display: inline;">
									<input type="hidden" name="productNum" value="<%=product.getNum()%>">
									<button type="submit" class="admin-button delete"
										onclick="return confirm('상품을 삭제하시겠습니까?');">삭제</button>
								</form>
							</div>
							<%
							}
							%>
							<!-- 카트에 담기 -->
							<form class="pNum" method="post" action="<%=request.getContextPath()%>/buatan/sign/cartProc.jsp">
								<input type="hidden" name="productNum" value="<%=product.getNum()%>"> 
								<label for="quantity-<%=product.getNum()%>">수량:</label> 
								<select name="quantity" id="quantity-<%=product.getNum()%>" class="quantity-select">
									<%
									for (int i = 1; i <= 10; i++) {
									%>
									<option value="<%=i%>"><%=i%></option>
									<%
									}
									%>
								</select>
								<button type="submit" class="add-to-cart-button">카트에 담기</button>
							</form>
						</div>
					</div>
					<%
					}
					}
					%>
				</div>
			</article>
		</section>
	</main>
	<%@ include file="/buatan/piece/footer.jsp"%>

</body>
</html>

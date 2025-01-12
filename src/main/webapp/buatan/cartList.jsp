<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.kh.edu.buatan.model.CartVO"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.edu.buatan.model.ProductDAO"%>
<%@page import="com.kh.edu.buatan.model.CartDAO"%>
<%@page import="com.kh.edu.buatan.model.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String userId = (String) session.getAttribute("userId");

    // 로그인 확인
    if (userId == null || userId.isEmpty()) {
        out.println("<script>alert('로그인이 필요합니다.'); location.href='" + request.getContextPath() + "/signIn.jsp';</script>");
        return;
    }

    // DAO 인스턴스 생성
    CartDAO cartDAO = CartDAO.getInstance();
    ProductDAO productDAO = ProductDAO.getInstance();

    // 사용자 카트 목록 조회
    List<CartVO> cartList = cartDAO.selectAll(userId);

    // 상품 ID별 수량 및 상품 정보 매핑
    Map<Integer, Integer> quantityMap = new HashMap<>();
    Map<Integer, ProductVO> productMap = new HashMap<>();

    for (CartVO cart : cartList) {
        int productNum = cart.getProductNum();
        int quantity = cart.getQuantity();

        // 수량 합산
        quantityMap.put(productNum, quantityMap.getOrDefault(productNum, 0) + quantity);

        // 상품 정보 가져오기 (없으면 DB 조회)
        if (!productMap.containsKey(productNum)) {
            ProductVO product = productDAO.selectOne(productNum);
            if (product != null) {
                productMap.put(productNum, product);
            }
        }
    }

    // 총 가격 계산
    int totalPrice = 0;
    for (Map.Entry<Integer, Integer> entry : quantityMap.entrySet()) {
        int productNum = entry.getKey();
        int quantity = entry.getValue();
        ProductVO product = productMap.get(productNum);

        if (product != null) {
            totalPrice += product.getPrice() * quantity;
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cartList</title>
    <link rel="stylesheet" href="css/cartList.css">
</head>
<body>
    <div class="head">
	 		<%@ include file="/buatan/piece/header.jsp"%>
    </div>
    
    <div class="main_image">
        <img src="image/원주_반계리야간2_horiz_241108_hongjukwon.jpg" alt="배경" width="100%" height="670px">
    </div>
<section>
        <article>
        <h2 style="text-align: center;">장바구니</h2>
        <div class="cart-list">
            <%
                if (cartList.isEmpty()) {
            %>
            <p style="text-align: center;">장바구니에 담긴 상품이 없습니다.</p>
            <%
                } else {
                    for (Map.Entry<Integer, Integer> entry : quantityMap.entrySet()) {
                        int productNum = entry.getKey();
                        int quantity = entry.getValue();
                        ProductVO product = productMap.get(productNum);

                        if (product != null) {
            %>
            <div class="cart-item">
			    <div class="product-image">
			        <img src="<%=request.getContextPath()%>/uploads/<%= product.getSysFile() %>" alt="상품 이미지">
			    </div>
			    <div class="product-details">
			        <p class="product-name"><%= product.getName() %></p>
			        <p class="product-quantity">개수: <%= quantity %>개</p>
			        <p class="product-price">가격: <%= product.getPrice() %>원</p>
			        <p class="product-total-price">합계: <%= product.getPrice() * quantity %>원</p>
			        <!-- 삭제 버튼 -->
			        <form method="post" action="<%= request.getContextPath() %>/sign/cartDelete.jsp" style="margin-top: 10px;">
			            <input type="hidden" name="productNum" value="<%= productNum %>">
			            <button type="submit" class="delete-cart-button">삭제하기</button>
			        </form>
			    </div>
			</div>

            <%
                        }
                    }
                }
            %>
        </div>
        <div class="total-price">
            <h3>총 가격: <%= totalPrice %>원</h3>
        </div>
        </article>
      </section>
    
    <%@ include file="/buatan/piece/footer.jsp"%>


</body>
</html>
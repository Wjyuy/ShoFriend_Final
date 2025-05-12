<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 상세 정보</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <style>
        .order-details {
            margin-top: 30px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .order-item {
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }
        .order-item:last-child {
            border-bottom: none;
        }
        .total-price {
            margin-top: 20px;
            font-size: 1.2em;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>주문 상세 정보</h2>

        <c:if test="${empty orderDetail}">
            <p>해당 주문의 상세 정보가 없습니다.</p>
        </c:if>

        <c:if test="${not empty orderDetail}">
            <div class="order-details">
                <h3>주문 정보</h3>
                <p><strong>주문 번호:</strong> ${orderDetail.order.partner_order_id}</p>
                <p><strong>주문 날짜:</strong> <fmt:formatDate value="${orderDetail.order.order_date}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                <p><strong>배송 주소:</strong> ${orderDetail.order.delivery_address} (${orderDetail.order.delivery_zipcode})</p>
                <p><strong>배송 상태:</strong> ${orderDetail.order.payment_status}</p>
                <p><strong>총 주문 금액:</strong> <fmt:formatNumber value="${orderDetail.order.total_price}" pattern="#,###원"/></p>

                <h3 class="mt-4">주문 상품 목록</h3>
                <c:if test="${empty orderDetail.orderItems}">
                    <p>주문한 상품이 없습니다.</p>
                </c:if>
				<c:if test="${not empty orderDetail.orderItems}">
				    <c:forEach var="item" items="${orderDetail.orderItems}">
				        <div class="order-item">
				            <h4>${item.product.title}</h4>
				            <p><strong>수량:</strong> ${item.quantity}개</p>
				            <p><strong>가격:</strong> <fmt:formatNumber value="${item.sale_price}" pattern="#,###원"/></p>
				            <p><strong>총 상품 금액:</strong> <fmt:formatNumber value="${item.sale_price * item.quantity}" pattern="#,###원"/></p>
				        </div>
				    </c:forEach>
				</c:if>

                <div class="total-price">
                    총 결제 금액: <fmt:formatNumber value="${orderDetail.order.total_price}" pattern="#,###원"/>
                </div>
            </div>
        </c:if>

        <a href="javascript:history.back()" class="btn btn-secondary mt-3">뒤로 가기</a>
        <a href="${pageContext.request.contextPath}/" class="btn btn-primary mt-3 ml-2">홈으로 돌아가기</a>
    </div>

    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
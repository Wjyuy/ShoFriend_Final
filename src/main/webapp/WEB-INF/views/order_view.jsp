<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 목록</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>주문 목록</h2>
        <c:if test="${empty orderList}">
            <p>주문 내역이 없습니다.</p>
        </c:if>
        <c:if test="${not empty orderList}">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>주문 번호</th>
                        <th>주문 날짜</th>
                        <th>총 주문 금액</th>
                        <th>배송 주소</th>
                        <th>배송 상태</th>
                        <th>주문 상세</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orderList}">
                        <tr>
                            <td>${order.partner_order_id}</td>
                            <td><fmt:formatDate value="${order.order_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td><fmt:formatNumber value="${order.total_price}" pattern="#,###원"/></td>
                            <td>${order.delivery_address} (${order.delivery_zipcode})</td>
                            <td>${order.payment_status}</td>
                            <td><a href="${pageContext.request.contextPath}/order/detail?orderid=${order.id}" class="btn btn-sm btn-outline-primary">상세 보기</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">홈으로 돌아가기</a>
    </div>

    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
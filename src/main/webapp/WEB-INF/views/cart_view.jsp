<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
</head>
<body>
    <h2>장바구니</h2>
    <table width="500" border="1">
		<tr>
            <td>주문번호</td>
			<td>상품ID</td>
			<td>상품명</td>
			<td>수량</td>
			<td>가격</td>
			<td>합계</td>
		</tr>
<!-- 		조회결과 -->
<!-- 		list : 모델객체에서 보낸 이름 -->
		<c:forEach var="dto" items="${items}">
			<tr>
				<td>${dto.id}</td>
				<td>${dto.product_id}</td>
				<td>${dto.product_title}</td>
				<td>${dto.quantity}</td>
				<td>${dto.price}</td>
				<td>${dto.price*dto.quantity}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
			<!-- 			write_view : 컨트롤러단 호출 -->
				<a href="order_view">주문하기</a>
			</td>
		</tr>
	</table>
    
</body>
</html>
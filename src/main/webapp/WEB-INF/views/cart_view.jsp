<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
	<script>
		window.onload = function(){
			calculateTotal();
			setIndividualCheckbox();
		}
		function toggleAll(source){
			const checkboxes = document.getElementsByClassName('cartCheckbox');
			for(let i = 0; i <checkboxes.length; i++){
				checkboxes[i].checked = source.checked;
		}
			// checkboxes.forEach(cb => cb.checked = source.checked)
			calculateTotal();
			}
		function setIndividualCheckbox(){
			const checkboxes = document.querySelectorAll('.cartCheckbox');
			const selectAll = document.getElementById('selectAll');

			checkboxes.forEach(cb=>{
				cb.addEventListener('change', () =>{
					if (!cb.checked) {
						selectAll.checked = false;
					}else{
						const allChecked = Array.from(checkboxes).every(box => box.checked);
						selectAll.checked = allChecked;
					}
					calculateTotal();
				});
			});
		}
			
		function updateSubtotal(input){
			const price = parseInt(input.dataset.price);
			const qty = parseInt(input.value);
			const row = input.closest('.cart-row');
			const subtotalCell = row.querySelector('.subtotal');
			const subtotal = qty * price;
			subtotalCell.textContent = subtotal +'원';

			calculateTotal();
		}
		function calculateTotal(){
			const rows = document.querySelectorAll('.cart-row');
			let total = 0;
			rows.forEach(row =>{
				const checkbox = row.querySelector('.cartCheckbox');
				if(checkbox.checked){
					const subtotal = parseInt(row.querySelector('.subtotal').textContent);
					total += subtotal;
				}
			});
			document.getElementById('totalAmount').textContent = total;
		}
	</script>
</head>
<body>
    <h2>장바구니</h2>
	<form method="post" action="/cartAction">
    <table width="500" border="1">
		<tr>
			<td><input type="checkbox" id="selectAll" onclick="toggleAll(this)" checked>전체선택</td>
            <td>주문번호</td>
			<td>상품ID</td>
			<td>상품명</td>
			<td>수량</td>
			<td>가격</td>
			<td>합계</td>
		</tr>
		
		<c:forEach var="dto" items="${items}">
			<tr class="cart-row">
				<td><input type="checkbox" name="selectedIds" value="${dto.id}" class="cartCheckbox" onchange="calculateTotal()" checked></td>
				<td>${dto.id}</td>
				<td>${dto.product_id}</td>
				<td>${dto.product_title}</td>
				<td><input type="number" class="qty" name="cart_quantity_${dto.id}" value="${dto.quantity}" min="1"
					data-price="${dto.price}" onchange="updateSubtotal(this)"></td>
				<td class="price">${dto.price}원</td>
				<td class="subtotal">${dto.price*dto.quantity}원</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="7" >
				총합계:<span id="totalAmount">0</span>원
				<button type="submit" name="submitType" value="order">주문하기</button>
				<button type="submit" name="submitType" value="delete">선택 삭제</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
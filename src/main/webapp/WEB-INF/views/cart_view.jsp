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
				if (!checkboxes[i].disabled) {
					checkboxes[i].checked = source.checked;
					}
		}
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
				// const input = row.querySelector('.qty');
				const subtotalCell = row.querySelector('.subtotal');
				
				if(!checkbox || !checkbox.checked || checkbox.disabled) return;
					const rawText = subtotalCell.textContent ||"";
					const digitsOnly = rawText.replace(/[^\d]/g,'').trim();
					if(digitsOnly === '') return;
					const subtotal = parseInt(digitsOnly);
					// const subtotal = parseInt(row.querySelector('.subtotal').textContent);
					if (!isNaN(subtotal) && subtotal >0) {
						total += subtotal;
					}
			
			});
			const totalEl = document.getElementById('totalAmount')
			if (totalEl) {
				totalEl.textContent = total +'원';
			}
			// document.getElementById('totalAmount').textContent = total+'원';
		}

	</script>
	<style>
		.text-muted{
			color: #999;
		}
		.text-soldOut{
			color: red;
			font-weight: bold;
		}
		.original{
			color: #aaa;
			margin-right: 4px;
		}
		.discount{
			color: blue;
			font-weight: bold;
		}
		.rate{
			color: #444;
			font-size: 0.9em;
			margin-left: 3px;
		}
	</style>
</head>
<body>
    <h2>장바구니</h2>
	<c:choose>
		<c:when test="${empty items}">
			<p style="text-align: center; font-weight: bold;">장바구니가 비어 있습니다.</p>
		</c:when>
		<c:otherwise>
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
			<c:set var="isSoldOut"  value="${dto.stock == 0}"/>
			<!-- <tr class="cart-row> -->
			<tr class="cart-row ${isSoldOut ? 'text-muted' : ''}">
			<!--품절이면 disable-->
				<td><input type="checkbox" name="selectedIds" value="${dto.id}" class="cartCheckbox"></td>
				<td>${dto.id}</td>
				<td>${dto.product_id}</td>
				<td><a href="/content?id=${dto.product_id}">${dto.product_title}</a></td>
				<td><input type="number" class="qty" name="cart_quantity_${dto.id}" value="${dto.quantity}" min="1"
					data-price="${dto.final_price}" onchange="updateSubtotal(this)" ${isSoldOut ? 'disabled' :''}></td>
				<!-- <td class="price">${dto.price}원</td> -->
				<!-- <td class="price">${dto.final_price}원</td> -->
				<td class="price">
					<c:choose>
						<c:when test="${dto.final_price lt dto.price}">
								<span class="original"><del>${dto.price}원</del></span>
								<span class="rate">(${dto.discount_percentage}%)</span>
								<span class="discount">${dto.final_price}원</span>
						</c:when>
						<c:otherwise>
							${dto.price}원
						</c:otherwise>
					</c:choose>
				</td>	
						
				
				<td class="subtotal">
					<c:choose>
						<c:when test="${isSoldOut}">
							<span class="text-soldOut">품절</span>
						</c:when>
						<c:otherwise>
							${dto.final_price*dto.quantity}원
						</c:otherwise>
					</c:choose>
					</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="7" >
				총합계:<span id="totalAmount">0</span>
				<button type="submit" onclick="return validateCartSelection()" name="submitType" value="order">주문하기</button>
				<button type="submit" onclick="return validateCartSelection()" name="submitType" value="delete">선택 삭제</button>
				<button type="button" onclick="submitDeleteSoldOut()">품절 상품 삭제</button>
			</td>
		</tr>
	</table>
</form>
</c:otherwise>

</c:choose>
</body>
<script>
	function submitDeleteSoldOut(){
		const form = document.createElement("form");
		form.method = "post";
		form.action = "deleteSoldOut";
		document.body.appendChild(form);
		form.submit();
	}
	function validateCartSelection() {
		const checkboxes = document.querySelectorAll('.cartCheckbox');
		for(let cb of checkboxes){
			if(cb.checked && !cb.disabled){
			return true;
		}
	}
	alert("선택된 상품이 없습니다.");
	return false;
	}
</script>
</html>
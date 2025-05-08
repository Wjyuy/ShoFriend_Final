<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<!-- * 25.04.08 권준우 최초 작성 -->
<!-- * 25.04.14 김채윤 css -->

</head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function updateInfo(field) {
// 		alert("업데이트 함수 도달: " + field);  // 작동 확인
		const newValue = document.getElementById(field + "_input").value;

		$.ajax({
			type: "post",
			url: "updateCustomerInfo",
			data: {
				field: field,
				value: newValue
			},
			success: function(response) {
				alert("수정 완료!");
				location.reload();
			},
			error: function() {
				alert("수정 실패!");
			}
		});
	}
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                 
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
//                     표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
//                     조합된 참고항목을 해당 필드에 넣는다. //address1 사용안해서 주석처리 04.10
//                     document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<body>
<c:choose>
		    
		    <c:when test="${sessionScope.userType == 'customer'}">
		   <nav class="nav justify-content-end">
		        <a class="nav-link disabled" aria-disabled="true">${sessionScope.loginCustomer.name} 님은 <b>customer</b> 입니다.</a>
   				<a class="nav-link" href="main">홈으로가기</a>
				<a class="nav-link" aria-current="page" href="my_page">마이페이지</a>
				<a class="nav-link" href="friend">친구</a>
<%-- 				<a class="nav-link disabled" aria-disabled="true"><u>${sessionScope.loginCustomer.name} 님 </u></a> --%>
				<a class="nav-link" href="logout">로그아웃</a>
			
			</nav>
		    </c:when>
		  
		    <c:when test="${sessionScope.userType == 'seller'}">
		    <nav class="nav justify-content-end">
		     <a class="nav-link disabled" aria-disabled="true">${sessionScope.loginSeller.name} 님은 <b>seller</b> 입니다.</a>
<!-- 		        <p>당신의 로그인 타입 : <b>seller</b></p> -->
				<a class="nav-link" href="my_page">마이페이지</a>
				<a class="nav-link" href="#">점포관리</a>
				<a class="nav-link" href="product_insert">상품추가</a>
<%-- 				<u>${sessionScope.loginSeller.name} 님 </u> --%>
				<a class="nav-link" href="logout">로그아웃</a>
				</nav>
		    </c:when>
		    <c:otherwise>
		        <p>로그인 상태가 아닙니다.</p>
				<a href="my_page">마이페이지</a>
				<a href="friend">친구</a>
				<a href="login">로그인</a>
		    </c:otherwise>
		   
		</c:choose>
<div class ="container">
<div class ="form-box">
    <h2 class="text-center" style="margin-bottom: 50px; font-weight: bold;">내 정보 확인</h2>

    <c:choose>
        <c:when test="${not empty sessionScope.loginCustomer}">

            <table cellpadding="10">
                <tr>
                    <td>아이디(E-mail)</td>
                    <td colspan="2">${loginCustomer.email}</td>
                </tr>
<!--                 <tr> -->
<!--                     <td>비밀번호</td> -->
<%--                     <td colspan="2">${loginCustomer.password}</td> --%>
<!--                 </tr> -->
                <tr>
                    <td>이름</td>
                    <td>
                   <div class="d-flex mb-3" style="gap: 8px;">
                    <input type="text" class="form-control form-control-sm" id="name_input" value="${loginCustomer.name}">
                  <input type="button" class="btn btn-outline-secondary btn-sm"  value="수정" onclick="updateInfo('name')" >
                  </div>
                  </td>
                  </tr>
             
                <tr>
                    <td>전화번호</td>
                    <td>
                     <div class="d-flex mb-3" style="gap: 8px;">
                    <input type="text" class="form-control form-control-sm" id="phone_input" value="${loginCustomer.phone}">
                    <input type="button"   class="btn btn-outline-secondary btn-sm" value="수정" onclick="updateInfo('phone')" ></td>
                 </div>
                  </td>
                </tr>
                
                <tr>
                    <td>주소</td>
                <td colspan="2" width="80">
				<div class="zip-row">
				<input type="text" name="zipcode"  class="form-control" id="sample6_postcode" value="${store_view.zipcode}">
				<input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-outline-secondary" value="우편번호 찾기"></div>
				<input type="text" name="address"  class="form-control" id="sample6_address" value="${store_view.address}">
				<input type="text" name="address1" class="form-control"  id="sample6_extraAddress" value="${store_view.address1}" >
<!-- 				address1 사용안해서 히든처리 (없으면 팝업창 안뜸) 04.10 -->
				<input type="hidden" name="address2" id="sample6_detailAddress" >
				<td><input type="button" class="btn btn-outline-secondary btn-sm" value="수정" onclick="updateInfo('address')" ></td>
				</td>
                </tr>
            </table>
            
<!--             <form action="main" method="get"> -->
<!-- 			   	 <input type="submit" value="메인으로"> -->
<!-- 			</form> -->
			<div class="text-center" style="margin-top:30px;">
			<button class="btn btn-primary" onclick="location.href='main'">메인으로</button>
			<button class="btn btn-primary" onclick="location.href='my_page'">마이페이지</button>
			<button class="btn btn-primary" onclick="location.href='update_pwd'">비밀번호 변경</button>
			</div>
						<div class="text-end" style="margin-top:40px;">
            
            </div>
            </div>
            </div>
        </c:when>
        <c:otherwise>
        <div class="text-center">
            <p>로그인이 필요합니다.</p>
            <a href="log/login">로그인 페이지로 이동</a>
            </div>
        </c:otherwise>
    </c:choose>


</body>
</html>
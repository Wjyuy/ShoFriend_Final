<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.div_page ul{
			display: flex;
			list-style: none;
		}
	</style>
</head>
<body>
	<table width="500" border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
			<td>히트</td>
		</tr>
<!-- 		조회결과 -->
<!-- 		list : 모델객체에서 보낸 이름 -->
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.boardNo}</td>
				<td>${dto.boardName}</td>
				<td>
<%-- 					${dto.boardTitle} --%>
<!-- 			content_view : 컨트롤러단 호출 -->
					<!-- <a href="content_view?boardNo=${dto.boardNo}">${dto.boardTitle}</a> -->
					<!-- 롤백했을때 페이징 가져가기 처리 하기 -->
					<a class="move_link" href="${dto.boardNo}">${dto.boardTitle}</a>
				</td>
				<td>${dto.boardDate}</td>
				<td>${dto.boardHit}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
			<!-- 			write_view : 컨트롤러단 호출 -->
				<a href="write_view">글작성</a>
			</td>
		</tr>
	</table>
	<form method="get" id="searchForm">
		<select name="type">
			<option value=""<c:out value="${pageMaker.cri.type == null ? 'selected':''}"></c:out>>전체</option>
			<option value="T"<c:out value="${pageMaker.cri.type eq 'T' ? 'selected':''}"></c:out>>제목</option>
			<option value="C"<c:out value="${pageMaker.cri.type eq 'C' ? 'selected':''}"></c:out>>내용</option>
			<option value="W"<c:out value="${pageMaker.cri.type eq 'W' ? 'selected':''}"></c:out>>작성자</option>
			<option value="TC"<c:out value="${pageMaker.cri.type eq 'TC' ? 'selected':''}"></c:out>>제목 or 내용</option>
			<option value="TW"<c:out value="${pageMaker.cri.type eq 'TW' ? 'selected':''}"></c:out>>제목 or 작성자</option>
			<option value="TCW"<c:out value="${pageMaker.cri.type eq 'TCW' ? 'selected':''}"></c:out>>제목 or 내용 or 작성자</option>
		</select>

		<!-- Criteria 이용해서 키워드 값을 넘김  -->
		<input type="text" name="keyword" value="${pageMaker.cri.keyword}">

		<!-- pagemaker 값도 가져간다 -->
		<!-- <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> -->
		<!-- 전체검색중 5ㅠ페이지에서 22 키워드로 검색시 안나올때 처리 -->
		<input type="hidden" name="pageNum" value="1">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">

		<button>Search</button>
		
	</form>

	<!-- <h3>${pageMaker}</h3> -->
	<div class="div_page">
		<ul>
			<c:if test="${pageMaker.prev}">
				<!-- <li>[Previous]</li> -->
				<li class="paginate_button">
					<a href="${pageMaker.startPage -1}">
						[Previous]
					</a>
				</li>
			</c:if>

			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<!-- 삼항조건연산자 걸어서 1일때 색 입히기 -->
				<!-- <li ${pageMaker.cri.pageNum == num ? "style='color: salmon;'":" "}>[${num}]</li> -->
				<li class="paginate_button" ${pageMaker.cri.pageNum == num ? "style='color: salmon;'":" "}>
					<a href="${num}">
						[${num}]
					</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next}">
				<!-- <li>[Next]</li> --> 
				<li class="paginate_button">
					<a href="${pageMaker.endPage +1}">
						[Next]
					</a>
				</li>
			</c:if>
		</ul>
	</div>
	
	<form id="actionForm" action="list" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<!-- 페이징 검색 시 페이지번호를 클릭할때 필요한 파라미터 -->
		<input type="hidden" name="type" value="${pageMaker.cri.type}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	</form>

</body>
</html>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script>
	var actionForm = $("#actionForm");

	//페이지 번호 처리 
	$(".paginate_button a").on("click",function(e){
		e.preventDefault();
		console.log("페이징 클릭입니다 :> href속성=>"+$(this).attr("href"));

		// input 태그 안에 name 속성이 pagenum 인 애를 찾겠다
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));

		// actionForm.submit();
		//버그 처리 :뒤로가기 했을때 페이징 버튼이 contentview가 되는 버그

		actionForm.attr("action","list").submit();
	}); //end of paginate_button click
	
	//게시글처리
	$(".move_link").on("click",function(e){
		e.preventDefault();
		console.log("move_lick click :href =>"+$(this).attr("href"));
		var targetBno=$(this).attr("href");
		
		//버그 처리 : 페이지 클릭 후 뒤로가기 하면 append계속 누적되는 버그 수정 
		var bno =actionForm.find("input[name='boardNo']").val();
		if(bno != ""){
			actionForm.find("input[name='boardNo']").remove();
		}
		actionForm.append("<input type='hidden' name='boardNo' value='"+targetBno+"'>");
		
		// content_view?boardNo=${dto.boardNo} 를 actionForm 으로 처리
		// actionForm.submit(); 
		// content_view로 이동하기 위해서 actionForm에 action 값을 content_view 로 수정했다
		actionForm.attr("action","content_view").submit(); 

	}); //end of move_lick click
	
	var searchForm= $("#searchForm");
	//search버튼 클릭 
	$("#searchForm button").on("click",function(){
		
		// 키워드 입력 받을 조건(전체가 아닌데 검색어 키워드가 없는 경우!)
		if(searchForm.find("option:selected").val() !="" && !searchForm.find("input[name='keyword']").val()){
			alert("검색어를 입력해주세요!");
			return false;
		}

		searchForm.attr("action","list").submit();
	});//end of searchForm click

	// type 콤보박스 변경
	$("#searchForm select").on("change",function(){
		//전체일때
		if(searchForm.find("option:selected").val() ==""){
			// 키워드를 NULL 값으로 변경 
			searchForm.find("input[name='keyword']").val("");
		}
	});//end of searchFomr click


</script>
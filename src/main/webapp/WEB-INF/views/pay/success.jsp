<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 성공</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1 class="mt-5">결제 성공</h1>
        <div class="alert alert-success mt-3">
            <strong>성공!</strong> ${message}
        </div>
        <a href="${pageContext.request.contextPath}/" class="btn btn-primary">홈으로 돌아가기</a>
    </div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cafeCarp 주문페이지</title>
<link href="<c:url value="/resources/css/userDiv.css" />" rel="stylesheet" type="text/css" />
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<div class="container">
	<div class="header-receipe"><span>주문 완료</span></div>
	<div class="main-receipe">
		<span>영수증을 출력하시겠습니까?</span>
	</div>
	<div class="footer-btn-receipe">
		<div class="footer-btn1-receipe"><button onclick="location.href='<c:url value="/kiosk/receipe?type=Y" />'"><span>영수증 출력</span></button></div>
		<div class="footer-btn2-receipe"><button onclick="location.href='<c:url value="/kiosk/receipe?type=N" />'"><span>영수증 미출력</span></button></div>
	</div>
</div>
</body>
</html>
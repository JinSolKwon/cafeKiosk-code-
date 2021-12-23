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
	<div class="header-result"><span>주문 번호</span></div>
	<div class="main-result">
		<span>${sessionScope.orderNum}</span>
	</div>
	<div class="footer-result">
		<img alt="cafeCarp" src="<c:url value="/resources/img/cafeCarp.png" />"><span> 를 이용해주셔서 감사합니다.</span>
	</div>
</div>
<script type="text/javascript">
	function mainMove(){
		window.location.replace('<c:url value="/kiosk/main" />');
	}
	setTimeout(mainMove, 5000);
</script>
</body>
</html>
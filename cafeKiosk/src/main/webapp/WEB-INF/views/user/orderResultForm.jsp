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
<link href="<c:url value="/resources/css/userOrderResult.css" />" rel="stylesheet" type="text/css" />
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<c:set var="length" value="${fn:length(sessionScope.member.getPhone())}" />
<c:set var="phone2" value="${fn:substring(sessionScope.member.getPhone(), length-4, length-2)}" />
<fmt:formatNumber var="point2" pattern="#,###" value="${sessionScope.member.getPoint()}"></fmt:formatNumber>
<div class="container">
<div class="header">
	<div clas="header1"><h1>주문내역 확인</h1></div>
	<div class="header2"><h3>주문내역 확인</h3></div>
</div>
<div class="main">
	<c:forEach items="${menuList}" var="menuOne">
		<div class="main1" onclick="modalOpen(this)">
			<c:if test="${empty menuOne.SAVE_NAME}">
				<div class="main1-image"><img alt="${menuOne.MENU}" src="<c:url value="/display?saveName=noimage.gif" />"></div>		
			</c:if>
			<c:if test="${!empty menuOne.SAVE_NAME}">
				<div class="main1-image"><img alt="${menuOne.MENU}" src="<c:url value="/display?saveName=${menuOne.SAVE_NAME}" />"></div>
			</c:if>
			<div class="main1-txt">
				<div class="main1-name">${menuOne.MENU}</div>
				<div class="main1-price">${menuOne.PRICE}</div>
			</div>
		</div>
	</c:forEach>
</div>
<div class="side">
	<div id="side1">
		<div id="side1-1">${user}</div>
		<div id="side1-2">${point2}P</div>
		<div id="side1-3"><a href="<c:url value="/cafeCarp/main"/>" onclick="mainBack();">메인페이지 이동</a></div>
	</div>
	<div id="side2"></div>
	<div id="side3">
		<button id="canBtn" onclick="history.go(-1);">취 소</button>
		<button id="subBtn" onclick="">결 제</button>
	</div>
</div>
</div>
</body>
</html>
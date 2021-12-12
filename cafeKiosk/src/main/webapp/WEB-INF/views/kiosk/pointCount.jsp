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
<!-- 모달 JQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<!-- toast -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<div class="container2">
<div class="container1">
	<div class="header-pointChange"><span>포인트 변동 내역</span></div>
	<div class="main-pointChange">
			<div class="main-pointChange1">
				<span class="p-intro">보유 포인트</span>
				<span class="p-set">
					<fmt:formatNumber var="point1" value="${sessionScope.member.getPoint()}" pattern="#,###" />
					 <c:set var="pointSet" value="${point1} P" />
					 ${pointSet}
				 </span>
			 </div>
			<div class="main-pointChange1">
				<c:if test="${poType == 'save'}">
					<c:set var="pointWhat" value="적립예정 포인트" />
					<fmt:formatNumber var="pointHow" value="${sessionScope.orderTotal}" pattern="#,###" />
					<c:set var="pointHow2" value="+ ${pointHow} P" />
					<c:set var="pointResult" value="+ ${sessionScope.member.getPoint()+sessionScope.orderTotal} P" />
				</c:if>
				<c:if test="${poType == 'use'}">
					<c:set var="pointWhat" value="사용예정 포인트" />
					<fmt:formatNumber var="pointHow" value="${sessionScope.orderTotal}" pattern="#,###" />
					<c:set var="pointHow2" value="+ ${pointHow} P" />					
					<c:set var="pointResult" value="+ ${sessionScope.orderTotal-sessionScope.member.getPoint()} P" />
				</c:if>
				<span class="p-intro">${pointWhat}</span>
				<span class="p-set">${pointHow2}</span>
			</div>
		</div>
		<hr style="width: 87%; border: 1px solid #E0E0E0;">
	<div class="footer-pointChange">
		<span class="p-intro">포인트</span>
		<span class="p-set">
			<c:set var="calTotal" value="${pointResult}"></c:set>
			<fmt:formatNumber var="reTotal" value="${calTotal}" pattern="#,###" />
			 <c:set var="resultSet" value="${reTotal} P" />
			 ${resultSet}
		 </span>	
	</div>
</div>
<div class="updown"></div>
<c:if test="${sessionScope.member.getPoint() lt sessionScope.orderTotal}">
<div class="container1">
	<div class="header-count"><span>카드를 넣어주세요.</span></div>
	<div class="main-count">
		<div class="main1-count"><span id="countNumber"></span></div>
		<div class="main2-count"><span>초 안에 완료하지 않으실 경우 주문이 취소됩니다.</span></div>
	</div>
	<div class="footer-btn-count">
		<button id="subBtn" onclick="location.href='<c:url value="/cafeCarp/receipe" />'"><fmt:formatNumber var="orTotal" value="${sessionScope.orderTotal}" pattern="#,###" /> ${orTotal} 원 결제</button>
	</div>
</div>
</c:if>
<c:if test="${sessionScope.member.getPoint() ge sessionScope.orderTotal}">
<div class="container1">
	<div class="header-receipe"><span>주문 완료</span></div>
	<div class="main-receipe">
		<span>영수증을 출력하시겠습니까?</span>
	</div>
	<div class="footer-btn-receipe">
		<div class="footer-btn1-receipe"><button onclick="location.href='<c:url value="/cafeCarp/receipe?type=Y" />'"><span>영수증 출력</span></button></div>
		<div class="footer-btn2-receipe"><button onclick="location.href='<c:url value="/cafeCarp/receipe?type=N" />'"><span>영수증 미출력</span></button></div>
	</div>
</div>
</c:if>
</div>
<script type="text/javascript">
	var setCount = 30;
	document.addEventListener("DOMContentLoaded", function countDown(){
		document.getElementById("countNumber").innerHTML = setCount;
		if(setCount === 0){
			location.href="<c:url value="/cafeCarp/main" />";
		}else{
			document.getElementById("countNumber").innerHTML = setCount;
			setTimeout("countDown()", 1000);
			setCount--;
		}
	});
</script>
</body>
</html>
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
<div class="container">
	<div class="header-count"><span>카드를 넣어주세요.</span></div>
	<div class="main-count">
		<div class="main1-count"><span id="countNumber"></span></div>
		<div class="main2-count"><span>초 안에 완료하지 않으실 경우 주문이 취소됩니다.</span></div>
	</div>
	<div class="footer-btn-count">
		<button id="subBtn" onclick="location.href='<c:url value="/cafeCarp/receipe" />'"><fmt:formatNumber var="orTotal" value="${sessionScope.orderTotal}" pattern="#,###" /> ${orTotal} 원 결제</button>
	</div>
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
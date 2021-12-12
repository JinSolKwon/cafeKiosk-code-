<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cafeCarp</title>
<link href="<c:url value="/resources/css/userDiv.css" />" rel="stylesheet" type="text/css" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
var noMem = "<c:out value="${fail}" />";
if(noMem == 'no'){
	swal("존재하지 않는 회원입니다.", "메인페이지로 이동합니다.", "error");
	alert("존재하지 않는 회원입니다.");
}
</script>
</head>
<body>
<div class="container-main">
<div class="header-main">
	<img alt="cafeCarp" src="<c:url value="/resources/img/cafeCarp_main.png" />">
</div>
<div class="main-main">
	<a href="<c:url value="/cafeCarp/login" />"><div class="main-main1"><span>회원<br>주문하기</span></div></a>
	<a href="<c:url value="/cafeCarp/regist" />"><div class="main-main1"><span>회원가입</span></div></a>
	<a href="<c:url value="/cafeCarp/order" />"><div class="main-main1"><span>비회원<br>주문하기</span></div></a>
</div>
<div class="footer-main"><span>* 현금 결제는 카운터에서만 가능합니다. *</span></div>
</div>
</body>
</html>
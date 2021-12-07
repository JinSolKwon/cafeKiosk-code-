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
<link href="<c:url value="/resources/css/userOrder.css" />" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>   
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
var login = "<c:out value="${success}" />";
var user = "<c:out value="${sessionScope.member.getName()}" />";
if(login == 'hello'){
	alert(user + "님 환영합니다.");
}
function mainBack(){
	if(confirm('메인페이지로 이동하시겠습니까? 메인페이지 이동 시 선택된 모든 메뉴가 삭제되며 로그아웃 처리 됩니다.')){
		return true;
	}else{
		return false;
	}
}
</script>
</head>
<body>
<c:set var="length" value="${fn:length(sessionScope.member.getPhone())}" />
<c:set var="phone2" value="${fn:substring(sessionScope.member.getPhone(), length-4, length-2)}" />
<c:set var="user" value="${phone2}**님" />
<fmt:formatNumber var="point2" pattern="#,###" value="${sessionScope.member.getPoint()}"></fmt:formatNumber>
<div class="container">
<div class="header">
	<ul>
	<c:forEach items="${sessionScope.cateList}" var="cateOne">
		<li><a href="<c:url value="/cafeCarp/orderSet/${cateOne.getNum()}" />">${cateOne.getCategory() }</a></li>
	</c:forEach>
	</ul>
</div>
<div class="main">
	<c:forEach items="${menuList}" var="menuOne">
		<a href="">
		<div class="main1">
				<div>image</div>
				<div>${menuOne.getMenu()}</div>
				<div>${menuOne.getPrice()}</div>
		</div>
		</a>
	</c:forEach>
</div>
<div class="side">
	<div id="side1">
		<div id="side1-1">${user}</div>
		<div id="side1-2">${point2}P</div>
		<div id="side1-3"><a href="<c:url value="/cafeCarp/main"/>" onclick="mainBack();">메인페이지 이동</a></div>
	</div>
	<div id="side2"></div>
	<div id="side3"></div>
	<div id="side4"><button id="subBtn" onclick="">결 제 하 기</button></div>
</div>
</div>
</body>
</html>
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
<c:if test="${!empty sessionScope.member}">
	<c:set var="length" value="${fn:length(sessionScope.member.getPhone())}" />
	<c:set var="phone2" value="${fn:substring(sessionScope.member.getPhone(), length-4, length-2)}" />
	<c:set var="user" value="${phone2}**님" />
	<fmt:formatNumber var="point" pattern="#,###" value="${sessionScope.member.getPoint()}"></fmt:formatNumber>
	<c:set var="point2" value="${point}P" />
</c:if>
<div class="container">
<div class="header">
	<div class="header1">
		<h1>주문내역 확인</h1>
	</div>
	<div id="header2">
		<div id="header2-1">${user}</div>
		<div id="header2-2">${point2}</div>
		<div id="header2-3"><button onclick="mainBack();">MAIN<br>Go</button></div>
	</div>
</div>
<hr style="border: black;">
<div class="main">
	<table>
		<tr class="th">
			<td class="th1" colspan="2">메뉴</td><td class="th2">수량</td><td class="th3">가격</td>
		</tr>
		<c:forEach items="${sessionScope.orderList}" var="orderOne" varStatus="status">
			<tr class="tr1">
				<td class="td1">
					<b>${orderOne.getMenu()}</b>
					<span>( ${orderOne.getTemperature()} )</span>
				</td>
				<c:choose>
					<c:when test="${orderOne.getWhipping() eq 'N'}">
						<c:set var="whip" value=" / 휘핑 : 없음" />
					</c:when>
					<c:otherwise>
						<c:set var="whip" value=" / 휘핑 : 있음" />
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${orderOne.getSyrub() == 0}">
						<c:set var="syrubOp" value=" / 시럽 : 없음" />
					</c:when>
					<c:otherwise>
						<c:set var="syrubOp" value=" / 시럽 : ${orderOne.getSyrub()}" />
					</c:otherwise>
				</c:choose>
				<c:choose>				
					<c:when test="${orderOne.getShot() == 0}">
						<c:set var="shotOp" value=" / 샷추가 : 없음" />
					</c:when>
					<c:otherwise>
						<c:set var="shotOp" value=" / 샷추가 : ${orderOne.getShot()}" />
					</c:otherwise>
				</c:choose>
				<td class="td2">사이즈 : ${orderOne.getBeverageSize()}${whip}${syrubOp}${shotOp}</td>
				<td class="td3">1</td>
				<td class="td3">
					<fmt:formatNumber var="orderPrice" pattern="#,###" value="${orderOne.getPrice()}"/>
					${orderPrice}
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
<div class="side">
	<div id="side1">
		<div id="side1-1">
			<div id="side1-2">
				<div id="side1-2-1">총 수량</div>
				<div id="side1-2-2">${sessionScope.orderCount}</div>
			</div>
			<div id="side1-3">
				<div id="side1-3-1">결제 금액</div>
				<div id="side1-3-2">
					<fmt:formatNumber var="orderTotal1" value="${sessionScope.orderTotal}" pattern="#,###"/>
					${orderTotal1} 원
				</div>
			</div>
		</div>
	</div>
	<div id="side2">
		<div id="side2-1"><button onclick="history.go(-1)">취 소</button></div>
		<div id="side2-2">
			<c:if test="${not empty sessionScope.member}">
				<c:set var="nextUrl" value="/cafeCarp/pay?mem=M" />
			</c:if>
			<c:if test="${empty sessionScope.member}">
				<c:set var="nextUrl" value="/cafeCarp/pay?mem=E" />
			</c:if>
			<button id="subBtn" onclick="location.href='<c:url value="${nextUrl}" />'">결 제 </button>
		</div>
	</div>
</div>
</div>
<script type="text/javascript">
function mainBack(){
	if(confirm('메인페이지로 이동하시겠습니까? 메인페이지 이동 시 선택된 모든 메뉴가 삭제되며 로그아웃 처리 됩니다.')){
		location.href="<c:url value="/cafeCarp/main"/>";
		return true;
	}else{
		return false;
	}
}
</script>
</body>
</html>
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
<fmt:formatDate var="receipeDate" pattern="yyyy-MM-dd HH:mm:ss" value="${sessionScope.receipeInfo.ORDER_DATE}"/>

<div class="container3">
	<div class="receipe-print-header">
		<div class="receipe-print-header-2"><span>[주문번호] ${sessionScope.receipeInfo.ORDER_NUM}</span></div>
		<div class="receipe-print-header-1"><span>[매장명] 카페칼프(CAFE CARP)</span></div>
		<div class="receipe-print-header-1"><span>[사업자] 000-00-00000</span></div>
		<div class="receipe-print-header-1"><span>[주  소] 경기도 남양주시 별내면 광전리 </span></div>
		<div class="receipe-print-header-1">
			<span>[대표자] 이화석</span>
			<span>[TEL] 010-0000-0000</span>
		</div>
		<div class="receipe-print-header-1"><span>[매출일] ${receipeDate}</span></div>
	</div>
	<div class="receipe-print-body">
		<table id="table-receptePrint">
			<tr class="th-receptePrint">
				<td class="th-receptePrint1" colspan="3">상&nbsp;&nbsp;&nbsp;&nbsp;품&nbsp;&nbsp;&nbsp;&nbsp;명</td><td class="th-receptePrint3">수량</td><td class="th-receptePrint4">금&nbsp;&nbsp;액</td>
			</tr>
			<c:forEach items="${sessionScope.resultReceipe}" var="receipeOne" varStatus="status">
				<tr class="tr-receptePrint1">
					<td class="td-receptePrint1-1"><span><c:if test="${not empty receipeOne.getTemperature()}">${receipeOne.getTemperature()}</c:if></span></td>
					<td class="td-receptePrint1-2" colspan="2">
						<span>${receipeOne.getMenu()} <c:if test="${not empty receipeOne.getBeverageSize()}">(${receipeOne.getBeverageSize()})</c:if></span>
					</td>
					<td class="td-receptePrint1-3">1</td>
					<td class="td-receptePrint1-4">
						<fmt:formatNumber var="onePrice" pattern="#,###" value="${receipeOne.getPrice()}"/>
						${onePrice}
					</td>
				</tr>
				<c:if test="${receipeOne.getShot() != 0}">
				<tr class="tr-receptePrint1">
					<td class="td-receptePrint2" colspan="5">
						<c:set var="shotOp" value="▶ 샷추가 : ${receipeOne.getShot()}" />
					</td>
				</tr>
				</c:if>
			</c:forEach>
			<tr class="tr-receptePrint2">
				<td class="td-receptePrint3" colspan="4">
					<span>합 계 금 액</span>
				</td>
				<td class="td-receptePrint3">
					<fmt:formatNumber var="receipeTotal" pattern="#,###" value="${sessionScope.receipeInfo.TOTAL}"/>
					${receipeTotal}
				</td>
			</tr>
			<c:if test="${not empty sessionScope.member}">
			<tr class="tr-receptePrint3">
				<td class="td-receptePrint4" colspan="5">
					<span> *** 고객정보 ***</span>
				</td>
			</tr>
			<tr class="tr-receptePrint3">
				<td class="td-receptePrint4-1" colspan="5">
					<c:set var="length" value="${fn:length(sessionScope.member.getPhone())}" />
					<c:set var="phone2" value="${fn:substring(sessionScope.member.getPhone(), length-4, length-2)}" />
					<c:set var="user" value="${phone2}**님" />
					<span>회원명 : ${user}</span>
				</td>
			</tr>
			<c:if test="${sessionScope.receipeInfo.POINT != 0}">
				<tr class="tr-receptePrint3">
					<td class="td-receptePrint4-2" colspan="5">
						<fmt:formatNumber var="usePoint" pattern="#,###" value="${sessionScope.receipeInfo.POINT}" />
						<span>사용 포인트 : ${usePoint}</span>
					</td>
				</tr>
			</c:if>
			<tr class="tr-receptePrint3">
				<td class="td-receptePrint4-3" colspan="5">
					<fmt:formatNumber var="point" pattern="#,###" value="${sessionScope.member.getPoint()}" />
					<span>보유 포인트 : ${point}</span>
				</td>
			</tr>
			</c:if>
		</table>
	</div>
</div>
<script type="text/javascript">
//	function mainMove(){
//		window.location.replace('<c:url value="/kiosk/main" />');
//	}
//	setTimeout(mainMove, 5000);
</script>
</body>
</html>
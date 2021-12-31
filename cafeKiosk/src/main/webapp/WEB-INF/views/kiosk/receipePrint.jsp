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
<fmt:formatDate var="receipeDate" pattern="YYYY-MM-DD hh:mm:ss" value="${sessionScope.resultReceipe.ORDER_DATE}"/>

<div class="container">
	<div class="receipe-print-header">
		<div class="receipe-print-header-1"><span>[주문번호] ${sessionScope.resultReceipe.ORDER_NUM}</span></div>
		<div class="receipe-print-header-1"><span>[매장명] 카페칼프(CAFE CARP)</span></div>
		<div class="receipe-print-header-1"><span>[사업자] 000-00-00000</span></div>
		<div class="receipe-print-header-1"><span>[주  소] 경기도 남양주시 별내면 광전리 </span></div>
		<div class="receipe-print-header-1"><span>[대표자] 이화석</span></div>
		<div class="receipe-print-header-1"><span>[TEL] 010-0000-0000</span></div>
		<div class="receipe-print-header-1"><span>[매출일] ${receipeDate}</span></div>
	</div>
	<div class="receipe-print-body">
		<table id="table-receptePrint">
			<tr class="th-receptePrint">
				<td class="th-receptePrint1" colspan="2">상품명</td><td class="th-receptePrint2">단가</td><td class="th-receptePrint3">수량</td><td class="th-receptePrint4">금액</td>
			</tr>
			<c:forEach items="${sessionScope.resultReceipe}" var="receipeOne" varStatus="status">
				<tr class="tr-orderResult1">
					<td><span>${receipeOne.TEMPERATURE}</span></td>
					<td class="td-orderResult1">
						${receipeOne.MENU}
					</td>
					<td class="td-orderResult2"></td>
					<td class="td-orderResult3">1</td>
					<td class="td-orderResult3">
						<fmt:formatNumber var="orderPrice" pattern="#,###" value="${orderOne.getPrice()}"/>
						${orderPrice}
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td class="" colspan="4">
					<span>합 계 금 액</span>
				</td>
				<td class="">
					<fmt:formatNumber var="receipeTotal" pattern="#,###" value="${sessionScope.resultReceipe.TOTAL}"/>
					${receipeTotal}
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<span> *** 고객정보 ***</span>
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
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
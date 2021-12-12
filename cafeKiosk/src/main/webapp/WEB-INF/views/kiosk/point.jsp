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
	<div class="header-point"><span>포인트 확인</span></div>
	<div class="main-point">
		<div class="main1-point">
			<div class="main1-point1">
				<span class="p-intro">포인트</span>
				<span class="p-set">
					<fmt:formatNumber var="point1" value="${sessionScope.member.getPoint()}" pattern="#,###" />
					 <c:set var="pointSet" value="${point1} P" />
					 ${pointSet}
				 </span>
			 </div>
			<div class="main1-point1">
				<span class="p-intro">결제예정금액</span>
				<span class="p-set">
					<fmt:formatNumber var="orTotal" value="${sessionScope.orderTotal}" pattern="#,###" />
					 <c:set var="totalSet" value="${orTotal} P" />
					 ${totalSet}
				 </span>
			 </div>
		</div>
		<div class="main2-point">
			<p>* 포인트는 <span>3,000 P 이상일 경우에만 사용</span> 가능 합니다. *</p>
			<p>* 포인트 사용 시 <span>전액 사용</span> 되며, 적립은 불가합니다. *</p>
		</div>
	</div>
	<div class="footer-btn-point">
		<div class="footer-btn1-point"><button onclick="location.href='<c:url value="/cafeCarp/pointPay?type=S" />'"><span>적립</span></button></div>
		<div class="footer-btn2-point"><button onclick="location.href='<c:url value="/cafeCarp/pointPay?type=U" />'" disabled="true"><span>사용</span></button></div>
	</div>
</div>
<script type="text/javascript">
var point = "<c:out value="${sessionScope.member.getPoint()}"/>";
console.log(point);
if(point >= 3000){
	$(function(){
		$("#subBtn").attr("disabled", false);
	})
}
</script>
</body>
</html>
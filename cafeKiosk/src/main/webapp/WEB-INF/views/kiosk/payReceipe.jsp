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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
</head>
<body>
<div class="container">
	<div class="header-receipe">
		<span>주문 완료</span>
	</div>
	<div class="main-receipe">
		<span>영수증을 출력하시겠습니까?</span>
	</div>
	<div class="footer-btn-receipe">
		
		<!-- 웹 소켓 수정완료 ${sessionScope.orderNum} : 주문번호 -->
		<input type="hidden" id="message" value="${sessionScope.orderNum}">
		<div class="footer-btn1-receipe">
			<!--  
			<button onclick="location.href='<c:url value="/kiosk/receipe?type=Y" />'">
				<span>영수증 출력</span>
			</button>
			-->
			<button type="button" id="receipeY">
				<span>영수증 출력</span>
			</button>
		</div>
		<div class="footer-btn2-receipe">
			<!-- 
			<button onclick="location.href='<c:url value="/kiosk/receipe?type=N" />'">
				<span>영수증 미출력</span>
			</button>
			 -->
			<button type="button" id="receipeN">
				<span>영수증 미출력</span>
			</button>
		</div>
	</div>
	
</div>
	<script type="text/javascript">
		
		// 웹 소켓 추가 : 영수증 출력, 미출력에 맞춰서 동작
		// 영수증 출력
		$("#receipeY").click(function() {
			sendMessage();
			$('#message').val('');
			location.href='<c:url value="/kiosk/receipe?type=Y" />'
		});
		
		// 영수증 미출력
		$("#receipeN").click(function() {
			sendMessage();
			$('#message').val('');
			location.href='<c:url value="/kiosk/receipe?type=N" />'
		});
		
		// servlet에서 등록된 handler경로
		let sock = new SockJS('<c:url value="/chat" />');

		// 메시지 전송
		function sendMessage() {
			sock.send($("#message").val());
		}
	
	</script>
	


</body>
</html>
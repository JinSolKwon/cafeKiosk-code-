<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>cafeCarp 로그인</title>
</head>
<body>
<form action="<c:url value="/cafeCarp/login" />" method="post">
	<table>
	<thead>
		<tr><td></td></tr>
	</thead>
	<tbody>
		<tr><td><input size="50" type="text" id="phone" name="phone" placeholder="'-'를 제외한 숫자 11자리 입력"/></td></tr>
	</tbody>
	<tfoot>
		<tr><td><button type="submit" id="subBtn" disabled="true">회원 주문하기</button></td></tr>
	</tfoot>
	</table>
</form>
<script type="text/javascript">
$(function(){
	$("#phone").on('input', function(){
		if($("#phone").val()==''){
			$("#subBtn").attr("disabled", true);
		}else{
			$("#subBtn").attr("disabled", false);
		}
	})
})
</script>
</body>
</html>
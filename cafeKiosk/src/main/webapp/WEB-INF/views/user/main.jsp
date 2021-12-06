<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cafeCarp</title>
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
<div>
<div><a href="<c:url value="/cafeCarp/login" />">회원 주문하기</a></div>
<div><a href="<c:url value="/cafeCarp/regist" />">회원가입</a></div>
<div><a href="<c:url value="/cafeCarp/order" />">비회원 주문하기</a></div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index page</title>
</head>
<body>
	<a href="<c:url value="/pos/main" />">관리자</a>
	<a href="<c:url value="/kiosk/main" />">사용자</a>
</body>
</html>
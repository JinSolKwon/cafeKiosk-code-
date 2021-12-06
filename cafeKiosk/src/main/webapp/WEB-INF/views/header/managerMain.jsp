<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="${pageContext.request.contextPath}/resources/css/manager.css"
	rel="stylesheet" type="text/css">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title>회원관리(관리자페이지 홈)</title>
</head>
<body>
	<div class="contain">
		<header class="d-flex flex-wrap">
			<a href="/pos/orderList" id="logo"> 
				<img class="img-concert" src="${pageContext.request.contextPath}/resources/images/logo.png"/>
			</a>
			<span class="mb-3 mb-md-0 me-md-auto fs-3" id="identity">${login.status}</span>

				<ul class="nav nav-pills">
					<li id="menu">
						<button class="btn btn-primary" id="btn" onclick="location.href='<c:url value="#"/>'">
							주문하기
						</button>
					</li>
					<li id="menu">
						<button class="btn btn-primary" id="btn" onclick="location.href='<c:url value="#"/>'">
							관리자페이지
						</button>
					</li>
					<li id="menu">
						<button class="btn btn-primary" id="btn" onclick="location.href='/pos/logout'">
							로그아웃
						</button>
					</li>
				</ul>
		</header>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>
</html>
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

</head>
<body>
	<div class="contain">
		<header class="d-flex flex-wrap">
			<a href="/pos/orderList" id="logo"> <img class="img-concert"
				src="${pageContext.request.contextPath}/resources/images/logo.png" />
			</a> <span class="mb-3 mb-md-0 me-md-auto fs-3" id="identity">${login.status}</span>

			<ul class="nav nav-pills">
				<li id="menu"><button class="btn btn-primary" id="btn"
						onclick="location.href='<c:url value="/pos/logout"/>'">로그아웃</button></li>
			</ul>
		</header>
	</div>
	
	<c:if test="${login.status.equals('master')}">
		<div class="flex-shrink-0 bg-white" id="under" style="width: 280px; height: 850px;">
			<ul class="list-unstyled ps-0" style="margin-top:20px;">
				<li id="topline"></li>
				<li class="mb-1">
					<button class="btn btn-toggle align-items-center rounded collapsed"
						data-bs-toggle="collapse" data-bs-target="#home-collapse"
						aria-expanded="false" style="font-size:x-large;font-weight:bold;">회원관리</button>
					<div class="collapse" id="home-collapse" style="">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="${pageContext.request.contextPath}/managerPage/memberControl" class="link-dark rounded" id="underline">회원 관리</a></li>
							<li><a href="${pageContext.request.contextPath}/managerPage/deleteMemberControl" class="link-dark rounded" id="underline">탈퇴회원 관리</a></li>
						</ul>
					</div>
				</li>
				<li id="topline"></li>
				<li class="mb-1">
					<button class="btn btn-toggle align-items-center rounded collapsed"
						data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
						aria-expanded="false" style="font-size:x-large;font-weight:bold;">매출관리</button>
					<div class="collapse" id="dashboard-collapse" style="">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="${pageContext.request.contextPath}/managerPage/salesToday" class="link-dark rounded" id="underline">당일 매출 확인</a></li>
							<li><a href="${pageContext.request.contextPath}/managerPage/salesPast" class="link-dark rounded" id="underline">이전 매출 확인</a></li>
						</ul>
					</div>
				</li>
				<li id="topline"></li>
				<li class="mb-1">
					<button class="btn btn-toggle align-items-center rounded collapsed"
						data-bs-toggle="collapse" data-bs-target="#menu-collapse"
						aria-expanded="false" style="font-size:x-large;font-weight:bold;">메뉴관리</button>
					<div class="collapse" id="menu-collapse" style="">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="${pageContext.request.contextPath}/managerPage/menuControl" class="link-dark rounded" id="underline">메뉴 관리</a></li>
							<li><a href="${pageContext.request.contextPath}/managerPage/categoryControl" class="link-dark rounded" id="underline">카테고리 관리</a></li>
						</ul>
					</div>
				</li>
				<li id="topline"></li>
				<li class="mb-1">
					<button class="btn" data-bs-toggle="collapse" aria-expanded="false"
					 style="font-size:x-large;font-weight:bold;" onclick="location.href='<c:url value="idControl"/>'">관리자 계정 관리</button>
				</li>
			</ul>
		</div>
	</c:if>
	
	<c:if test="${login.status.equals('admin')}">
		<div class="flex-shrink-0 bg-white" id="under" style="width: 280px; height: 850px;">
			<ul class="list-unstyled ps-0" style="margin-top:20px;">
				<li id="topline"></li>
				<li class="mb-1">
					<button class="btn btn-toggle align-items-center rounded collapsed"
						data-bs-toggle="collapse" data-bs-target="#home-collapse"
						aria-expanded="false" style="font-size:x-large;font-weight:bold;">회원관리</button>
					<div class="collapse" id="home-collapse" style="">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="${pageContext.request.contextPath}/managerPage/memberControl" class="link-dark rounded" id="underline">회원관리</a></li>
							<li><a href="${pageContext.request.contextPath}/managerPage/deleteMemberControl" class="link-dark rounded" id="underline">탈퇴 회원관리</a></li>
						</ul>
					</div>
				</li>
				<li id="topline"></li>
				<li class="mb-1">
					<button class="btn btn-toggle align-items-center rounded collapsed"
						data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
						aria-expanded="false" style="font-size:x-large;font-weight:bold;">매출관리</button>
					<div class="collapse" id="dashboard-collapse" style="">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="${pageContext.request.contextPath}/managerPage/salesToday" class="link-dark rounded" id="underline">당일 매출 확인</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</c:if>
	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->

</body>
</html>
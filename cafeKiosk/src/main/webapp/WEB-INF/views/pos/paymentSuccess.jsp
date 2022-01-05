<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">


<title>결제완료</title>
</head>
<body>
	<div class="container shadow-lg my-5 border" style="width: 370px;">
		<div class="row text-center my-2">
			<div>
			<img src="/resources/images/cafeCarpTitle.png" class="rounded mx-auto d-block my-3" alt="" style="width:250px;">
			</div>
		</div>
		<div class="row fs-3 text-center my-3">
			<b>결제에 성공했습니다.</b>
		</div>
		<div class="row text-center justify-content-end">
			<div class="col-6 my-3 text-center">
			<!-- 영수증 출력만 서비스갔다오기 -->
				<button class="btn btn-outline-secondary" onclick="location.href='/pos/menuOrder/receipe?type=Y'" style="width: 150px;">영수증출력</button>
			</div>
			<div class="col-6 my-3 text-center">
				<button class="btn btn-outline-secondary" onclick="location.href='/pos/menuOrder/receipe?type=N'" style="width: 150px;">영수증미출력</button>
			</div>
		</div>
				
	</div>

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
	</script>
	
</body>
</html>
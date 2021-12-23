<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<title>에러페이지</title>
</head>
<body>

	<div class="container shadow-lg my-5 border" style="width: 370px;">
		<div class="col-12 center">
			<img src="../resources/images/cafeCarpTitle.png" class="rounded mx-auto d-block my-3" alt="" style="width:250px;">
		</div>
			
		<div class="mb-3 row">
			<div class="col text-center fs-3">
				<c:out value="${errorCode }"/>
			</div>
		</div>
		<div class="mb-3 row">
 			<div class="col text-center fs-3">
				에러가 발생하였습니다
			</div>
		</div>
		<div class="d-grid gap-2 col-12">
			<input type="button" onclick="location.href='/pos/main'" class="btn text-white my-2" style="background-color:gray;" value="돌아가기">
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
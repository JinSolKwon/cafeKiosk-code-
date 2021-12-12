<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title>주문내역확인</title>
</head>
<body>

	<div class="container border">
		<div class="row justify-content-md-center">
			<button type="button" class="btn btn-outline-secondary my-2" style="width:100px;" onclick="location.href='/pos/menuOrder/pointCheck'">포인트</button>&nbsp;
			<button type="button" class="btn btn-outline-secondary my-2" style="width:100px;" onclick="location.href='#'">카드</button>&nbsp;
			<button type="button" class="btn btn-outline-secondary my-2" style="width:100px;" onclick="location.href='#'">현금</button>&nbsp;
			<button type="button" class="btn btn-outline-secondary my-2" style="width:100px;" onclick="location.href='/pos/menuOrder'">돌아가기</button>&nbsp;
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
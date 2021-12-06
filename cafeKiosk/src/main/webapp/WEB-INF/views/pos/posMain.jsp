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


<title>관리자 로그인</title>
</head>
<body>
	<div class="container shadow-lg my-5 border" style="width: 370px;">
		<div class="col-12 center">
			<img src="../resources/img/cafeCarpTitle.png" class="rounded mx-auto d-block my-3" alt="" style="width:250px;">
		</div>
		
		<form method="post" class="center" name="loginFrm">
			<div class="mb-3 row">
				<div class="col">
					<input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요">
				</div>
			</div>
			<div class="mb-3 row">
	 			<div class="col">
					<input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력하세요">
				</div>
			</div>
			<div class="d-grid gap-2 col-12">
				<input type="button" onclick="checklogin()" class="btn text-white my-2" style="background-color:gray;" value="로그인">
			</div>
			<c:if test="${msg == false}">
				<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
			</c:if>
		</form>
	</div>

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
	</script>
	
	<script type="text/javascript">
		function checklogin(){
			var form = document.loginFrm;
			
			// 아이디의 값이 입력되지 않았을 경우
			if(form.id.value == "") {
				alert('아이디를 입력해주세요');
				form.id.focus();
				return false;
			} else if(form.pw.value == ""){
				alert('비밀번호를 입력해주세요');
				form.pw.focus();
				return false;
			}
			form.submit();
		}
	
	</script>
	
</body>
</html>
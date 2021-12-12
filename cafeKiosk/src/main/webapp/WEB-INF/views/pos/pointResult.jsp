<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
<title>회원조회결과</title>
</head>
<body>
	
	<div class="container shadow-lg my-5 border" style="width:500px; height:300px;">
		
		<div class="row text-center my-4 fs-3">
			<b>조회결과</b>
		</div>
		
		<div class="row">
			<c:choose>
				<c:when test="${memberPointCheck ne null }">
					<div class="text-start">
						<table class="table table-borderless fs-5" style="width: 300px; margin-left: auto; margin-right: auto;">
							<tr>
								<th>이름</th>
								<td>${memberPointCheck.name }</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>${memberPointCheck.phone }</td>
							</tr>
							<tr>
								<th>보유포인트</th>
								<td><fmt:formatNumber value="${memberPointCheck.point }" pattern="#,###"/>P</td>
							</tr>
						</table>
					</div>
				</c:when>
				<c:otherwise>
					<div class="text-center fs-1">
						<b>등록된 회원정보가 없습니다</b>			
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div class="row justify-content-end">
			<div class="col-3">
				<button type="button" id="back" class="btn btn-light border" style="width:100px;">이전</button>
			</div>
			<div class="col-3">
				<button type="button" id="pointSave" class="btn text-white btn-secondary" style="width:100px;">적립하기</button>
			</div>
			<div class="col-3">
				<button type="button" id="pointUse" class="btn text-white btn-secondary" style="width:100px;">사용하기</button>
			</div>
		</div>
		
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
	</script>
	
	<script type="text/javascript">
		
		document.getElementById("back").addEventListener("click", back);
		
		function back(){
			location.href="/pos/menuOrder";
		}
		
		document.getElementById("pointSave").addEventListener("click", pointSave);
		
		function pointSave(){
			location.href="/pos/menuOrder/pointSave";
		}
		
		document.getElementById("pointUse").addEventListener("click", pointUse);
		
		function pointUse(){
			location.href="/pos/menuOrder/pointUse";
		}
	
	</script>
	
	
</body>
</html>
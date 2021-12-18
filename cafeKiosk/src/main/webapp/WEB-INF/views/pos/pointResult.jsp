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
	
	<c:if test="${pointUseCheck eq false }">
		<script>
			alert("보유 포인트가 3,000포인트 이상이어야 합니다.");
		</script>
	</c:if>
	
	<div class="container shadow-lg my-5 border" style="width:470px; height:400px;">
		
		<div class="row text-center my-4 fs-3">
			<b>조회결과</b>
		</div>
		
		<div class="row my-4 text-center" style="height: 130px;">
			<c:choose>
				<c:when test="${memberInfo ne null }">
					<table class="table table-borderless fs-5" style="width: 300px; margin-left: auto; margin-right: auto;">
						<tr>
							<th>이름</th>
							<td>${memberInfo.name }</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${memberInfo.phone }</td>
						</tr>
						<tr>
							<th>보유포인트</th>
							<td><fmt:formatNumber value="${memberInfo.point }" pattern="#,###"/>P</td>
						</tr>
					</table>
						<div class="col-12 my-1">
							<button type="button" id="pointSave" class="btn text-white btn-secondary" style="width:300px;">적립하기</button>
						</div>
						<div class="col-12 my-1">
							<button type="button" id="pointUse" class="btn text-white btn-secondary" style="width:300px;">사용하기</button>
						</div>
						<div class="col-12 my-1">
							<button type="button" id="back" class="btn btn-light border" style="width: 300px;">돌아가기</button>
						</div>
				</c:when>
				<c:otherwise>
					<div class="fs-2 my-4">
						<b>등록된 회원정보가 없습니다</b>
					</div>
					<div class="row my-3 justify-content-end">
						<div class="col-3">
							<button type="button" class="btn text-white btn-secondary" style="width:100px;" disabled>적립하기</button>
						</div>
						<div class="col-3">
							<button type="button" class="btn text-white btn-secondary" style="width:100px;" disabled>사용하기</button>
						</div>
						<div class="col-3">
							<button type="button" id="back" class="btn btn-light border" style="width:100px;">돌아가기</button>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
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
			location.href="/pos/menuOrder/details";
		}
		
		document.getElementById("pointSave").addEventListener("click", pointSave);
		
		function pointSave(){
			location.href="/pos/menuOrder/pointSave";
		}
		
		document.getElementById("pointUse").addEventListener("click", pointUse);
		
		function pointUse(){
			var memberPoint = "${memberInfo.point }";
			
			if(memberPoint - 3000 >= 0){
				location.href="/pos/menuOrder/pointUse";
			} else {
				alert("보유 포인트가 3,000포인트 이상이어야 합니다.");
				return false;
			}
		}
	
	</script>
	
	
</body>
</html>
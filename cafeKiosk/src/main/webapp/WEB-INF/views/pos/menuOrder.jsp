<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<!-- 추가 css -->
<link href="<c:url value="/resources/css/userOrderResult.css" />" rel="stylesheet" type="text/css" />	
	
<title>메뉴 주문하기</title>
</head>
<body>
	<jsp:include page="../${pageContext.request.contextPath}/header/managerOrder.jsp" flush="false" />
	
	<div class="container border my-2">
		<div class="row border">
			<div class="col-3">
				<div class="row scroll-1" style="overflow:auto; width:auto; height:500px;" >
					주문한 상품 내역 : 스크롤 설정까지 완료<br>
					포인트 사용 혹은 적립 후 세션에 담아져있는 내용 확인해서 보여주기 추가해야됨<br>
				</div>
				<div class="row">
					<div class="col">수량 : </div>
					<div class="col">금액 : </div>
				</div>
			</div>
			<div class="col-9 border">
				<div class="row border">
					카테고리 영역 : 페이징처리로 넘어가는거 해야됨 => 스크립트 써서 해보기
				</div>
				<div class="row border" style="overflow:auto; width:auto; height:auto;">
					저장된 메뉴 조회 및 선택 영역 : 높이 설정, 스크롤 설정 필요
				</div>
				<div class="row border">
					<div class="col">
							<button type="button" class="btn btn-dark text-white my-1" style="width:140px;" onclick="location.href='#'">M</button>
							<button type="button" class="btn btn-dark text-white my-1" style="width:140px;" onclick="location.href='#'">L(+500)</button>
							<button type="button" class="btn btn-dark text-white my-1" style="width:140px;" onclick="location.href='#'">ML(+500)</button>
							<button type="button" class="btn btn-primary text-white my-1" style="width:140px;" onclick="location.href='#'">ICE</button>
							<button type="button" class="btn btn-primary text-white my-1" style="width:140px;" onclick="location.href='#'">HOT</button>
							<button type="button" class="btn btn-secondary text-white my-1" style="width:140px;" onclick="location.href='#'">샷추가(+500)</button>
							<button type="button" class="btn btn-secondary text-white my-1" style="width:140px;" onclick="location.href='#'">휘핑추가(+500)</button>
							<button type="button" class="btn btn-secondary text-white my-1" style="width:140px;" onclick="location.href='#'">시럽추가(+500)</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row border align-items-center">
			<div class="col-3 border">포인트 변동</div>
			<div class="col-3 border">결제금액</div>
			<div class="col-6 border text-center">
				<button type="button" class="btn btn-outline-secondary my-2" style="width:100px;" onclick="location.href='/pos/menuOrder/pointCheck'">포인트</button>&nbsp;
				<button type="button" class="btn btn-outline-secondary my-2" style="width:100px;" onclick="location.href='#'">카드</button>&nbsp;
				<button type="button" class="btn btn-outline-secondary my-2" style="width:100px;" onclick="location.href='#'">현금</button>&nbsp;
				<button type="button" class="btn btn-outline-secondary my-2" style="width:100px;" onclick="location.href='#'">취소</button>
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
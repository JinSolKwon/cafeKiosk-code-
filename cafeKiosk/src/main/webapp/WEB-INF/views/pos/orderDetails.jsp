<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	<div class="container my-1" style="width: 1100px;">
		<div class="row my-4 fs-2 justify-content-md-center">
			주문내역 확인
		</div>
		<div class="fs-5 border-bottom border-dark" style="overflow: auto; margin-left: auto; margin-right: auto; height: 500px; width: 1000px;">
			<table class="table text-center scroll-1">
				<thead>
					<tr>
						<th>주문번호</th>
						<th>메뉴명</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${menuOrderList}" varStatus="status" var="menuOrderList">
						<tr>
							<td>${orderNum}</td>
							<td>${menuOrderList.menu }</td>
							<td><fmt:formatNumber pattern="#,###" value="${menuOrderList.price }"/>원</td>
						</tr>			
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="row my-3 justify-content-center">
			<div class="col-4 fs-3 text-center">주문수량  ${paymentInfo["totalCnt"]}</div>
			<div class="col-4 fs-3 text-center">주문금액  
					<fmt:formatNumber value='${paymentInfo["totalPrice"]}' pattern="#,###"/>원
			</div>
			
		</div>
		
		<div class="row justify-content-center my-3">
			<div class="col-2 text-center">
				<button type="button" class="btn btn-outline-secondary my-2 btn-lg" style="width:120px;" onclick="location.href='/pos/menuOrder/pointCheck'">포인트</button>&nbsp;
			</div>
			<div class="col-2 text-center">
				<button type="button" class="btn btn-outline-info my-2 btn-lg" style="width:120px;" onclick="location.href='#'">카드</button>&nbsp;
			</div>
			<div class="col-2 text-center">
				<button type="button" class="btn btn-outline-info my-2 btn-lg" style="width:120px;" onclick="location.href='#'">현금</button>&nbsp;
			</div>
			<div class="col-2 text-center">
				<button type="button" class="btn btn-outline-danger my-2 btn-lg" style="width:120px;" onclick="location.href='/pos/menuOrder'">돌아가기</button>&nbsp;
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
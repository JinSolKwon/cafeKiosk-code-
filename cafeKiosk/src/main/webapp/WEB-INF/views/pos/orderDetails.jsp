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
		<div class="row">
			<div class="col-5">
				<div class="fs-5 border-bottom border-dark" style="overflow: auto; margin-left: auto; margin-right: auto; height: 500px; width: auto;">
					<table class="table text-center scroll-1">
						<thead class="fs-3">
							<tr>
								<td>주문번호</td>
								<td>메뉴명</td>
								<td>가격</td>
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
			</div>
			<div class="col-7">
				<div class="row my-3 justify-content-center border-bottom">
					<div class="col fs-3 text-center">주문수량  ${paymentInfo["orderCnt"]}</div>
					<div class="col fs-3 text-center">주문금액  
							<fmt:formatNumber value='${paymentInfo["orderPrice"]}' pattern="#,###"/>원
					</div>
				</div>
				<div class="row my-4 justify-content-center">
					<c:choose>
						<c:when test="${pointInfo eq null }">
							<div class="fs-4 text-center">
								포인트 사용내역이 없습니다.
							</div>
						</c:when>
						<c:otherwise>
							<table class="table text-center">
								<thead class="fs-4">
									<tr>
										<th colspan="2">포인트 사용 내역</th>
									</tr>	
								</thead>
								<tbody>
									<tr>
										<th>기존 포인트</th>
										<td>
											<fmt:formatNumber value="${memberInfo.point }" pattern="#,###"/>P
										</td>
									</tr>
									<c:set value="${pointInfo['pointType'] }" var="pointType" />
									<c:if test="${pointType eq 0 }">
										<tr>
											<th>
												적립 포인트<br>
											</th>
											<td>
												<fmt:formatNumber value="${pointInfo['changePoint']}" pattern="#,###"/>P
											</td>
										</tr>
										<tr>
											<th>적립 후 포인트</th>
											<td>
												<fmt:formatNumber value="${pointInfo['totalPoint']}" pattern="#,###"/>P
											</td>
										</tr>
									</c:if>
									<c:if test="${pointType eq 1 }">
										<tr>
											<th>
												사용 포인트<br>
											</th>
											<td>
												<fmt:formatNumber value="${pointInfo['changePoint']}" pattern="#,###"/>P
											</td>
										</tr>
										<tr>
											<th>사용 후 포인트</th>
											<td>
												<fmt:formatNumber value="${pointInfo['totalPoint']}" pattern="#,###"/>P
											</td>
										</tr>
									</c:if>	
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="row fs-2 my-4 justify-content-around">
					<div class="col-5 text-center">
						<b>총 결제 금액</b>
					</div>
					<div class="col-5 text-center">
						<c:choose>
							<c:when test="${pointInfo eq null}">
								<c:set value="${paymentInfo['orderPrice']}" var="price" />
								<fmt:formatNumber value="${price }" pattern="#,###"/>원
							</c:when>
							<c:otherwise>
								<c:set value="${pointInfo['totalPrice']}" var="price" />
								<fmt:formatNumber value="${price }" pattern="#,###"/>원
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>		
		</div>
		
		<div class="row justify-content-center my-3">
			<div class="col-3 text-center">
				<button type="button" class="btn btn-outline-secondary my-2 btn-lg" style="width:225px;" onclick="location.href='/pos/menuOrder/pointCheck'">포인트</button>&nbsp;
			</div>
			<div class="col-3 text-center">
				<button type="button" class="btn btn-outline-info my-2 btn-lg" style="width:225px;" onclick="location.href='#'">카드</button>&nbsp;
			</div>
			<div class="col-3 text-center">
				<button type="button" class="btn btn-outline-info my-2 btn-lg" style="width:225px;" onclick="location.href='#'">현금</button>&nbsp;
			</div>
			<div class="col-3 text-center">
				<button type="button" class="btn btn-outline-danger my-2 btn-lg" style="width:225px;" onclick="location.href='/pos/menuOrder'">돌아가기</button>&nbsp;
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
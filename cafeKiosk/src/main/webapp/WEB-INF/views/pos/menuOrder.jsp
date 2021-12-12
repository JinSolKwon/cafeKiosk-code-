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

<!-- 추가 css -->
<link href="<c:url value="/resources/css/userOrderResult.css" />"
	rel="stylesheet" type="text/css" />

<title>메뉴 주문하기</title>
</head>
<body>
	<jsp:include
		page="../${pageContext.request.contextPath}/header/managerOrder.jsp"
		flush="false" />

	<div class="container my-4">
		<div class="row border-bottom">
			<div class="col-3 bg-secondary bg-opacity-10 scroll-1 my-1" style="overflow: auto; width: 200px; height: 550px;">
				<c:forEach items="${menuOrderList }" var="menuOrderList"  varStatus="status">
					<div class="row my-2 bg-light text-dark" style="width:180px; height:80px; position: relative; float: none; margin:0 auto;">
						<div class="col-9 fs-6 align-self-center">
							<b>
							${menuOrderList.menu }<br>
							<fmt:formatNumber pattern="#,###" value="${menuOrderList.price }"/>원
							</b>
						</div>
						<div class="col-3">
							<button type="button" class="btn-close my-2" aria-label="Close" 
								onclick="location.href='/pos/menuOrder/cancel?index=${status.index}&type=single'">
							</button>
						</div>
						
					</div>
				</c:forEach>
			</div>
			<div class="col-9" style="float: none; margin:0 auto;">
				<div class="row scroll-2 my-1">
					<div class="col" style="height: auto;">
						<c:if test="${categoryList ne null }">
							<c:forEach items="${categoryList}" var="categoryList">
								<c:choose>
									<c:when test="${categoryNum eq categoryList.num }">
										<button
											onclick="location.href='/pos/menuOrder?categoryNum=${categoryList.num}'"
											class="btn btn-info text-white my-1"
											style="width: 150px;">${categoryList.category }</button>
									</c:when>
									<c:otherwise>
										<button
											onclick="location.href='/pos/menuOrder?categoryNum=${categoryList.num}'"
											class="btn btn-outline-info text-dark my-1"
											style="width: 150px;">${categoryList.category }</button>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<div class="row scroll-1"
					style="overflow: auto; width: auto; height: 380px;">
					<div>
						<c:choose>
							<c:when test="${menuList ne null }">
								<c:forEach items="${menuList}" var="menuList">
									<button class="btn btn-outline-dark my-3" 
										style="width: 150px; height: 80px;"
										onclick="location.href='/pos/menuOrder/order?menu=${menuList.menu }&price=${menuList.price}'">
										${menuList.menu }<br> 
										<fmt:formatNumber value="${menuList.price }" pattern="#,###"/>원
									</button>
								</c:forEach>
							</c:when>
						</c:choose>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<c:forEach items="${optionList}" var="optionList">
							<button class="btn btn-outline-secondary my-1" 
								style="width: 150px;"
								onclick="location.href='/pos/menuOrder/order?menu=${optionList.optionName }&price=${optionList.price}'">
								${optionList.optionName }(+${optionList.price })
							</button>
							</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row align-items-center">
			<div class="col-3 fs-3">주문수량  ${paymentInfo["totalCnt"]}</div>
			<div class="col-3 fs-3">주문금액  
				<c:if test='${paymentInfo["totalPrice"] ne null }'>
					<fmt:formatNumber value='${paymentInfo["totalPrice"]}' pattern="#,###"/>원
				</c:if>
			</div>
			<c:choose>
				<c:when test="${paymentInfo['totalCnt'] > 0 }">
					<div class="col-3 text-end">
						<button class="btn btn-outline-primary my-2" style="width: 180px;"
							onclick="location.href='/pos/menuOrder/details'">결제하기</button>
					</div>
					<div class="col-3 text-center">
						<button class="btn btn-outline-danger my-2" style="width: 180px;"
							onclick="cancelAll()">취소하기</button>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-3 text-end">
						<button class="btn btn-outline-primary my-2" style="width: 180px;"
							onclick="location.href='/pos/menuOrder/details'" disabled>결제하기</button>
					</div>
					<div class="col-3 text-center">
						<button class="btn btn-outline-danger my-2" style="width: 180px;"
							onclick="cancelAll()" disabled>취소하기</button>
					</div>
				</c:otherwise>					
			</c:choose>
		</div>
	</div>



	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
	</script>
	
	<script type="text/javascript">
		
		function cancelAll() {
			if(confirm("주문을 취소하시겠습니까?")){
				location.href="/pos/menuOrder/cancel?type=all";
			}
		}
	
	</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역확인</title>
</head>
<body>
	<jsp:include page="../${pageContext.request.contextPath}/header/managerMain.jsp" flush="false" />
	
		<c:if test="${providedResult eq false }">
			<script>
				alert("프로그램 오류!!\n메뉴제공 수정을 실패하였습니다!!");
			</script>
		</c:if>
		<c:if test="${providedResult eq true }">
			<script>
				alert("메뉴제공을 완료하였습니다!!")
			</script>
		</c:if>
		<c:if test="${payRefundResult eq false or insertRefundResult eq false}">
			<script>
				alert("프로그램 오류!!\환불작업을 실패하였습니다!!");
			</script>
		</c:if>
		<c:if test="${payRefundResult eq true and insertRefundResult eq true}">
			<script>
				alert("환불처리를 완료했습니다.")
			</script>
		</c:if>
	
	<div class="container my-3">
		<p><h3><b>주문내용</b></h3></p>
		<div class="table-responsive">
			<table class="table align-middle">
				<thead>
					<tr class="text-center">
						<th>주문번호</th>
						<th>주문메뉴</th>
						<th>사이즈</th>
						<th>샷추가</th>
						<th>시럽</th>
						<th>휘핑</th>
						<th>상태</th>
					</tr>
				</thead>
				<c:if test="${notProvidedOrder eq null}">
					<tr>
						<th colspan="7" class="text-center">
							<p><br>모든 주문이 완료되었습니다.</p>
						</th>
					</tr>
				</c:if>
				<c:if test="${notProvidedOrder ne null }">
					<tbody>
						<c:forEach items="${notProvidedOrder}" var="notProvidedOrder">
							<tr class="text-center" height="55">
								<td>${notProvidedOrder.orderNum}</td>
								<c:choose>
									<c:when test="${notProvidedOrder.temperature eq null}">
										<td>${notProvidedOrder.menu}</td>
									</c:when>								
									<c:otherwise>
										<td>(${notProvidedOrder.temperature})${notProvidedOrder.menu}</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${notProvidedOrder.beverageSize eq null}">
										<td>-</td>
									</c:when>								
									<c:otherwise>
										<td>${notProvidedOrder.beverageSize}</td>
									</c:otherwise>								
								</c:choose>
								<c:choose>
									<c:when test="${notProvidedOrder.shot eq 0}">
										<td>-</td>
									</c:when>								
									<c:otherwise>
										<td>${notProvidedOrder.shot}</td>
									</c:otherwise>								
								</c:choose>
								<c:choose>
									<c:when test="${notProvidedOrder.syrub eq 0}">
										<td>-</td>
									</c:when>								
									<c:otherwise>
										<td>${notProvidedOrder.syrub}</td>
									</c:otherwise>								
								</c:choose>
								<c:choose>
									<c:when test="${notProvidedOrder.whipping eq null}">
										<td>-</td>
									</c:when>								
									<c:otherwise>
										<td>${notProvidedOrder.whipping}</td>
									</c:otherwise>								
								</c:choose>
								<c:choose>
									<c:when test="${orderNum ne null and orderNum eq notProvidedOrder.orderNum}">
										<td></td>									
									</c:when>
									<c:otherwise>
										<td>
											<button onclick="location.href='/pos/orderList/provided?orderNum=${notProvidedOrder.orderNum}'" class="btn btn-secondary px-3">주문완료</button> &nbsp;
											<button onclick="location.href='/pos/orderList/refund?orderNum=${notProvidedOrder.orderNum}'" class="btn btn-light px-3">주문취소</button>
										</td>
									</c:otherwise>
								</c:choose>
								<c:set var="orderNum" value="${notProvidedOrder.orderNum }" />
							</tr>	
						</c:forEach>
					</tbody>
				</c:if>
			</table>
		</div>
	</div>

</body>
</html>
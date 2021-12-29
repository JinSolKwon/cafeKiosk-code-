<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
 	<!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<title>당일 매출 확인</title>
</head>
<body>
	<%@ include file="../include/manageMenu.jsp"%>
	<div id="manageMain">
		<h1 style="font-weight:bold;">당일 매출 확인</h1>
		
		<p style="margin-left:85%;font-weight:bold;font-size:large;">
			매출일자: ${today}
		</p>
		<div>
		<table class="table" style="margin-bottom:0px;"> 
			<thead>
				<tr class="table-secondary">
					<th style="width:7%">주문번호</th>
					<th style="width:10%">메뉴명</th>
					<th style="width:7%">사이즈</th>
					<th style="width:7%">샷</th>
					<th style="width:7%">시럽</th>
					<th style="width:7%">휘핑</th>
					<th style="width:10%">적립금</th>
					<th style="width:10%">카드</th>
					<th style="width:10%">현금</th>
					<th style="width:10%">총액</th>
					<th style="width:10%">확인</th>
				</tr>
			</thead>
			<c:if test="${orderList eq null}">
				<tr>
					<th colspan="11" class="text-center">
						<p><br>주문이 없습니다.</p>
					</th>
				</tr>
			</c:if>
		</table>
		</div>
		<div style="max-height:550px;overflow-y:scroll;overflow-x:hidden;margin-top:0px;">
		<table class="table table-hover" style="margin-top:0px;">
			<c:if test="${orderList ne null}">
			<tbody>
				<c:forEach items="${orderList}" var="orderList">
					<c:if test="${orderNum ne orderList.orderNum}">
						<tr id="divide">
							<td style="width:7%">${orderList.orderNum}</td>
							<td style="width:10%">-</td>
							<td style="width:7%">-</td>
							<td style="width:7%">-</td>
							<td style="width:7%">-</td>
							<td style="width:7%">-</td>
							<td style="width:10%"><fmt:formatNumber value="${orderList.point}" pattern="#,###,###"/></td>
							<td style="width:10%"><fmt:formatNumber value="${orderList.card}" pattern="#,###,###"/></td>
							<td style="width:10%"><fmt:formatNumber value="${orderList.cash}" pattern="#,###,###"/></td>
							<td style="width:10%"><fmt:formatNumber value="${orderList.total}" pattern="#,###,###"/></td>
							<c:choose>
							<c:when test="${orderList.refund eq 'Y'}">
								<td style="width:10%">환불완료</td>
							</c:when>
							<c:otherwise>
								<td style="width:10%"><button class="btn btn-secondary" onClick="window.location='<c:url value="/pos/orderList/refund?orderNum=${orderList.orderNum}"/>'">환불</button></td>									
							</c:otherwise>
							</c:choose>
						</tr>
						<c:choose>
						<c:when test="${orderNum ne null}">
							<tr>
								<td>${orderList.orderNum}</td>
								<td>(${orderList.temperature})${orderList.menu}</td>
								<td>${orderList.beverageSize}</td>
								<c:choose>   
									<c:when test="${orderList.shot eq 0}">
									<td>-</td>
									</c:when>
									<c:otherwise>
									<td>${orderList.shot}</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${orderList.syrub eq 0}">
									<td>-</td>
									</c:when>
									<c:otherwise>
									<td>${orderList.syrub}</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${orderList.whipping eq 'N'}">
									<td>-</td>
									</c:when>
									<c:otherwise>
									<td>${orderList.whipping}</td>
									</c:otherwise>
								</c:choose>
								<td>-</td>
								<td>-</td>
								<td>-</td>
								<td><fmt:formatNumber value="${orderList.price}" pattern="#,###,###"/></td>
								<td></td>
							</tr>
						</c:when>
						<c:otherwise></c:otherwise>						
						</c:choose>
					</c:if>
					<c:if test="${orderNum eq null or orderNum eq orderList.orderNum}">
						<tr>
							<td>${orderList.orderNum}</td>
							<td>(${orderList.temperature})${orderList.menu}</td>
							<td>${orderList.beverageSize}</td>
							<c:choose>   
								<c:when test="${orderList.shot eq 0}">
								<td>-</td>
								</c:when>
								<c:otherwise>
								<td>${orderList.shot}</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${orderList.syrub eq 0}">
								<td>-</td>
								</c:when>
								<c:otherwise>
								<td>${orderList.syrub}</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${orderList.whipping eq 'N'}">
								<td>-</td>
								</c:when>
								<c:otherwise>
								<td>${orderList.whipping}</td>
								</c:otherwise>
							</c:choose>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td><fmt:formatNumber value="${orderList.price}" pattern="#,###,###"/></td>
							<td></td>
						</tr>
					</c:if>
					<c:set var="orderNum" value="${orderList.orderNum }" />
				</c:forEach>
			</tbody>
			</c:if>
		</table>
		</div>
	</div>
	
</body>
</html>
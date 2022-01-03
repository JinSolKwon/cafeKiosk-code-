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
	<!-- Jquery -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	<link href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" rel="stylesheet" type="text/css">
<style>
	.ui-datepicker-trigger {
		position:relative;
		height:30px;
		width:30px;
		cursor:pointer;
	}
</style>
<title>이전 매출 확인</title>
</head>
<body>
	<%@ include file="../include/manageMenu.jsp"%>
	<div id="manageMain">
		<h1 style="font-weight:bold;">이전 매출 확인</h1>
		
		<form action="<c:url value="/managerPage/salesPast?search=1"/>" method="POST" style="float:right;">
			<label>
			<input type = "text" class = "date" id = "startDate" name = "eventStartDate" style="height:35px;width:140px;cursor:default;" placeholder="시작 날짜" readonly>
			~
			<input type = "text" class = "date" id = "endDate" name = "eventEndDate" style="height:35px;width:140px;cursor:default;" placeholder="마지막 날짜" readonly>
			</label>
			<input type = "submit" value="검색" class="btn btn-secondary" style="margin-bottom:3px;">
			<input type = "button" value="month" class="btn btn-primary" style="margin-bottom:3px;"
				onClick="window.location='<c:url value="/managerPage/salesPast?search=1"/>'">
		</form>
		
		<p style="margin-left:75%;font-weight:bold;font-size:large;">
			조회일자: ${startDate} ~ ${endDate}
		</p>
		
		
		<div style="width:33%;float:left;">
		<table class="table" style="table-layout:fixed;">
			<thead>
				<tr class="table-secondary">
					<th rowspan="2">일자</th>
					<th colspan="3">매출</th>
				</tr>
				<tr class="table-secondary">
					<th>포인트</th>
					<th>현금</th>
					<th>카드</th>
				</tr>
				<tr class="table-primary">
					<th rowspan="2">합계</th>
					<c:choose>
					<c:when test="${periodSalesSum eq null}">
						<th colspan="3">0</th>
					</c:when>
					<c:otherwise>
					<th colspan="3"><fmt:formatNumber value="${periodSalesSum.total}" pattern="###,###,###,###"/></th>
					</c:otherwise>
					</c:choose>
				</tr>
				<tr class="table-primary">
					<c:choose>
					<c:when test="${periodSalesSum eq null}">
						<th>0</th>
						<th>0</th>
						<th>0</th>
					</c:when>
					<c:otherwise>
					<th><fmt:formatNumber value="${periodSalesSum.point}" pattern="###,###,###,###"/></th>
					<th><fmt:formatNumber value="${periodSalesSum.cash}" pattern="###,###,###,###"/></th>
					<th><fmt:formatNumber value="${periodSalesSum.card}" pattern="###,###,###,###"/></th>
					</c:otherwise>
					</c:choose>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${dailySalesList}" var="sales">
					<tr>
						<td>${sales.orderDate}</td>
						<td>${sales.point}</td>
						<td>${sales.cash}</td>
						<td>${sales.card}</td>
					</tr>	
				</c:forEach>
			</tbody>
		</table>
		</div>
		
		<div style="width:33%;float:left;">
		<table class="table" style="table-layout:fixed;">
			<thead>
				<tr class="table-secondary">
					<th colspan="3">환불</th>
				</tr>
				<tr class="table-secondary">
					<th>포인트</th>
					<th>현금</th>
					<th>카드</th>
				</tr>
				<tr class="table-primary">
					<c:choose>
					<c:when test="${periodRefundSum eq null}">
						<th colspan="3">0</th>
					</c:when>
					<c:otherwise>
					<th colspan="3"><fmt:formatNumber value="${periodRefundSum.total}" pattern="###,###,###,###"/></th>
					</c:otherwise>
					</c:choose>
				</tr>
				<tr class="table-primary">
					<c:choose>
					<c:when test="${periodRefundSum eq null}">
						<th>0</th>
						<th>0</th>
						<th>0</th>
					</c:when>
					<c:otherwise>
					<th><fmt:formatNumber value="${periodRefundSum.point}" pattern="###,###,###,###"/></th>
					<th><fmt:formatNumber value="${periodRefundSum.cash}" pattern="###,###,###,###"/></th>
					<th><fmt:formatNumber value="${periodRefundSum.card}" pattern="###,###,###,###"/></th>
					</c:otherwise>
					</c:choose>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${dailyRefundList}" var="refund">
					<tr>
						<td>${refund.point}</td>
						<td>${refund.cash}</td>
						<td>${refund.card}</td>
					</tr>	
				</c:forEach>
			</tbody>
		</table>
		</div>
		
		<div style="width:33%;float:left;">
		<table class="table" style="table-layout:fixed;">
			<thead>
				<tr class="table-secondary">
					<th colspan="3">이익</th>
				</tr>
				<tr class="table-secondary">
					<th>포인트</th>
					<th>현금</th>
					<th>카드</th>
				</tr>
				<tr class="table-primary">
					<th colspan="3"><fmt:formatNumber value="${periodSalesSum.total - periodRefundSum.total}" pattern="###,###,###,###"/></th>
				</tr>
				<tr class="table-primary">
					<th><fmt:formatNumber value="${periodSalesSum.point-periodRefundSum.point}" pattern="###,###,###,###"/></th>
					<th><fmt:formatNumber value="${periodSalesSum.cash-periodRefundSum.cash}" pattern="###,###,###,###"/></th>
					<th><fmt:formatNumber value="${periodSalesSum.card-periodRefundSum.card}" pattern="###,###,###,###"/></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${dailyProfitList}" var="profit">
					<tr>
						<td>${profit.point}</td>
						<td>${profit.cash}</td>
						<td>${profit.card}</td>
					</tr>	
				</c:forEach>
			</tbody>
		</table>
		</div>
		
		<div style="margin-top:48%">
				<nav aria-label="Page navigation example justify-content-center">
			<c:if test="${count > 0}">
			<c:set var="imsi" value="${count % pageSize == 0 ? 0 : 1 }"/>
			<c:set var="pageCount" value="${count / pageSize + imsi }"/>
			<fmt:parseNumber var="pageCount" value="${pageCount}" integerOnly="true"/>
	
			<c:set var="pageBlock" value="${3}"/>
	
			<fmt:parseNumber var="result" value="${(currentPage-1) / pageBlock}" integerOnly="true"/>
			<c:set var="startPage" value="${result * pageBlock +1 }"/>
	
			<c:set var="endPage" value="${startPage + pageBlock - 1}"/>
	
			<c:if test="${endPage > pageCount}">
				<c:set var="endPage" value="${pageCount}"/>
			</c:if>
			
		  <ul class="pagination justify-content-center">
		    <c:if test="${startPage > pageBlock}"> 
			    <li class="page-item">
		      		<a class="page-link" href="<c:url value="/managerPage/salesPast?pageNum=${startPage - pageBlock}"/>">Previous</a>
		    	</li>
		    </c:if>
		    <c:forEach var="i" begin="${startPage}" end="${endPage}">
		    	<li class="page-item"><a class="page-link" href="<c:url value="/managerPage/salesPast?pageNum=${i}"/>">${i}</a></li>
		    </c:forEach>
		    <c:if test="${endPage < pageCount}">
		    	<li class="page-item">
		      		<a class="page-link" href="<c:url value="/managerPage/salesPast?pageNum=${endPage + 1}"/>">Next</a>
		    	</li>
		    </c:if>
		  </ul>
		  </c:if>
		</nav>
	</div>
	</div>
	
	<script>
	$(function() {              
        
        //datepicker 한국어로 사용하기 위한 언어설정
        $.datepicker.setDefaults($.datepicker.regional['ko']); 
        
        // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
        // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

        //시작일.
        $('#startDate').datepicker({
            dateFormat: "yy-mm-dd",
            monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
            dayNamesMin:["일","월","화","수","목","금","토"],
            buttonImage: "/resources/img/schedule.png", // 버튼 이미지
            buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
            //buttonText: "날짜선택",             // 버튼의 대체 텍스트
            showOn: 'button',
            showMonthAfterYear: true,
            changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
            changeYear: true,
                maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
            onClose: function( selectedDate ) {    
                // 시작일(fromDate) datepicker가 닫힐때
                // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#endDate").datepicker( "option", "minDate", selectedDate );
            }                
        });

        //종료일
        $('#endDate').datepicker({
            dateFormat: "yy-mm-dd",
            monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
            dayNamesMin:["일","월","화","수","목","금","토"], 
            dateFormat: "yy-mm-dd",
            buttonImage: "/resources/img/schedule.png", // 버튼 이미지
            buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
            showOn: 'button',
            showMonthAfterYear: true,
            changeMonth: true,
            changeYear: true,
            maxDate: 0, // 오늘 이후 날짜 선택 불가
            onClose: function( selectedDate ) {
                // 종료일(toDate) datepicker가 닫힐때
                // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                $("#startDate").datepicker( "option", "maxDate", selectedDate );
                
            }                
        });
        
        
        
    });

	</script>
</body>
</html>
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
			매출일자: 2021-12-07
		</p>
		<table class="table">
			<thead>
				<tr class="table-secondary">
					<th style="width:7%">주문번호</th>
					<th>메뉴명</th>
					<th style="width:7%">사이즈</th>
					<th style="width:7%">샷</th>
					<th style="width:7%">시럽</th>
					<th style="width:7%">휘핑</th>
					<th>적립금</th>
					<th>카드</th>
					<th>현금</th>
					<th>총액</th>
					<th>확인</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>(ICE)아메리카노</td>
					<td>L</td>
					<td>1</td>
					<td>1</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>4,000</td>
					<td></td>
				</tr>
				<tr id="divide">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>3,000</td>
					<td>500</td>
					<td>500</td>
					<td>4,000</td>
					<td>
						<button class="btn btn-secondary" onClick="window.location='<c:url value="#"/>'">환불</button>
					</td>
				</tr>
				<tr>
					<td>2</td>
					<td>(ICE)아메리카노</td>
					<td>L</td>
					<td>1</td>
					<td>1</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>4,000</td>
					<td></td>
				</tr>
					<tr>
					<td>2</td>
					<td>(ICE)아메리카노</td>
					<td>L</td>
					<td>1</td>
					<td>1</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>4,000</td>
					<td></td>
				</tr>
				<tr>
					<td>2</td>
					<td>(HOT)아메리카노</td>
					<td>L</td>
					<td>1</td>
					<td>1</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>4,000</td>
					<td></td>
				</tr>
				<tr id="divide">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>5,000</td>
					<td>-</td>
					<td>7,000</td>
					<td>12,000</td>
					<td>
						<button class="btn btn-secondary" onClick="window.location='<c:url value="#"/>'">환불</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
</body>
</html>
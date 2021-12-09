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

<title>이전 매출 확인</title>
</head>
<body>
	<%@ include file="../include/manageMenu.jsp"%>
	<div id="manageMain">
		<h1 style="font-weight:bold;">이전 매출 확인</h1>
		
		<form action="<c:url value="#"/>" method="POST" style="margin-left:63%">
			<label>
			<input type = "date" class = "date" id = "startDate" name = "eventStartDate" style="height:35px;">
			~
			<input type = "date" class = "date" id = "endDate" name = "eventEndDate" style="height:35px;">
			</label>
			<input type = "submit" value="검색" class="btn btn-secondary" style="margin-bottom:3px;">
			<input type = "button" value="month" class="btn btn-primary" style="margin-bottom:3px;"
				onClick="window.location='<c:url value="#"/>'">
		</form>
		
		<p style="margin-left:75%;font-weight:bold;font-size:large;">
			조회일자: 2021-11-07 ~ 2021-12-07 
		</p>
		
		<table class="table" style="table-layout:fixed;">
			<thead>
				<tr class="table-secondary">
					<th rowspan="2">일자</th>
					<th colspan="3">매출</th>
					<th colspan="3">환불</th>
					<th colspan="3">이익</th>
				</tr>
				<tr class="table-secondary">
					<th>포인트</th>
					<th>현금</th>
					<th>카드</th>
					<th>포인트</th>
					<th>현금</th>
					<th>카드</th>
					<th>포인트</th>
					<th>현금</th>
					<th>카드</th>
				</tr>
				<tr class="table-primary">
					<th rowspan="2">합계</th>
					<th colspan="3">000</th>
					<th colspan="3">000</th>
					<th colspan="3">000</th>
				</tr>
				<tr class="table-primary">
					<th>0</th>
					<th>0</th>
					<th>0</th>
					<th>0</th>
					<th>0</th>
					<th>0</th>
					<th>0</th>
					<th>0</th>
					<th>0</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>2021-12-01</td>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
					<td>6</td>
					<td>7</td>
					<td>8</td>
					<td>9</td>
				</tr>
				<tr>
					<td>2021-12-02</td>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
					<td>6</td>
					<td>7</td>
					<td>8</td>
					<td>9</td>
				</tr>
				<tr>
					<td>2021-12-03</td>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
					<td>6</td>
					<td>7</td>
					<td>8</td>
					<td>9</td>
				</tr>
				<tr>
					<td>2021-12-04</td>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
					<td>6</td>
					<td>7</td>
					<td>8</td>
					<td>9</td>
				</tr>
				<tr>
					<td>2021-12-05</td>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
					<td>6</td>
					<td>7</td>
					<td>8</td>
					<td>9</td>
				</tr>
				<tr>
					<td>2021-12-06</td>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
					<td>6</td>
					<td>7</td>
					<td>8</td>
					<td>9</td>
				</tr>
				<tr>
					<td>2021-12-07</td>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
					<td>6</td>
					<td>7</td>
					<td>8</td>
					<td>9</td>
				</tr>
				<tr>
					<td>2021-12-08</td>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
					<td>6</td>
					<td>7</td>
					<td>8</td>
					<td>9</td>
				</tr>
				<tr>
					<td>2021-12-09</td>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
					<td>6</td>
					<td>7</td>
					<td>8</td>
					<td>9</td>
				</tr>
				<tr>
					<td>2021-12-10</td>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
					<td>6</td>
					<td>7</td>
					<td>8</td>
					<td>9</td>
				</tr>
			</tbody>
		</table>
		
		<nav aria-label="Page navigation example justify-content-center">
		  <ul class="pagination justify-content-center">
		    <li class="page-item disabled">
		      <a class="page-link">Previous</a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#">Next</a>
		    </li>
		  </ul>
		</nav>
	</div>
</body>
</html>
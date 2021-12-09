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

<title>메뉴관리</title>
</head>
<body>
	<%@ include file="../include/manageMenu.jsp"%>
	<div id="manageMain">
		<h1 style="font-weight:bold;">메뉴관리</h1>
		
		<form action="<c:url value="#"/>" method="POST" style="margin-left:60%">
			<select name="type" style="height:40px;">
				<option value="" selected>전체</option>
				<option value="drink">음료</option>
				<option value="dessert">디저트</option>
			</select>
			<input type="text" id="menu" name="menu" placeholder="메뉴명 검색" style="height:40px;">
			<input type="submit" class="btn btn-secondary" value="검색" style="height:40px;width:70px;margin-bottom:3px;">
		</form>
		
		<form name="form" method="POST">
			<input type="submit" class="btn btn-primary" value="삭제" style="height:40px;width:70px;float:right;"
				formaction="#">
			<input type="submit" class="btn btn-primary" value="on/off" style="margin-right:10px;height:40px;width:70px;float:right;"
				formaction="#">
			<table class="table">
				<thead>
					<tr class="table-secondary">
						<th>선택</th>
						<th style="width:8%">번호</th>
						<th>카테고리</th>
						<th>메뉴명</th>
						<th>가격(won)</th>
						<th>등록일자</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td  style="color:red;"><input type="checkbox" class="form-check-input">OFF</td>
						<td>1</td>
						<td>coffee</td>
						<td>아메리카노</td>
						<td>3,000</td>
						<td>2021.12.05</td>
					</tr>
					<tr>
						<td style="color:red;"><input type="checkbox" class="form-check-input">OFF</td>
						<td>2</td>
						<td>coffee</td>
						<td>아메리카노</td>
						<td>3,000</td>
						<td>2021.12.05</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="form-check-input">ON</td>
						<td>3</td>
						<td>coffee</td>
						<td>아메리카노</td>
						<td>3,000</td>
						<td>2021.12.05</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="form-check-input">ON</td>
						<td>4</td>
						<td>coffee</td>
						<td>아메리카노</td>
						<td>3,000</td>
						<td>2021.12.05</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="form-check-input">ON</td>
						<td>5</td>
						<td>coffee</td>
						<td>아메리카노</td>
						<td>3,000</td>
						<td>2021.12.05</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="form-check-input">ON</td>
						<td>6</td>
						<td>coffee</td>
						<td>아메리카노</td>
						<td>3,000</td>
						<td>2021.12.05</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="form-check-input">ON</td>
						<td>7</td>
						<td>coffee</td>
						<td>아메리카노</td>
						<td>3,000</td>
						<td>2021.12.05</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="form-check-input">ON</td>
						<td>1</td>
						<td>coffee</td>
						<td>아메리카노</td>
						<td>3,000</td>
						<td>2021.12.05</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="form-check-input">ON</td>
						<td>1</td>
						<td>coffee</td>
						<td>아메리카노</td>
						<td>3,000</td>
						<td>2021.12.05</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="form-check-input">ON</td>
						<td>1</td>
						<td>coffee</td>
						<td>아메리카노</td>
						<td>3,000</td>
						<td>2021.12.05</td>
					</tr>
				</tbody>
			</table>
		</form>
		
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
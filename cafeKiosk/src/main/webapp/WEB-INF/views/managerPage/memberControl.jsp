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
<title>회원관리(관리자페이지 홈)</title>
</head>
<body>
	<%@ include file="../include/manageMenu.jsp"%>
	<div id="manageMain">
		<h1 style="font-weight:bold;">회원관리</h1>
		
		<form action="<c:url value="#"/>" method="POST" style="margin-left:73%">
			<input type="text" id="phoneNum" name="phone" placeholder="전화번호 검색" style="height:40px;">
			<input type="submit" class="btn btn-secondary" value="검색" style="height:40px;width:70px;margin-bottom:3px;">
		</form>
		
		<form action="<c:url value="#"/>" method="POST">
			<input type="submit" class="btn btn-secondary" value="삭제" style="height:40px;width:70px;float:right;">
			<table class="table">
				<thead>
					<tr class="table-secondary">
						<th style="width:10%">선택</th>
						<th style="width:10%">번호</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>생일</th>
						<th>가입일자</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox" class="form-check-input"></td>
						<td>1</td>
						<td>스탠 리</td>
						<td>010-1234-1234</td>
						<td>1990.08.01</td>
						<td>2021.12.05</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="form-check-input"></td>
						<td>1</td>
						<td>스탠 리</td>
						<td>010-1234-1234</td>
						<td>1990.08.01</td>
						<td>2021.12.05</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="form-check-input"></td>
						<td>1</td>
						<td>스탠 리</td>
						<td>010-1234-1234</td>
						<td>1990.08.01</td>
						<td>2021.12.05</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="form-check-input"></td>
						<td>1</td>
						<td>스탠 리</td>
						<td>010-1234-1234</td>
						<td>1990.08.01</td>
						<td>2021.12.05</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="form-check-input"></td>
						<td>1</td>
						<td>스탠 리</td>
						<td>010-1234-1234</td>
						<td>1990.08.01</td>
						<td>2021.12.05</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="form-check-input"></td>
						<td>1</td> 
						<td>스탠 리</td>
						<td>010-1234-1234</td>
						<td>1990.08.01</td>
						<td>2021.12.05</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="form-check-input"></td>
						<td>1</td>
						<td>스탠 리</td>
						<td>010-1234-1234</td>
						<td>1990.08.01</td>
						<td>2021.12.05</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="form-check-input"></td>
						<td>1</td>
						<td>스탠 리</td>
						<td>010-1234-1234</td>
						<td>1990.08.01</td>
						<td>2021.12.05</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="form-check-input"></td>
						<td>1</td>
						<td>스탠 리</td>
						<td>010-1234-1234</td>
						<td>1990.08.01</td>
						<td>2021.12.05</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="form-check-input"></td>
						<td>1</td>
						<td>스탠 리</td>
						<td>010-1234-1234</td>
						<td>1990.08.01</td>
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
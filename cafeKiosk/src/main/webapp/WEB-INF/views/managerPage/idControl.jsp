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

<title>관리자 계정 관리</title>
</head>
<body>
	<%@ include file="../include/manageMenu.jsp"%>
	<div id="manageMain">
		<h1 style="font-weight:bold;">관리자 계정 관리</h1>
		
		<form action="<c:url value="#"/>" method="POST" style="margin-left:68%">
			<input type="text" id="id" name="id" placeholder="아이디 검색" style="height:40px;">
			<input type="submit" class="btn btn-secondary" value="검색" style="height:40px;width:70px;margin-bottom:3px;">
		</form>
		
		<button class="btn btn-secondary" style="height:40px;width:70px;margin-bottom:3px;margin-left:20px;"
			onClick="window.location='<c:url value="#"/>'">등록</button>
		
		<form action="<c:url value="#"/>" method="POST">
			<input type="submit" class="btn btn-secondary" value="삭제" style="height:40px;width:70px;float:right;margin-top:1px;">
			<table class="table">
				<thead>
					<tr class="table-secondary">
						<th style="width:5%">선택</th>
						<th style="width:5%">번호</th>
						<th>아이디</th>
						<th>직위</th>
						<th>가입일자</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td>1</td>
						<td>ghktjr960</td>
						<td>master</td>
						<td>2021.12.05</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="form-check-input"></td>
						<td>2</td>
						<td>wsx7189</td>
						<td>admin</td>
						<td>2021.12.05</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="form-check-input"></td>
						<td>3</td>
						<td>stopluna</td>
						<td>admin</td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cafeCarp 회원가입</title>
</head>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy" var="thisYear"/>
<form action="<c:url value="/cafeCarp/regist" />" method="post">
<table>
	<thead></thead>
	<tbody>
		<tr>
			<td colspan="3"><input type="text" name="phone" placeholder="'-'를 제외한 숫자 11자리 입력 "/></td>
			<td><button onclick="#">중복체크</button></td>
		</tr>
		<tr>
			<td colspan="4"><input type="text" name="name" placeholder="이름"/>
		</tr>
		<tr>
			<td>생 년 월 일</td>
			<td>
				<select name="birthYear" id="year" title="년도">
					<option value="">년도</option>
					<c:forEach var="i" begin="1930" end="${thisYear}" step="1">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>
			</td>
			<td>
				<select name="month" id="month" title="월">
					<option value="">월</option>
					<c:forEach var="i" begin="1" end="12" step="1">
						<option value="${i}">${i}</option>
					</c:forEach>				
				</select>
			</td>
			<td>	
				<select name="day" id="day" title="일">
					<option value="">일</option>				
					<c:forEach var="i" begin="1" end="31" step="1">
						<option value="${i}">${i}</option>
					</c:forEach>				
				</select>
			</td>
			<c:set var="birth" value="${month += day}"></c:set>
		</tr>
		<tr>
			<td colspan="2"><button type="button" onclick="history.go(-1);">가입취소</button></td>
			<td colspan="2"><button type="submit">가입하기</button></td>
		</tr>
	</tbody>
</table>
</form>

</body>
</html>
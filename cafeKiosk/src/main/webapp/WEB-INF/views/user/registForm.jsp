<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cafeCarp 회원가입</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
var chk = "<c:out value="${checkOK}"/>";
if(chk === 'noexist'){
	$(function(){
		$("#phone").attr("readonly", true);		
	})
	alert('사용 가능한 번호입니다.');
}
var nx = "<c:out value="${next}"/>";
if(nx === 'next'){
	$(function(){
		$("#subBtn").attr("disabled", false);
	})
}
</script>
</head>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy" var="thisYear"/>
<form method="post">
<table>
	<thead></thead>
	<tbody>
		<tr>
			<td colspan="3"><input id="phone" name="phone" type="text" value="${member.phone}" placeholder="'-'를 제외한 숫자 11자리 입력 "/></td>
			<td><button id="phoneCHK" type="submit" onclick="form.action='<c:url value="/cafeCarp/phoneCheck" />'" >중복체크</button></td>
		</tr>
		<tr>
			<td colspan="4"><input id="name" name="name" type="text" value="${member.name}" placeholder="이름"/>
		</tr>
		<tr>
			<td>생 년 월 일</td>
			<td>
				<select id="year" name="birthYear">
					<option value="">년도</option>
					<c:forEach var="i" begin="1930" end="${thisYear}" step="1">
						<option value="${i}" <c:if test="${!empty member.birthYear && i == member.birthYear}">selected="selected"</c:if>>${i}</option>
					</c:forEach>
				</select>
			</td>
			<td>
				<select id="month" name="month">
					<option value="">월</option>
					<c:forEach var="i" begin="1" end="12" step="1">
						<option value="${i}" <c:if test="${!empty month && i == month}">selected="selected"</c:if>>${i}</option>
					</c:forEach>				
				</select>
			</td>
			<td>	
				<select id="day" name="day">
					<option value="">일</option>				
					<c:forEach var="i" begin="1" end="31" step="1">			
						<option value="${i}" <c:if test="${!empty day && i == day}">selected="selected"</c:if>>${i}</option>
					</c:forEach>				
				</select>
			</td>
		</tr>
		<c:if test="${!empty check}">
			<tr><td colspan="4"><c:out value="${check}"/></td></tr>
		</c:if>
		<tr>
			<td colspan="2"><button type="button" onclick="history.go(-1);">가입취소</button></td>
			<td colspan="2"><button id="subBtn" type="submit" onclick="form.action='<c:url value="/cafeCarp/regist" />'" disabled="true">가입하기</button></td>
		</tr>
	</tbody>
</table>
</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cafeCarp 회원가입</title>
<link href="<c:url value="/resources/css/userDiv.css" />" rel="stylesheet" type="text/css" />
</head>
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy" var="thisYear"/>
<div class="container-main">
<div class="header-main">	<img alt="cafeCarp" src="<c:url value="/resources/img/cafeCarp_main.png" />"></div>
<form id="registForm" method="post">
<div class="main-regist">
		<div class="main-regist1">
		<%-- 	<input id="phone" name="phone" type="text" oninput="autoHyphen(this)" maxlength="13" value="${member.phone}" placeholder="'-'를 제외한 숫자 11자리 입력 "/> --%>
			<input id="phone" name="phone" type="text" maxlength="13" value="${member.phone}" placeholder="'-'를 제외한 숫자 11자리 입력 "/>
			<button id="phoneCHK" type="submit" onclick="form.action='<c:url value="/cafeCarp/phoneCheck" />'" >중복체크</button>
		</div>
		<div class="main-regist2"><input id="name" name="name" type="text" value="${member.name}" placeholder="이름"/></div>
		<div class="main-regist3">
			<div class="main-regist3-1">생 년 월 일</div>
			<div class="main-regist3-2">
				<select id="year" name="birthYear">
					<option value="">년도</option>
					<c:forEach var="i" begin="0" end="100" step="1">
					<c:set var="optionYear" value="${thisYear-i}" />
						<option value="${optionYear}" <c:if test="${!empty member.birthYear && optionYear == member.birthYear}">selected="selected"</c:if>>${optionYear}</option>
					</c:forEach>
				</select>
			</div>
			<div class="main-regist3-3">
				<select id="month" name="month">
					<option value="">월</option>
					<c:forEach var="i" begin="1" end="12" step="1">
						<option value="${i}" <c:if test="${!empty month && i == month}">selected="selected"</c:if>>${i}</option>
					</c:forEach>				
				</select>
			</div>
			<div class="main-regist3-4">	
				<select id="day" name="day">
					<option value="">일</option>		
					<c:forEach var="i" begin="1" end="31" step="1">			
						<option value="${i}" <c:if test="${!empty day && i == day}">selected="selected"</c:if>>${i}</option>
					</c:forEach>				
				</select>
			</div>
		</div>
		<div class="main-regist4">
			<c:if test="${!empty check}">
				<span><c:out value="${check}"/></span>
			</c:if>
		</div>
	</div>
	<div class="footer-btn-regist">
		<div class="footer-btn-regist1"><button type="button" onclick="location.href='<c:url value="/cafeCarp/main" />'">가입취소</button></div>
		<div class="footer-btn-regist2"><button id="subBtn" type="submit" onclick="form.action='<c:url value="/cafeCarp/regist" />'" disabled="true">가입하기</button></div>
	</div>
</form>
</div>
<script type="text/javascript">
/* const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	} */
	function autoHypenPhone(str){
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';
        if( str.length < 4){
            return str;
        }else if(str.length < 7){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            return tmp;
        }else if(str.length < 11){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
        }else{              
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 4);
            tmp += '-';
            tmp += str.substr(7);
            return tmp;
        }
        return str;
    }

	var phone = document.getElementById('phone');
	// onkeyup : 사용자가 키보드를 눌렀다가 땠을 때
	phone.onkeyup = function(event){
	    event = event || window.event;
	    var _val = this.value.trim();
	    this.value = autoHypenPhone(_val) ;
	}
	
var chk = "<c:out value="${checkOK}"/>";		
$(document).ready(function(){
	if(chk === 'noexist'){
		$("#phone").attr("readonly", true);
		$('.container-main').css('z-index',0);	
		Swal.fire({
			  icon: 'success',
			  title: '확인 완료',
			  text: '사용 가능한 번호입니다.'
			}).then(function(){
				$('.container-main').css('z-index',10001);		
			});

	}
});

var nx = "<c:out value="${next}"/>";
if(nx === 'next'){
	$(function(){
		$("#subBtn").attr("disabled", false);
	})
}
</script>
<!-- sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>
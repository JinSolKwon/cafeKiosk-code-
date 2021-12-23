<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>회원등록</title>
</head>
<body>
	<c:if test="${insertResult eq false }">
		<script type="text/javascript">
			alert("회원등록에 실패하였습니다.");
		</script>
	</c:if>
	<div class="container shadow-lg my-5 border" style="width: 500px;">
		<div class="row text-center fs-2 my-4">
			<b>회원등록</b>
		</div>
		<div class="row">
			<form name="regiInfo" class="center" method="post">
				<div class="row mb-3">
					<div class="col-9 text-center">
						<input type="text" class="form-control" id="phone" name="phone" placeholder="전화번호를 입력하세요" maxlength="13">
					</div>
					<!-- <div id="phoneVal"></div> -->
					<div class="col-3 text-start">
						<button class="btn btn-secondary" id="phoneChk" value="N" type="button" onclick="phoneCheck()" style="width: 100px;">중복확인</button>
					</div>
					<div class="phoneValid my-1" id="phoneValid"></div>
				</div>
				<div class="mb-3">
					<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요">
				</div>
				<div class="row mb-3">
					<div class="col-4">
						<select class="form-select" id="year" name="year">
						  <option selected disabled hidden>년도</option>
						  <jsp:useBean id="toDay" class="java.util.Date"/>
						  <fmt:formatDate value="${toDay}" pattern="yyyy" var="year"/>
						  <c:forEach begin="0" end="90" var="i">
							  <option value="${year-i }">${year-i }</option>
						  </c:forEach>
						</select>
					</div>
					<div class="col-4">
						<select class="form-select" id="month" name="month">
							<option selected disabled hidden>월</option>
							<c:forEach begin="1" end="12" var="month">
								<option value="${month }">${month }</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-4">
						<select class="form-select" id="day" name="day">
							<option selected disabled hidden>일</option>
							<c:forEach begin="1" end="31" var="day">
								<option value="${day}">${day }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</form>
		</div>
		<div class="row my-2">
			<div class="col-6 text-end">
				<button class="btn btn-secondary" style="width: 225px;" onclick="submit()">회원등록</button>		
			</div>
			<div class="col-6 text-start">
				<button class="btn btn-light border" style="width: 225px;" onclick="cancel()">가입취소</button>		
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
	</script>
	
	<script type="text/javascript">
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
		
		/*
		function nameCheck(nameVal){
			nameVal = nameVal.replace(/[^(ㄱ-힣a-zA-Z)]/g, '');
	        return nameVal;
	    }
		
		var name = document.getElementById('name');
		name.onkeyup = function(nameEvent){
			nameEvent = nameEvent || window.event;
			var nameVal = this.value.trim();
			this.value = nameCheck(nameVal);
		}
		*/
		
		function submit(){
			var form = document.regiInfo;
			var phone = form.phone.value;
			var phoneChk = form.phoneChk.value;
			var name = form.name.value;
			var year = form.year.value;
			var month = form.month.value;
			var day = form.day.value;
			
			if(phone == ""){
				//document.getElementById('phoneVal').innerHTML='전화번호를 입력하세요'
				//document.getElementById('phoneVal').style.color='red'
				//form.phone.focus();
				alert("전화번호를 입력하세요");
				form.phone.focus();
				return false;
			} else if(phoneChk == "N") {
				alert("전화번호 중복확인을 해주세요");
				form.phoneChk.focus();
				return false;
			} else if(name == ""){
				alert("이름을 입력하세요");
				form.name.focus();
				return false;
			} else if(year == "" || year == "년도"){
				alert("년도를 입력하세요");
				form.year.focus();
				return false;
			} else if(month == "" || month == "월"){
				alert("월을 입력하세요");
				form.month.focus();
				return false;
			} else if(day == "" || day == "일"){
				alert("일을 입력하세요");
				form.day.focus();
				return false;
			}
			
			form.submit();
			
		}
		
		function cancel(){
			location.href="/pos/menuOrder/pointCheck";
		}
		
		function phoneCheck(){
			$.ajax({
				url : "/pos/menuOrder/phoneCheck",
				type : "post",
				data : {phone: $('#phone').val()},
				dataType : 'json',
				success : function(result){
					if(result == 1){
						document.getElementById('phoneValid').innerHTML='등록된 회원의 전화번호입니다.'
			            document.getElementById('phoneValid').style.color='red';
						alert("등록된 회원의 전화번호입니다.");
					}else if(result == 0){
						$("#phoneChk").attr("value", "Y");
						document.getElementById('phoneValid').innerHTML='등록되지 않은 회원의 전화번호입니다.'
			            document.getElementById('phoneValid').style.color='blue';
						alert("등록되지 않은 회원의 전화번호입니다.");
					}
				}
			})
		}
		
	</script>
	
</body>
</html>
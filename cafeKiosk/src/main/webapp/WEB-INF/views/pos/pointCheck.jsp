<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<title>포인트 조회</title>
</head>
<body>
	<c:if test="${insertResult eq true }">
		<script type="text/javascript">
			alert("회원등록이 완료되었습니다.");
		</script>
	</c:if>
	
	<div class="container shadow-lg my-5 border" style="width:500px; height:300px;">
		<div class="row justify-content-end my-5">
			<div class="col-3">
			</div>
			<div class="col-6 text-center">
				<h3><b>회원조회</b></h3>
			</div>
			<div class="col-3">
				<button onclick="register()" class="btn btn-secondary" style="width:100px;">회원등록</button>
			</div>
		</div>
		
		<form method="post" class="center" name="pointCheck">
			<div class="row">
				<div class="col">
					<input type="text" class="form-control" id="phoneNum" name="phoneNum" placeholder="전화번호를 입력하세요" maxlength="13">
				</div>
			</div>
		</form>
			<div class="row my-4">
				<div class="col-6">
					<button type="button" id="check" class="btn btn-secondary" style="width:225px;">조회하기</button>
				</div>
				<div class="col-6">
					<button type="button" id="back" class="btn btn-light border" style="width:225px;">돌아가기</button>
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
	
		var phoneNum = document.getElementById('phoneNum');
		// onkeyup : 사용자가 키보드를 눌렀다가 땠을 때
		phoneNum.onkeyup = function(event){
		    event = event || window.event;
		    var _val = this.value.trim();
		    this.value = autoHypenPhone(_val) ;
		}	
		
		document.getElementById("back").addEventListener("click", back);
		
		function back(){
			location.href="/pos/menuOrder/details";
		}
		
		document.getElementById("check").addEventListener("click", pointCheck);
	
		function pointCheck(){
			var form = document.pointCheck;
			var phone = form.phoneNum.value;
			var num_check = phone.search(/[0-9]/g);
			
			// phoneNum의 값이 입력되지 않았을 경우
			if(phone == "") {
				alert('전화번호를 입력해주세요');
				form.phoneNum.focus();
				return false;
			} else if(num_check < 0){
				alert('숫자만 입력해주세요')
				form.phoneNum.focus();
				return false;
			} else if(phone.length != 13) {
				alert('전화번호 11자리를 입력해주세요');
				form.phoneNum.focus();
				return false;
			} 
			form.submit();
		}
		
		function register(){
			location.href="/pos/menuOrder/register"
		}
		
		</script>
	
</body>
</html>
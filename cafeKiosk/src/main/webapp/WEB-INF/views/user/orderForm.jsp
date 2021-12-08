<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cafeCarp 주문페이지</title>
<link href="<c:url value="/resources/css/userOrder.css" />" rel="stylesheet" type="text/css" />
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- 모달 JQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<!-- toast -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
var login = "<c:out value="${success}" />";
var user = "<c:out value="${sessionScope.member.getName()}" />";
if(login == 'hello'){
	alert(user + "님 환영합니다.");
}
function mainBack(){
	if(confirm('메인페이지로 이동하시겠습니까? 메인페이지 이동 시 선택된 모든 메뉴가 삭제되며 로그아웃 처리 됩니다.')){
		return true;
	}else{
		return false;
	}
}
</script>
</head>
<body>
<c:if test="${!empty sessionScope.member}">
	<c:set var="length" value="${fn:length(sessionScope.member.getPhone())}" />
	<c:set var="phone2" value="${fn:substring(sessionScope.member.getPhone(), length-4, length-2)}" />
	<c:set var="user" value="${phone2}**님" />
	<fmt:formatNumber var="point2" pattern="#,###" value="${sessionScope.member.getPoint()}"></fmt:formatNumber>
</c:if>
<div class="container">
<div class="header">
	<ul>
	<c:forEach items="${sessionScope.cateList}" var="cateOne">
		<a href="<c:url value="/cafeCarp/order?num=${cateOne.getNum()}" />"><li>${cateOne.getCategory() }</li></a>
	</c:forEach>
	</ul>
</div>
<div class="main">
	<c:forEach items="${menuList}" var="menuOne">
		<a onclick="modalOpen(this)">
		<div class="main1">
			<c:if test="${empty menuOne.SAVE_NAME}">
				<div class="main1-image"><img alt="${menuOne.MENU}" src="<c:url value="/display?saveName=noimage.gif" />"></div>		
			</c:if>
			<c:if test="${!empty menuOne.SAVE_NAME}">
				<div class="main1-image"><img alt="${menuOne.MENU}" src="<c:url value="/display?saveName=${menuOne.SAVE_NAME}" />"></div>
			</c:if>
			<div class="main1-txt">
				<div class="main1-name">${menuOne.MENU}</div>
				<div class="main1-price">${menuOne.PRICE}</div>
			</div>
		</div>
		</a>
	</c:forEach>
</div>
<div class="side">
	<div id="side1">
	<c:if test="${!empty sessionScope.member}">
		<div id="side1-1">${user}</div>
		<div id="side1-2">${point2}P</div>
	</c:if>
		<div id="side1-3"><a href="<c:url value="/cafeCarp/main"/>" onclick="mainBack();">메인페이지 이동</a></div>
	</div>
	<div id="side2"></div>
	<div id="side3"></div>
	<div id="side4"><button id="subBtn" onclick="">결 제 하 기</button></div>
</div>
</div>

<div class="modal" id="optionModal" tabindex="-1" role="dialog">
	<form action="<c:url value="#" />" method="post">
	<div class="modal-content">
		<div class="modal-header">
			<div class="modal-header1"><img id="modal-img" alt="" src=""></div>
			<div class="modal-header2">
				<div class="modal-header2-1">
					<h3 id="modal-name"></h3>
					<input type="hidden" name="menu" id="modal-name-hidden"/>
				</div>
				<div class="modal-header2-2">
					<h3 id="modal-price"></h3>
				</div>
			</div>
			<div class="modal-header3">
				<label><input type="radio" name="temperature" value="ICE" checked="checked" />ICE</label>
				<label><input type="radio" name="temperature" value="HOT" />HOT</label>
			</div>
		</div>
		<div class="modal-body">
			<div class="modal-body1">
				<h3>사이즈</h3>
				<label><input type="radio" name="beverageSize" value="M" checked="checked" />M</label>
				<label><input type="radio" name="beverageSize" value="L" />L</label>
				<label><input type="radio" name="beverageSize" value="XL" />XL</label>
			</div>
			<div class="modal-body2">
				<h3>휘핑</h3>
				<label><input type="radio" name="whipping" value="N" checked="checked" />없음</label>
				<label><input type="radio" name="whipping" value="Y" />휘핑추가</label>
			</div>
			<div class="modal-body3">
				<h3>시럽추가</h3>
				<button type ="button" onclick="fnCalCount('sp');">+</button>
		        <input size="5px" type="text" name="syrub" value="0" readonly="readonly" style="text-align:center;"/>
		        <button type="button" onclick="fnCalCount('sm');">-</button>
			</div>
			<div class="modal-body4">
				<h3>샷추가</h3>
				<button type ="button" onclick="fnCalCount('p');">+</button>
		        <input size="5px" type="text" name="shot" value="0" readonly="readonly" style="text-align:center;"/>
		        <button type="button" onclick="fnCalCount('m');">-</button>
			</div>
			<div class="modal-body5">
				<p id="totalPrice"></p>
				<input type="hidden" name="price" id="modal-price-hidden"/>
			</div>
		</div>
		<div class="modal-footer">
			<div class="modal-footer1">
				<button type="button" onclick="modalClose()">취소</button>
			</div>
			<div class="modal-footer2">
				<button class="subBtn" type="submit">담기</button>
			</div>
		</div>
	</div>
	</form>
</div>
<!-- 모달 함수 -->
<script type="text/javascript">
var modal = document.getElementById("optionModal");
function modalOpen(selM){
	console.log(selM);
	modal.style.display="block";
}
function modalClose(){
	modal.style.display="none";
}
function fnCalCount(type){
    var $input = $(".modal-body3").find("input[name='syrub']");
    var tCount = Number($input.val());
    var $input2 = $(".modal-body4").find("input[name='shot']");
    var tCount2 = Number($input2.val());
    var price = Number($("#modal-price").val());
    var totalPrice = Number($("#totalPrice").val());
    if(type==='sp'){
        $input.val(Number(tCount)+1);
        totalPrice.val(Number(price)+300);
     }else if(type==='sm'){
         if(tCount >0) $input.val(Number(tCount)-1);    
         }
    if(type==='p'){
       $input2.val(Number(tCount2)+1);
    }else if(type==='m'){
        if(tCount2 >0) $input2.val(Number(tCount2)-1);    
        }
}
</script>
</body>
</html>
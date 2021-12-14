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
<link href="<c:url value="/resources/css/userDiv.css" />" rel="stylesheet" type="text/css" />
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
</head>
<body>
<div id="background-optionForm">
<div id="container-optionForm">
<form action="<c:url value="/cafeCarp/orderSet" />" method="post">
<div class="header-optionForm">
	<c:if test="${not empty selectMenu.SAVE_NAME}">
		<c:set var="imageName" value="${selectMenu.SAVE_NAME}" />
	</c:if>
	<c:if test="${empty selectMenu.SAVE_NAME}">
		<c:set var="imageName" value="noimage.gif" />
	</c:if>
	<div class="header-optionForm1"><img alt="" src="<c:url value="/display?saveName=${imageName}"/>"> </div>
	<div class="header-optionForm2">
		<span id="header-optionForm-menu">${selectMenu.MENU}</span>
		<c:set var="price1" value="${selectMenu.PRICE}" />
		<fmt:formatNumber var="price2" value="${price1}" pattern="#,###" />
		<span id="header-optionForm-price">${price2} 원</span>
	</div>
	<div class="header-optionForm3">
		<c:if test="${selectMenu.TYPE == 1 && selectMenu.CATEGORY_NUM le 3}">
				<label><input type="radio" name="temperature" value="ICE" checked="checked" />ICE</label>&nbsp;&nbsp;&nbsp;
				<label><input type="radio" name="temperature" value="HOT" />HOT</label>
		</c:if>
	</div>
</div>
<div class="main-optionForm">
	<c:if test="${selectMenu.TYPE == 1}">
		<div class="main-optionForm1">
			<div class="main-optionForm1-1"><span>사이즈</span></div>
			<div class="main-optionForm1-2">
				<label><input type="radio" name="beverageSize" value="M" checked="checked" />M</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<label><input type="radio" name="beverageSize" value="L" />L(+500)</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<label><input type="radio" name="beverageSize" value="XL" />XL(+1000)</label>			
			</div>
		</div>
		<div class="main-optionForm1">
			<div class="main-optionForm1-1"><span>휘핑</span></div>
			<div class="main-optionForm1-2">
				<label><input type="radio" name="whipping" value="N" checked="checked" />없음</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label><input type="radio" name="whipping" value="Y" />휘핑추가</label>
			</div>
		</div>
		<div class="main-optionForm1">
		<div class="main-optionForm1-1"><span>시럽추가</span></div>
		<div class="main-optionForm1-2">
	        	<button type="button" onclick="fnCalCount('sm');">-</button>
		        <input size="5px" type="text" name="syrub" value="0" readonly="readonly" style="text-align:center;"/>
				<button type ="button" onclick="fnCalCount('sp');">+</button>
			</div>
		</div>
		<div class="main-optionForm1">
			<div class="main-optionForm1-1"><span>샷추가</span></div>
			<div class="main-optionForm1-2">
	        <button type="button" onclick="fnCalCount('m');">-</button>
		        <input size="5px" type="text" name="shot" value="0" readonly="readonly" style="text-align:center;"/>
				<button type ="button" onclick="fnCalCount('p');">+</button>			
			</div>
		</div>
	</c:if>
</div>
<div class="footer-optionForm">
	<div class="footer-optionForm1">
		<input type="hidden" name="price" id="modal-price-hidden"/>
		<p id="modal-price-total"></p>
	</div>
	<div class="footer-optionForm2">
		<div class="footer-optionForm2-1">
			<button type="button" onclick="history.go(-1)">취소</button>
		</div>		
		<div class="footer-optionForm2-2">
			<button class="subBtn" type="submit">담기</button>
		</div>		
	</div>
</div>
</form>
</div>
</div>
<script type="text/javascript">
var price = "<c:out value="${selectMenu.PRICE}"/>";
console.log(price);
document.getElementById("modal-price-total").innerHTML = price + ' 원';
function fnCalCount(type){
    var $input = $(".main-optionForm1-2").find("input[name='syrub']");
    var tCount = Number($input.val());
    var $input2 = $(".main-optionForm1-2").find("input[name='shot']");
    var tCount2 = Number($input2.val());
    var total;
    if(type==='sp'){
        $input.val(Number(tCount)+1);
    }else if(type==='sm'){
       if(tCount >0){
        	$input.val(Number(tCount)-1);
        }
    }
    if(type==='p'){
    	console.log(price);
       $input2.val(Number(tCount2)+1);
       total = price+500;
       console.log(price);
    }else if(type==='m'){
    	if(tCount2 >0){
    		console.log(price);
        	$input2.val(Number(tCount2)-1);    
       		total = price-500;   
       		console.log(price);
        }
    }
    if(type==='p'){
		document.getElementById("modal-price-total").innerHTML = total + ' 원';
		$("#modal-price-hidden").val(total);
    }else if(type==='m'){
       	if(tCount >0 || tCount2 >0){   	
    		document.getElementById("modal-price-total").innerHTML = total + ' 원';
    		$("#modal-price-hidden").val(total);       		
       	}
    }
}
</script>
</body>
</html>
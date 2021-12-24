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
</head>
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<body>
<c:if test="${!empty sessionScope.member}">
	<c:set var="length" value="${fn:length(sessionScope.member.getPhone())}" />
	<c:set var="phone2" value="${fn:substring(sessionScope.member.getPhone(), length-4, length-2)}" />
	<c:set var="user" value="${phone2}**님" />
	<fmt:formatNumber var="point" pattern="#,###" value="${sessionScope.member.getPoint()}"></fmt:formatNumber>
	<c:set var="point2" value="${point}P" />
</c:if>
<div id="container">
<div class="header-orderForm">
	<div class="header-orderForm1">
		<div class="header-orderForm1-1"><button type="button" onclick="location.href='<c:url value="/kiosk/scroll?type=A" />'">◀ </button></div>
		<div class="header-orderForm1-2">
			<ul id="cateUl-orderForm">
			<c:forEach items="${sessionScope.cateList}" var="cateOne" varStatus="status">
				<li id="cateLi-orderForm${satus.count}"><a href="<c:url value="/kiosk/order?num=${cateOne.getNum()}" />">${cateOne.getCategory() }</a></li>
			</c:forEach>
			</ul>
		</div>
		<div class="header-orderForm1-3"><button type="button" onclick="location.href='<c:url value="/kiosk/scroll?type=N" />'">▶</button></div>
	</div>
	<div id="header-orderForm2">
		<div id="header-orderForm2-1">${user}</div>
		<div id="header-orderForm2-2">${point2}</div>
		<div id="header-orderForm2-3"><button onclick="mainBack();">MAIN<br>Go</button></div>
	</div>
</div>
<hr style="border: black;">
<div class="main-orderForm">
	<c:forEach items="${menuList}" var="menuOne">
		<a onclick="modalOpen('${menuOne.MENU}','${menuOne.PRICE}','${menuOne.SAVE_NAME}','${menuOne.CATEGORY_NUM}','${menuOne.TYPE}')">
<%-- 	<a href="<c:url value="/cafeCarp/option?num=${menuOne.NUM}" />"> --%>	
		<div class="main-orderForm1">
			<c:if test="${empty menuOne.SAVE_NAME}">
				<div class="main-orderForm1-image"><img alt="${menuOne.MENU}" src="<c:url value="/display?saveName=noimage.gif" />"></div>		
			</c:if>
			<c:if test="${!empty menuOne.SAVE_NAME}">
				<div class="main-orderForm1-image"><img alt="${menuOne.MENU}" src="<c:url value="/display?saveName=${menuOne.SAVE_NAME}" />"></div>
			</c:if>
			<div class="main-orderForm1-txt">
				<div class="main-orderForm1-name">${menuOne.MENU}</div>
				<div class="main-orderForm1-price"><fmt:formatNumber var="price" pattern="#,###" value="${menuOne.PRICE}"/>${price} 원</div>
			</div>
		</div>
		</a>
	</c:forEach>
</div>
<div class="side-orderForm">
	<div id="side-orderForm1">
		<c:if test="${!empty sessionScope.orderList}">
		<c:forEach items="${sessionScope.orderList}" var="orderOne" varStatus="status">
			<div class="side-orderForm1-1">
				<div class="side-orderForm1-2">
					<div class="side-orderForm1-2-1">${orderOne.getMenu()}</div>
					<div class="side-orderForm1-2-2"><c:if test="${orderOne.getType() == 1}">( ${orderOne.getTemperature()} )</c:if></div>
					<div class="side-orderForm1-2-3">
						<div class="side-orderForm1-2-3-1">
							<button type="button" onclick="location.href='<c:url value="/kiosk/orderDel?num=${status.index}" />'">X</button>
						</div>
						<div class="side-orderForm1-2-3-2">
							<fmt:formatNumber var="orderPrice" pattern="#,###" value="${orderOne.getPrice()}"/>
							<c:set var="oP" value="${orderPrice} 원" />
							${oP}
						</div>
					</div>
				</div>
				<c:if test="${orderOne.getType() == 1}">
					<div class="side-orderForm1-3">┗ 사이즈 : ${orderOne.getBeverageSize()}</div>
					<c:choose>
						<c:when test="${orderOne.getWhipping() eq 'N'}">
							<c:set var="whip" value="┗ 휘핑 : 없음" />
						</c:when>
						<c:otherwise>
							<c:set var="whip" value="┗ 휘핑 : 있음" />
						</c:otherwise>
					</c:choose>
					<div class="side-orderForm1-4">${whip}</div>
					<c:choose>
						<c:when test="${orderOne.getSyrub() == 0}">
							<c:set var="syrubOp" value="┗ 시럽 : 없음" />
						</c:when>
						<c:otherwise>
							<c:set var="syrubOp" value="┗ 시럽 : ${orderOne.getSyrub()}" />
						</c:otherwise>
					</c:choose>
					<div class="side-orderForm1-5">${syrubOp}</div>
					<c:choose>				
						<c:when test="${orderOne.getShot() == 0}">
							<c:set var="shotOp" value="┗ 샷추가: 없음" />
						</c:when>
						<c:otherwise>
							<c:set var="shotOp" value="┗ 샷추가 : ${orderOne.getShot()}" />
						</c:otherwise>
					</c:choose>
					<div class="side-orderForm1-6">${shotOp}</div>
				</c:if>
			</div>
		</c:forEach>
		</c:if>
	</div>
	<div id="side-orderForm2">
		<div class="side-orderForm2-1"><c:if test="${not empty sessionScope.orderCount}" ><c:set var="orCount" value="수량  : ${sessionScope.orderCount}"/>${orCount}</c:if></div>
		<div class="side-orderForm2-2">
			<c:if test="${not empty sessionScope.orderTotal}" >
				<fmt:formatNumber var="orderTotal1" value="${sessionScope.orderTotal}" pattern="#,###"/>
				<c:set var="orTotal" value="금액 : ${orderTotal1} 원"/>${orTotal}
			</c:if>
		</div>
	</div>
	<div id="side-orderForm3">
		<button id="subBtn" onclick="location.href='<c:url value="/kiosk/orderResult"/>'" disabled="true">결 제 하 기</button>
	</div>
</div>
</div>
<div class="modal" id="optionModal" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
	<form action="<c:url value="/kiosk/orderSet" />" method="post">
	<div class="modal-content">
		<div class="modal-header">
			<input type="hidden" name="categoryNum" id="modal-cateNum-hidden"/>
			<div class="modal-header1"><img id="modal-img" alt="" src=""></div>
			<div class="modal-header2">
				<div class="modal-header2-1">
					<span id="modal-name"></span>
					<input type="hidden" name="menu" id="modal-name-hidden"/>
				</div>
				<div class="modal-header2-2">
					<span id="modal-price"></span>
				</div>
			</div>
			<div class="modal-header3">
				<label><input type="radio" name="temperature" value="ICE" checked="checked" />ICE</label>
				<label><input type="radio" name="temperature" value="HOT" />HOT</label>
			</div>
		</div>
		<div class="modal-body">
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
			<div class="main-optionForm1">
				<p id="modal-price-total"></p>
				<input type="hidden" name="price" id="modal-price-hidden"/>
				<input type="hidden" name="origiPrice" id="modal-origin-price-hidden"/>
				<input type="hidden" name="type" id="modal-type-hidden"/>
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
</div>
<script type="text/javascript">
var login = "<c:out value="${success}" />";
$(document).ready(function(){	
	if(login == 'hello'){
			const Toast = Swal.mixin({   
			toast: true,   
			position: 'top-end',   
			showConfirmButton: false,   
			timer: 3000,   
			timerProgressBar: true,   
			didOpen: (toast) => {     
				toast.addEventListener('mouseenter', Swal.stopTimer)     
				toast.addEventListener('mouseleave', Swal.resumeTimer)   
			} 
		})  
			Toast.fire({   
				icon: 'success',   
				title: '${sessionScope.member.getName()}님 환영합니다.' 
			})
	}
});
function mainBack(){
	Swal.fire({
		  title: '메인페이지로 이동하시겠습니까?',
		  html: "메인페이지 이동 시 선택된 모든 메뉴가 삭제되며<br>로그아웃 처리 됩니다.",
		  icon: 'info',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '이동',
		  cancelButtonText: '취소'
		}).then((result) => {
		  if (result.value) {
				location.href="<c:url value="/kiosk/main"/>";
		  }
		})
}

if(${sessionScope.orderList eq null}){
	$(function(){
		$("#subBtn").attr("disabled", true);
	})
}else{
	$("#subBtn").attr("disabled", false);
}

var numC = "<c:out value="${sessionScope.pageNum}" />";
	$("#cateUl-orderForm").find("LI").eq(numC-1).css('background-color', '#F05454');
	
/* var scDis = "<c:out value="${scDis}" />";
var _scrollX = $('.header-orderForm1-2').scrollLeft();
if(scDis === 'R'){
	$('.header-orderForm1-2').scrollTo(_scrollX + 100);
}
if(scDis === 'L'){
	$('.header-orderForm1-2').scrollLeft(_scrollX - 100);
}
	
 */

// 스크롤 마우스로 이동 function
const slider = document.querySelector('.header-orderForm1-2');
let isMouseDown = false;
let startX, scrollLeft;

slider.addEventListener('mousedown', (e) => {
	isMouseDown = true;
	slider.classList.add('active');
	
	startX = e.pageX - slider.offsetLeft;
	scrollLeft = slider.scrollLeft;
});
slider.addEventListener('mouseleave', () => {
	isMouseDown = false;
	slider.classList.remove('active');
});
slider.addEventListener('mouseup', () => {
	isMouseDown = false;
	slider.classList.remove('active');
});
slider.addEventListener('mousemove', (e) => {
	if(!isMouseDown) return;
	
	e.preventDefault();
	const x = e.pageX - slider.offsetLeft;
	const walk = (x - startX) * 1;
	slider.scrollLeft = scrollLeft - walk;
});
	
	
var modal = document.getElementById("optionModal");
var divWidth = $(window).outerWidth(true); 
var divHeight = $(window).outerHeight(true); 

function modalOpen(menu,price,save,cateNum,type){
	if(save == null || save == ""){save = 'noimage.gif';}
	document.getElementById("modal-name").innerHTML = menu;
	document.getElementById("modal-name-hidden").value = menu;
	document.getElementById("modal-price").innerHTML = price + ' 원';
	document.getElementById("modal-price-total").innerHTML = price + ' 원';
	document.getElementById("modal-price-hidden").value = price;
	document.getElementById("modal-origin-price-hidden").value = price;
	document.getElementById("modal-type-hidden").value = type;
	document.getElementById("modal-cateNum-hidden").value = cateNum;
	var imgSrc = "<c:url value='/display?saveName=" + save + "'/>";
	$('#modal-img').attr("src", imgSrc);
	$('#modal-img').attr("alt", save);
	console.log(cateNum);
	if(cateNum == 4 || cateNum == 5 || cateNum == 6){
		$(".modal-header3").css("display", "none");
	}
	if(type == 2){
		$(".modal-header3").css("display", "none");
		$(".main-optionForm1-1").css("display", "none");
		$(".main-optionForm1-2").css("display", "none");
	}
	modal.style.display="block";
}
function modalClose(){
	modal.style.display="none";
}

$("input[name='beverageSize']").change(function(){
    var $input = $(".main-optionForm1-2").find("input[name='syrub']");
    var $input2 = $(".main-optionForm1-2").find("input[name='shot']");
    var price = document.getElementById("modal-origin-price-hidden").value;
	if($("input[name='beverageSize']:checked").val()=="M"){
		document.getElementById("modal-price-total").innerHTML = price + ' 원';		
		document.getElementById("modal-price-hidden").value=Number(price);
        $input.val(Number(0));
        $input2.val(Number(0));
	}else if($("input[name='beverageSize']:checked").val() == "L"){
		price = Number(price)+500;
		document.getElementById("modal-price-total").innerHTML = price + ' 원';
		document.getElementById("modal-price-hidden").value=Number(price);
        $input.val(Number(0));
        $input2.val(Number(0));
	}else if($("input[name='beverageSize']:checked").val() == "XL"){
		price = Number(price)+1000;
		document.getElementById("modal-price-total").innerHTML = price + ' 원';	
		document.getElementById("modal-price-hidden").value=Number(price);
        $input.val(Number(0));
        $input2.val(Number(0));
	}
});

function fnCalCount(type){
    var $input = $(".main-optionForm1-2").find("input[name='syrub']");
    var tCount = Number($input.val());
    var $input2 = $(".main-optionForm1-2").find("input[name='shot']");
    var tCount2 = Number($input2.val());
    var price = Number($("#modal-price-hidden").val());
    var total;
    if(type==='sp'){
        $input.val(Number(tCount)+1);
    }else if(type==='sm'){
       if(tCount >0){
        	$input.val(Number(tCount)-1);
        }
    }
    if(type==='p'){
       $input2.val(Number(tCount2)+1);
       total = Number(price)+500;
    }else if(type==='m'){
    	if(tCount2 >0){
        	$input2.val(Number(tCount2)-1);    
       		total = Number(price)-500;   
        }
    }
    if(type==='p'){
		document.getElementById("modal-price-total").innerHTML = total + ' 원';
		$("#modal-price-hidden").val(Number(total));
    }else if(type==='m'){
       	if(tCount >0 && tCount2 >0){   	
    		document.getElementById("modal-price-total").innerHTML = total + ' 원';
    		$("#modal-price-hidden").val(Number(total));       		
       	}
    }
}
</script>
</body>
</html>
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
	<!-- sweetalert -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<!-- Bootstrap 모달 -->
	<script src="https://code.jquery.com/jquery-latest.js"></script>
<title>카테고리 관리</title>
</head>
<body>
	<%@ include file="../include/manageMenu.jsp"%>
	<div id="manageMain">
		<h1 style="font-weight:bold;">카테고리 관리</h1>
		
		<form action="<c:url value="/managerPage/categoryControl"/>" method="POST" style="margin-left:67%">
			<input type="text" id="category" name="category" placeholder="카테고리명 검색" style="height:40px;">
			<input type="submit" class="btn btn-secondary" value="검색" style="height:40px;width:70px;margin-bottom:3px;">
		</form>
		
		<button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#insertCategoryModal"
		style="height:40px;width:70px;margin-bottom:3px;">등록</button>
		
		<c:if test="${count == 0}">
			<table class="table">
				<tr>
					<td>
						등록된 카테고리가 존재하지 않습니다.
					</td>
				</tr>
			</table>
		</c:if>
		
		<c:if test="${count > 0}">
		<form name="form" method="POST">
			<input type="button" class="btn btn-primary" value="삭제" style="height:40px;width:70px;float:right;"
				onclick="deleteValue('${masterPass}');">
			<table class="table table-hover" id="example-table-1">
				<thead>
					<tr class="table-secondary">
						<th style="width:10%" onclick="event.cancelBubble=true">
							<input type="checkbox" class="form-check-input" name="reportChkBx" id="checkAll">
						</th>
						<th style="width:10%" onclick="event.cancelBubble=true">번호</th>
						<th class="hidden-col" onclick="event.cancelBubble=true">진짜 번호</th>
						<th class="hidden-col" onclick="event.cancelBubble=true">마스터 비밀번호</th>
						<th onclick="event.cancelBubble=true" style="width:40%;">카테고리 타입</th>
						<th onclick="event.cancelBubble=true" style="width:40%;">카테고리</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="category" items="${categoryList}">
					<tr>
						<td onclick="event.cancelBubble=true" style="color:black;">
							<input type="checkbox" class="form-check-input" name="reportChkBxRow" value="${category.categoryNum}">
						</td>
						<td style="cursor:pointer;">
							<c:out value="${number}"/>
							<c:set var="number" value="${number + 1}"/>
						</td>
						<td class="hidden-col">${category.categoryNum}</td>
						<td class="hidden-col">${masterPass}</td>
						<c:if test="${category.type eq 0}">
							<td style="cursor:pointer;">디저트</td>
						</c:if>
						<c:if test="${category.type eq 1}">
							<td style="cursor:pointer;">음료</td>
						</c:if>
						<td style="cursor:pointer;">${category.category}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
		</c:if>
		
		<nav aria-label="Page navigation example justify-content-center">
			<c:if test="${count > 0}">
			<c:set var="imsi" value="${count % pageSize == 0 ? 0 : 1 }"/>
			<c:set var="pageCount" value="${count / pageSize + imsi }"/>
			<fmt:parseNumber var="pageCount" value="${pageCount}" integerOnly="true"/>
	
			<c:set var="pageBlock" value="${3}"/>
	
			<fmt:parseNumber var="result" value="${(currentPage-1) / pageBlock}" integerOnly="true"/>
			<c:set var="startPage" value="${result * pageBlock +1 }"/>
	
			<c:set var="endPage" value="${startPage + pageBlock - 1}"/>
	
			<c:if test="${endPage > pageCount}">
				<c:set var="endPage" value="${pageCount}"/>
			</c:if>
			
		  <ul class="pagination justify-content-center">
		    <c:if test="${startPage > pageBlock}"> 
			    <li class="page-item">
		      		<a class="page-link" href="<c:url value="/managerPage/categoryControl?pageNum=${startPage - pageBlock}"/>">Previous</a>
		    	</li>
		    </c:if>
		    <c:forEach var="i" begin="${startPage}" end="${endPage}">
		    	<li class="page-item"><a class="page-link" href="<c:url value="/managerPage/categoryControl?pageNum=${i}"/>">${i}</a></li>
		    </c:forEach>
		    <c:if test="${endPage < pageCount}">
		    	<li class="page-item">
		      		<a class="page-link" href="<c:url value="/managerPage/categoryControl?pageNum=${endPage + 1}"/>">Next</a>
		    	</li>
		    </c:if>
		  </ul>
		  </c:if>
		</nav>
	</div>
	
	  <!-- insert Modal -->
  <div class="modal fade" id="insertCategoryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" >
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">카테고리 등록</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form method="post" id="regForm" action ="<c:url value="/managerPage/insertCategory"/>">
		      <div class="modal-body" style="text-align:center;">
			      <table class="tableModal">
		  			<tr style="height:40px;">
		  				<td style="width:25%;">
				  			메뉴타입
			        	</td>
			        	<td style="width:25%;">
				  			<input class="form-check-input" type="radio" name="menuType" id="menuType" value="1" checked>
    						음료
				  		</td>
				  		<td style="width:25%;">
					        <input class="form-check-input" type="radio" name="menuType" id="menuType" value="0">
    						디저트
					    </td>
					    <td style="width:25%;">
					    </td>
			        </tr>
			        <tr style="height:40px;">
			        	<td>
				  			카테고리명
			        	</td>
			        	<td colspan="2">
				  			<input type="text" placeholder="카테고리 이름" id="categoryName" class="categoryName" name="categoryName" style="width:100%;vertical-align:middle;border: 1px solid #DDDDDD;">
					    </td>
					    <td>
					    	<button class="btn btn-secondary" id="categoryChk" onclick="fn_categoryChk();" type="button" value="N">중복체크</button>
					    </td>
					</tr>
			      </table>
		      </div>
		      <div class="alert">
		      
		      </div>
		      <div class="modal-footer" style="align-items:center;justify-content:center;">
		        <input type="button" id="insertCategory" value="카테고리 등록" class="btn btn-secondary">
		        <button type="button" class="btn" style="background:#DDDDDD;color:white;" data-bs-dismiss="modal">등록취소</button>
		      </div>
		  </form>    
	    </div>
	  </div>
  </div>
	
	<script>
	// 전체 체크박스 선택
	$(document).ready(function(){
	    //최상단 체크박스 클릭
	    $("#checkAll").click(function(){
	        //클릭되었으면
	        if($("#checkAll").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=reportChkBxRow]").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=reportChkBxRow]").prop("checked",false);
	        }
	    })
	})
	
	// 메뉴 삭제
	function deleteValue(masterPass){
	var url = "deleteCategory";    // Controller로 보내고자 하는 URL
	var valueArr = new Array();
    var list = $("input[name='reportChkBxRow']");
    
    for(var i = 0; i < list.length; i++){
        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
            valueArr.push(list[i].value);
        }
    }
    if (valueArr.length == 0){
    	Swal.fire({
    		icon: 'error',
    		title: '삭제실패',
    		text: '선택 항목이 존재하지 않습니다.',
    		confirmButtonColor: '#DDDDDD',
    		confirmButtonText: '확인',
    		showCloseButton: true,
    		allowOutsideClick: false
    	})
    }
    else{
		var chk = Swal.fire({
                  title: '카테고리 삭제',
                  showCancelButton: true,
                  confirmButtonColor: '#444444',
                  cancelButtonColor: '#DDDDDD',
                  confirmButtonText: '삭제',
                  cancelButtonText: '취소',
                  allowOutsideClick: false,
                  showCloseButton: true,
                  html:
                	  '<input id="swal-input" class="swal-input" placeholder="Master Password">',
                	  preConfirm: function () {
                          return new Promise(function (resolve) {
                              // Validate input 
                              if ($('#swal-input').val() == '') {
                                  Swal.showValidationMessage("마스터 패스워드가 입력되지 않았습니다."); // Show error when validation fails.
                                  Swal.enableButtons();
                                  
                              } else if ($('#swal-input').val() != masterPass) { 
                            	  Swal.showValidationMessage("마스터 패스워드와 일치하지 않습니다."); // Show error when validation fails.
                                  Swal.enableButtons();
                            	  
                          	  }	else {
                                  Swal.resetValidationMessage(); // Reset the validation message.
                                  resolve([
                                      $('#swal-input').val()
                                  ]);
                              }
                          })
                      }
              }).then((result) => { 
                  if (result.value) {
				$.ajax({ 
				    url : 'deleteCategory',                    // 전송 URL
				    type : 'POST',                // POST 방식
				    traditional : true,
				    data : {
				    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
				    },
	                success: function(jdata){
	                    if(jdata = 1) { 
	                        location.replace("categoryControl") //list 로 페이지 새로고침
	                    }
	                    else{
	                        alert("삭제 실패");
	                    }
	                }
				});       
                  }
              })				 
		}
	}
	
	// 카테고리 등록 유효성 체크
	$(document).ready(function(){
		$("#insertCategory").on("click", function(){			
			if($("input[name='menuType']:checked").val() ==''){
				alert("메뉴 타입을 선택해주세요.");
				$("#menuType").focus();
				return false;
			}
			if($("#categoryName").val()==""){
				alert("메뉴 카테고리를 선택해주세요.");
				$("#categoryName").focus();
				return false;
			}
			
			var idChkVal = $("#categoryChk").val();
			if(idChkVal == "N"){
				alert("카테고리 중복체크를 해주세요.");
			    return false;
			}else if(idChkVal == "Y"){
				$("#regForm").submit();
			}
		});		 
	})
	
	// 테이블의 Row 클릭시 카테고리 정보 가져온 후 수정
	$("#example-table-1 tr").click(function(){ 	

		// 현재 클릭된 Row(<tr>)
		var tr = $(this);
		var td = tr.children();
		
		// td.eq(index)를 통해 값을 가져올 수도 있다.
		var categoryNum = td.eq(2).text();
		var masterPass = td.eq(3).text() ;
		var type = td.eq(4).text();
		var category = td.eq(5).text(); 

		var chk = Swal.fire({
            title: '카테고리 수정',
            html:
            	'<table class="tableModal">'+
            		'<tr style="height:40px;">'+
  						'<td style="width:25%;">메뉴타입</td>'+
	        			'<td style="width:25%;">'+
		  					'<input class="form-check-input" type="radio" name="menuType1" id="menuType1" value="1" checked>'+
							'음료'+
		  				'</td>'+
		  				'<td style="width:25%;">'+
			        		'<input class="form-check-input" type="radio" name="menuType1" id="menuType1" value="0">'+
							'디저트'+
			    		'</td>'+
			    		'<td style="width:25%;"></td>'+
	        		'</tr>'+
            		'<tr>' + 
            			'<td>카테고리명</td>'+
            			'<td colspan="2"><input type="text" id="swal-input1" class="swal2-input" value="'+category+'" placeholder="카테고리명" style="width:200px;"></td>'+
            			'<td><button class="btn btn-secondary" id="categoryChk1" onclick="fn_categoryChk1();" type="button" value="N">중복체크</button></td>'+
					'</tr>',
            preConfirm: function () {
                return new Promise(function (resolve) {
                    // Validate input 
                    if ($("input[name='menuType1']:checked").val() =='' || $('#swal-input1').val() == '') {
                        Swal.showValidationMessage("두 가지 항목을 모두 입력해주세요."); // Show error when validation fails.
                        Swal.enableButtons(); // Enable the button again.
                    } else if ($("#categoryChk1").val() == 'N'){
                    	Swal.showValidationMessage("카테고리 중복체크를 해주세요."); // Show error when validation fails.
                    	Swal.enableButtons(); // Enable the button again.
                	} else {
                        swal.resetValidationMessage(); // Reset the validation message.
                        resolve([
                            category = $('#swal-input1').val(),
                            type = $("input[name='menuType1']:checked").val()
                        ]);
                    }
                })
            },
            showCancelButton: true,
            confirmButtonColor: '#444444',
            cancelButtonColor: '#DDDDDD',
            confirmButtonText: '수정완료',
            cancelButtonText: '수정취소',
            showCloseButton: true,
    		allowOutsideClick: false
        }).then((result) => {
            if (result.value) {
			$.ajax({ 
			    url : 'updateCategory',        // 전송 URL
			    type : 'POST',                // POST 방식
			    traditional : true,
			    data : {
			    	category : category,   		// 보내고자 하는 data 변수 설정
			    	type : type,
			    	categoryNum : categoryNum
			    },
              success: function(jdata){
                  if(jdata = 1) {
                      location.replace("categoryControl") //list 로 페이지 새로고침
                  }
                  else{
                      alert("수정 실패");
                  }
              }
			});       
            }
        })            
	});
	
	// 카테고리 등록 중복체크
	function fn_categoryChk(){	
		$.ajax({
			url : "categoryChk",
			type : "post",
			dataType : "json",
			data : {"category" : $("#categoryName").val()},
			success : function(data){
				if(data == 1){
					alert("중복된 카테고리 이름입니다.");
				}else if(data == 0){
					$("#categoryChk").attr("value", "Y");
					alert("사용가능한 카테고리 이름입니다.");
				}
			}
		})
	}
	
	// 카테고리 수정 중복체크
	function fn_categoryChk1(){	
		$.ajax({
			url : "categoryChk",
			type : "post",
			dataType : "json",
			data : {"category" : $("#swal-input1").val()},
			success : function(data){
				if(data == 1){
					alert("중복된 카테고리 이름입니다.");
				}else if(data == 0){
					$("#categoryChk1").attr("value", "Y");
					alert("사용가능한 카테고리 이름입니다.");
				}
			}
		})
	}
	
	// 모달 닫으면 입력된 정보 초기화
	$('.modal').on('hidden.bs.modal', function (e) {
	    console.log('modal close');
	  $(this).find('form')[0].reset()
	});
	
	</script>
</body>
</html>
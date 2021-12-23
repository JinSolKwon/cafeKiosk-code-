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
<title>메뉴관리</title>
</head>
<body>
	<%@ include file="../include/manageMenu.jsp"%>
	<div id="manageMain">
		<h1 style="font-weight:bold;">메뉴관리</h1>
		
		<form action="<c:url value="/managerPage/menuControl"/>" method="POST" style="margin-left:60%">
			<select name="type" style="height:40px;">
				<option value="" selected>전체</option>
				<option value="1">음료</option>
				<option value="0">디저트</option>
			</select>
			<input type="text" id="menu" name="menu" placeholder="메뉴명 검색" style="height:40px;">
			<input type="submit" class="btn btn-secondary" value="검색" style="height:40px;width:70px;margin-bottom:3px;">
		</form>
		
		<button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#insertMenuModal"
		style="height:40px;width:70px;margin-bottom:3px;margin-left:0px;">등록</button>
		
		<c:if test="${count == 0}">
			<table class="table">
				<tr>
					<td>
						등록된 메뉴가 존재하지 않습니다.
					</td>
				</tr>
			</table>
		</c:if>
		
		<c:if test="${count > 0}">
		<form name="form" method="POST">
			<input type="button" class="btn btn-primary" value="삭제" style="height:40px;width:70px;float:right;"
				onclick="deleteValue('${masterPass}');">
			<input type="submit" class="btn btn-primary" value="on/off" style="margin-right:10px;height:40px;width:70px;float:right;"
				formaction="#">
			<table class="table table-hover" id="example-table-1">
				<thead>
					<tr class="table-secondary">
						<th style="width:10%" onclick="event.cancelBubble=true">
							<input type="checkbox" class="form-check-input" name="reportChkBx" id="checkAll">
						</th>
						<th style="width:10%" onclick="event.cancelBubble=true">번호</th>
						<th class="hidden-col" onclick="event.cancelBubble=true">진짜 번호</th>
						<th class="hidden-col" onclick="event.cancelBubble=true">마스터 비밀번호</th>
						<th onclick="event.cancelBubble=true">카테고리</th>
						<th onclick="event.cancelBubble=true">메뉴명</th>
						<th onclick="event.cancelBubble=true">가격(won)</th>
						<th onclick="event.cancelBubble=true">등록일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="menu" items="${menuList}">
					<tr>
						<c:if test="${menu.using eq 1}">
							<td onclick="event.cancelBubble=true" style="color:black;">
								<input type="checkbox" class="form-check-input" name="reportChkBxRow" value="${menu.num}">ON
							</td>
						</c:if>
						<c:if test="${menu.using eq 0}">
							<td onclick="event.cancelBubble=true" style="color:red;">
								<input type="checkbox" class="form-check-input" name="reportChkBxRow" value="${menu.num}" style="border:1px solid red;">OFF
							</td>
						</c:if>
						<td style="cursor:pointer;">
							<c:out value="${number}"/>
							<c:set var="number" value="${number + 1}"/>
						</td>
						<td class="hidden-col">${menu.num}</td>
						<td class="hidden-col">${masterPass}</td>
						<td style="cursor:pointer;">${menu.category}</td>
						<td style="cursor:pointer;">${menu.menu}</td>
						<td style="cursor:pointer;"><fmt:formatNumber value="${menu.price}" pattern="#,###,###"/></td>
						<td style="cursor:pointer;">
							<fmt:formatDate value="${menu.regdate}" pattern="yyyy-MM-dd"/>
						</td>
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
			    <li class="page-item disabled">
		      		<a class="page-link" href="<c:url value="/managerPage/menuControl?pageNum=${startPage - pageBlock}"/>">Previous</a>
		    	</li>
		    </c:if>
		    <c:forEach var="i" begin="${startPage}" end="${endPage}">
		    	<li class="page-item"><a class="page-link" href="<c:url value="/managerPage/menuControl?pageNum=${i}"/>">${i}</a></li>
		    </c:forEach>
		    <c:if test="${endPage < pageCount}">
		    	<li class="page-item">
		      		<a class="page-link" href="<c:url value="/managerPage/menuControl?pageNum=${startPage - pageBlock}"/>">Next</a>
		    	</li>
		    </c:if>
		  </ul>
		  </c:if>
		</nav>
	</div>
	
	  <!-- Modal -->
  <div class="modal fade" id="insertMenuModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" >
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">메뉴 등록</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form method="post" id="regForm" action ="<c:url value="/managerPage/insertMenu"/>" enctype="multipart/form-data">
		      <div class="modal-body" style="text-align:center;">
			      <table class="tableModal">
		  			<tr style="height:40px;">
		  				<td style="width:25%;">
				  			메뉴타입
			        	</td>
			        	<td style="width:25%;">
				  			<input class="form-check-input" type="radio" name="flexRadioDefault" id="type" value="1">
    						음료
				  		</td>
				  		<td style="width:25%;">
					        <input class="form-check-input" type="radio" name="flexRadioDefault" id="type" value="0">
    						디저트
					    </td>
					    <td style="width:25%;">
					    </td>
			        </tr>
			        <tr style="height:40px;">
			        	<td>
				  			카테고리
			        	</td>
			        	<td colspan="2">
				  			<select name="category" style="width:100%;vertical-align:middle;">
								<option value="" selected>카테고리 선택</option>
				  				<c:forEach var="category" items="${categoryList}">
									<option value="${category.num}">${category.category}</option>
								</c:forEach>
							</select>
					    </td>
					    <td>
					    </td>
					</tr>
					<tr style="height:40px;">
			        	<td >
				  			메뉴이름
			        	</td>
			        	<td colspan="2">
				  			<input type="text" placeholder="메뉴이름" id="menuName" class="menuName" name="menuName" style="width:100%;vertical-align:middle;border: 1px solid #DDDDDD;">
					    </td>
					    <td>
					    	<button class="btn btn-secondary" id="menuChk" onclick="fn_menuChk();" type="button" value="N">중복체크</button>
					    </td>
					</tr>
					<tr style="height:40px;">
			        	<td >
				  			메뉴가격
			        	</td>
			        	<td colspan="2">
				  			<input type="text" placeholder="메뉴가격" id="menuPrice" class="menuPrice" name="menuPrice" style="width:100%;vertical-align:middle;border: 1px solid #DDDDDD;">
					    </td>
					    <td style="text-align:left;">
					    	원
					    </td>
					</tr>
					<tr style="height:40px;">
			        	<td >
				  			사진추가
			        	</td>
			        	<td colspan="2" style="text-align:left;">
				  			<input type="file" id="file" name="file" accept="image/*" style="display:none"/>
				  			<span id="fileName">선택된 파일없음</span>
					    </td>
					    <td>
					    	<label class="btn btn-primary" for="file" id="btn-file" style="border: 1px solid #ddd; outline: none;">사진 추가</label>
					    </td>
					</tr>
			      </table>
		      </div>
		      <div class="alert">
		      
		      </div>
		      <div class="modal-footer" style="align-items:center;justify-content:center;">
		        <input type="button" id="insertMenu" value="계정등록" class="btn btn-secondary">
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
	
	document.getElementById('file').addEventListener('change', function(){
		var filename = document.getElementById('fileName');
			if(this.files[0] == undefined){
				filename.innerText = '선택된 파일없음';
				return;
			}
		filename.innerText = this.files[0].name;
	});

	
	// 관리자 계정 삭제
	function deleteValue(masterPass){
	var url = "deleteMenu";    // Controller로 보내고자 하는 URL
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
    		allowOutsideClick: false
    	})
    }
    else{
		var chk = Swal.fire({
                  title: '메뉴 삭제',
                  showCancelButton: true,
                  confirmButtonColor: '#444444',
                  cancelButtonColor: '#DDDDDD',
                  confirmButtonText: '삭제',
                  cancelButtonText: '취소',
                  html:
                	  '<input id="swal-input" class="swal-input" placeholder="Master Password">',
                	  preConfirm: function () {
                          return new Promise(function (resolve) {
                              // Validate input 
                              if ($('#swal-input').val() == '') {
                                  swal.showValidationMessage("마스터 패스워드가 입력되지 않았습니다."); // Show error when validation fails.
                                  swal.enableConfirmButton(); // Enable the confirm button again.
                              } else if ($('#swal-input').val() != masterPass) { 
                            	  swal.showValidationMessage("마스터 패스워드와 일치하지 않습니다."); // Show error when validation fails.
                                  swal.enableConfirmButton(); // Enable the confirm button again.	
                          	  }	else {
                                  swal.resetValidationMessage(); // Reset the validation message.
                                  resolve([
                                      $('#swal-input').val()
                                  ]);
                              }
                          })
                      }
              }).then((result) => { 
                  if (result.value) {
				$.ajax({ 
				    url : 'deleteMenu',                    // 전송 URL
				    type : 'POST',                // POST 방식
				    traditional : true,
				    data : {
				    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
				    },
	                success: function(jdata){
	                    if(jdata = 1) {
	                        alert("삭제 성공");
	                        location.replace("menuControl") //list 로 페이지 새로고침
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
	// 관리자 계정 등록 유효성 체크
	$(document).ready(function(){
		$("#insertMenu").on("click", function(){
			if(!($("#type").val() >= 0 || $("#type").val() <= 1)){
				alert("메뉴 타입을 선택해주세요.");
				$("#type").focus();
				return false;
			}
			if($("#category").val()==0){
				alert("메뉴 카테고리를 선택해주세요.");
				$("#category").focus();
				return false;
			}
			if($("#menuName").val()==""){
				alert("메뉴 이름을 입력해주세요.");
				$("#menuName").focus();
				return false;
			}
			
			if($("#menuPrice").val()==""){
				alert("메뉴 가격을 입력해주세요.")
				$("#menuPrice").focus();
				return false;
			}
			
			var idChkVal = $("#menuChk").val();
			if(idChkVal == "N"){
				alert("메뉴이름 중복체크를 해주세요.");
			    return false;
			}else if(idChkVal == "Y"){
				alert("등록성공")
				$("#regForm").submit();
			}
		});		 
	})
	
	// 메뉴 이름 중복체크
	function fn_menuChk(){	
		$.ajax({
			url : "menuChk",
			type : "post",
			dataType : "json",
			data : {"menu" : $("#menuName").val()},
			success : function(data){
				if(data == 1){
					alert("중복된 아이디입니다.");
				}else if(data == 0){
					$("#menuChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
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
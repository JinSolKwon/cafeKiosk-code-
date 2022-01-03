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
 
	<link href="${pageContext.request.contextPath}/resources/css/manager.css" rel="stylesheet" type="text/css">
<title>관리자 계정 관리</title>
</head>
<body>
	<%@ include file="../include/manageMenu.jsp"%>
	<div id="manageMain">
		<h1 style="font-weight:bold;">관리자 계정 관리</h1>
		
		<form action="<c:url value="/managerPage/idControl"/>" method="POST" style="margin-left:67%">
			<input type="text" id="id" name="id" placeholder="아이디 검색" style="height:40px;">
			<input type="submit" class="btn btn-secondary" value="검색" style="height:40px;width:70px;margin-bottom:3px;">
		</form>
		
		<button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#insertManager"
		style="height:40px;width:70px;margin-bottom:3px;">등록</button>
			
		<c:if test="${count == 0}">
			<table class="table">
				<tr>
					<td>
						등록된 멤버가 존재하지 않습니다.
					</td>
				</tr>
			</table>
		</c:if>
		
		<c:if test="${count > 0}">
		<form name="managerForm">
			<input type="button" class="btn btn-primary" value="삭제" style="height:40px;width:70px;float:right;margin-top:1px;"
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
						<th style="width:25%" onclick="event.cancelBubble=true">아이디</th>
						<th style="width:25%" onclick="event.cancelBubble=true">직위</th>
						<th style="width:30%" onclick="event.cancelBubble=true">가입일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="manager" items="${managerList}">
					<tr>
						<c:if test="${manager.status eq 'master' }">
							<td onclick="event.cancelBubble=true"></td>
						</c:if>
						<c:if test="${manager.status ne 'master' }">
							<td onclick="event.cancelBubble=true">
								<input type="checkbox" class="form-check-input" name="reportChkBxRow" value="${manager.num}">
							</td>
						</c:if>
						<td style="cursor:pointer;">
							<c:out value="${number}"/>
							<c:set var="number" value="${number + 1}"/>
						</td>
						<td class="hidden-col">${manager.num}</td>
						<td class="hidden-col">${masterPass}</td>
						<td style="cursor:pointer;">${manager.id}</td>
						<td style="cursor:pointer;">${manager.status}</td>
						<td style="cursor:pointer;">
							<fmt:formatDate value="${manager.regdate}" pattern="yyyy-MM-dd"/>
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
			    <li class="page-item">
		      		<a class="page-link" href="<c:url value="/managerPage/idControl?pageNum=${startPage - pageBlock}"/>">Previous</a>
		    	</li>
		    </c:if>
		    <c:forEach var="i" begin="${startPage}" end="${endPage}">
		    	<li class="page-item"><a class="page-link" href="<c:url value="/managerPage/idControl?pageNum=${i}"/>">${i}</a></li>
		    </c:forEach>
		    <c:if test="${endPage < pageCount}">
		    	<li class="page-item">
		      		<a class="page-link" href="<c:url value="/managerPage/idControl?pageNum=${endPage + 1}"/>">Next</a>
		    	</li>
		    </c:if>
		  </ul>
		  </c:if>
		</nav>
	</div>
	
    <!-- Modal -->
  <div class="modal fade" id="insertManager" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" >
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">admin 계정 등록</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form method="post" id="regForm" action ="<c:url value="/managerPage/insertManager"/>">
		      <div class="modal-body" style="text-align:center;">
	  			<input type="text" placeholder="아이디" id="regId" class="regId" name="regId" style="width:40%;height:37px;vertical-align:middle;border: 1px solid #DDDDDD;">
	  			<button class="btn btn-secondary" id="idChk" onclick="fn_idChk();" type="button" value="N">중복체크</button><br><br>
		        <input type="password" id="pw" class="pw" name="pw" placeholder="비밀번호" style="width:40%;height:37px;vertical-align:middle;margin-right:20%;border: 1px solid #DDDDDD;"><br><br>
		        <input type="password" id="pwConfirm" class="pwConfirm" name="pwConfirm" placeholder="비밀번호 확인" style="width:40%;height:37px;vertical-align:middle;margin-right:20%;border: 1px solid #DDDDDD;"><br><br>
		      </div>
		      <div class="alert">
		      
		      </div>
		      <div class="modal-footer" style="align-items:center;justify-content:center;">
		        <input type="button" id="insertId" value="계정등록" class="btn btn-secondary">
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
	
	// 관리자 계정 삭제
	function deleteValue(masterPass){
	var url = "deleteManager";    // Controller로 보내고자 하는 URL
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
                  title: 'admin 계정 삭제',
                  showCancelButton: true,
                  confirmButtonColor: '#444444',
                  cancelButtonColor: '#DDDDDD',
                  confirmButtonText: '삭제',
                  cancelButtonText: '취소',
                  showCloseButton: true,
          	   	  allowOutsideClick: false,
                  html:
                	  '<input id="swal-input" class="swal-input" placeholder="Master Password">',
                	  preConfirm: function () {
                          return new Promise(function (resolve) {
                              // Validate input 
                              if ($('#swal-input').val() == '') {
                                  Swal.showValidationMessage("마스터 패스워드가 입력되지 않았습니다."); // Show error when validation fails.
                                  Swal.enableButtons(); // Enable the button again.
                              } else if ($('#swal-input').val() != masterPass) { 
                            	  Swal.showValidationMessage("마스터 패스워드와 일치하지 않습니다."); // Show error when validation fails.
                            	  Swal.enableButtons(); // Enable the button again.	
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
				    url : 'deleteManager',                    // 전송 URL
				    type : 'POST',                // POST 방식
				    traditional : true,
				    data : {
				    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
				    },
	                success: function(jdata){
	                    if(jdata = 1) {
	                        alert("삭제 성공");
	                        location.replace("idControl") //list 로 페이지 새로고침
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
	
	
	// 테이블의 Row 클릭시 관리자 계정 정보 가져온 후 수정
	$("#example-table-1 tr").click(function(){ 	

		var str = "";
		
		// 현재 클릭된 Row(<tr>)
		var tr = $(this);
		var td = tr.children();
		
		// td.eq(index)를 통해 값을 가져올 수도 있다.
		var num = td.eq(2).text();
		var masterPass = td.eq(3).text() ;
		var id = td.eq(4).text();
		var status = td.eq(5).text();
		var regdate = td.eq(6).text();
		
		var chk = Swal.fire({
            title: 'admin 계정 수정',
            html:
            	'<h4>아이디 : ' + id + '</h4><br>' + 
                '<input type="password" id="swal-input1" class="swal2-input" placeholder="Master Password" >' +
                '<input type="password" id="swal-input2" class="swal2-input" placeholder="New Password" >' + 
                '<input type="password" id="swal-input3" class="swal2-input" placeholder="New PasswordCheck">'
                ,
            preConfirm: function () {
                return new Promise(function (resolve) {
                    // Validate input 
                    if ($('#swal-input1').val() == '' || $('#swal-input2').val() == '' || $('#swal-input3').val() == '') {
                        Swal.showValidationMessage("세 가지 항목을 모두 입력해주세요."); // Show error when validation fails.
                        Swal.enableButtons(); // Enable the button again.
                    } else if ($('#swal-input1').val() != masterPass){
                    	Swal.showValidationMessage("마스터 계정 비밀번호와 일치하지 않습니다."); // Show error when validation fails.
                    	Swal.enableButtons(); // Enable the button again.
                	} else if ($('#swal-input2').val() != $('#swal-input3').val() ) {
                		Swal.showValidationMessage("새 비밀번호와 비밀번호 확인이 일치하지 않습니다."); // Show error when validation fails.
                		Swal.enableButtons(); // Enable the button again.
                	} else {
                        swal.resetValidationMessage(); // Reset the validation message.
                        resolve([
                            str = $('#swal-input2').val(),
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
			    url : 'updateManager',        // 전송 URL
			    type : 'POST',                // POST 방식
			    traditional : true,
			    data : {
			    	str : str,   		// 보내고자 하는 data 변수 설정
			    	num : num
			    },
              success: function(jdata){
                  if(jdata = 1) {
                      alert("수정 성공");
                      location.replace("idControl") //list 로 페이지 새로고침
                  }
                  else{
                      alert("수정 실패");
                  }
              }
			});       
            }
        })            
	});
	
	// 관리자 계정 등록 유효성 체크
	$(document).ready(function(){
		$("#insertId").on("click", function(){
			if($("#regId").val()==""){
				alert("아이디를 입력해주세요.");
				$("#regId").focus();
				return false;
			}
			if($("#pw").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#pw").focus();
				return false;
			}
			if($("#pwConfirm").val()==""){
				alert("비밀번호 확인을 입력해주세요.");
				$("#pwConfirm").focus();
				return false;
			}
			
			if($("#pw").val()!=$("#pwConfirm").val()){
				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.")
				$("#pwConfirm").focus();
				return false;
			}
			
			var idChkVal = $("#idChk").val();
			if(idChkVal == "N"){
				alert("아이디 중복체크를 해주세요.");
			    return false;
			}else if(idChkVal == "Y"){
				alert("등록성공")
				$("#regForm").submit();
			}
		});		 
	})
	
	// 관리자 계정 등록 id 중복체크
	function fn_idChk(){
		var idReg = /^[a-z]+[a-z0-9]{3,15}$/g;
		if( !idReg.test( $("input[name=regId]").val() ) ) {
	        alert("아이디는 영문자로 시작하는 3~15자 영문자 또는 숫자이어야 합니다.");
	        return false;
	    }
		
		$.ajax({
			url : "idChk",
			type : "post",
			dataType : "json",
			data : {"id" : $("#regId").val()},
			success : function(data){
				if(data == 1){
					alert("중복된 아이디입니다.");
				}else if(data == 0){
					$("#idChk").attr("value", "Y");
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
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
	
	<link href="${pageContext.request.contextPath}/resources/css/manager.css" rel="stylesheet" type="text/css">
<title>관리자 계정 관리</title>
</head>
<body>
	<%@ include file="../include/manageMenu.jsp"%>
	<div id="manageMain">
		<h1 style="font-weight:bold;">관리자 계정 관리</h1>
		
		<form action="<c:url value="/managerPage/idControl"/>" method="POST" style="margin-left:68%">
			<input type="text" id="id" name="id" placeholder="아이디 검색" style="height:40px;">
			<input type="submit" class="btn btn-secondary" value="검색" style="height:40px;width:70px;margin-bottom:3px;">
		</form>
		
		<button class="btn btn-secondary" style="height:40px;width:70px;margin-bottom:3px;margin-left:20px;"
			onClick="window.location='<c:url value="#"/>'">등록</button>
			
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
		<form action="<c:url value="#"/>" method="POST">
			<input type="button" class="btn btn-secondary" value="삭제" style="height:40px;width:70px;float:right;margin-top:1px;"
				onclick="deleteValue(${masterPass});">
			
			<table class="table table-hover" id="example-table-1">
				<thead>
					<tr class="table-secondary">
						<th style="width:10%" onclick="event.cancelBubble=true">
							<input type="checkbox" class="form-check-input" name="reportChkBx" id="checkAll">
						</th>
						<th style="width:10%" onclick="event.cancelBubble=true">번호</th>
						<th class="hidden-col" onclick="event.cancelBubble=true">진짜 번호</th>
						<th>아이디</th>
						<th>직위</th>
						<th>가입일자</th>
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
			    <li class="page-item disabled">
		      		<a class="page-link" href="<c:url value="/managerPage/memberControl?pageNum=${startPage - pageBlock}"/>">Previous</a>
		    	</li>
		    </c:if>
		    <c:forEach var="i" begin="${startPage}" end="${endPage}">
		    	<li class="page-item"><a class="page-link" href="<c:url value="/managerPage/memberControl?pageNum=${i}"/>">${i}</a></li>
		    </c:forEach>
		    <c:if test="${endPage < pageCount}">
		    	<li class="page-item">
		      		<a class="page-link" href="<c:url value="/managerPage/memberControl?pageNum=${startPage - pageBlock}"/>">Next</a>
		    	</li>
		    </c:if>
		  </ul>
		  </c:if>
		</nav>
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
                  html:
                	  '<input id="swal-input" class="swal-input" placeholder="Master Password">',
                	  preConfirm: function () {
                          return new Promise(function (resolve) {
                              // Validate input 
                              if ($('#swal-input').val() == '') {
                                  swal.showValidationMessage("마스터 패스워드가 입력되지 않았습니다."); // Show error when validation fails.
                                  swal.enableConfirmButton(); // Enable the confirm button again.
                              } else if ($('#swal-input').val() != masterPass) { 
                            	  swal.showValidationMessage("마스터 패스워드가 일치하지 않습니다."); // Show error when validation fails.
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
	</script>
</body>
</html>
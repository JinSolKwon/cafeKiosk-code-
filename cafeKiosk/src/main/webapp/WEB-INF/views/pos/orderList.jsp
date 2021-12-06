<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역확인</title>
</head>
<body>
	<jsp:include page="../${pageContext.request.contextPath}/header/managerMain.jsp" flush="false" />
	<div class="container my-3">
		<h3><b>주문내용</b></h3>
		<div class="table-responsive">
			<table class="table align-middle">
				<thead>
					<tr class="text-center">
						<th>주문번호</th>
						<th>주문메뉴</th>
						<th>사이즈</th>
						<th>샷추가</th>
						<th>시럽</th>
						<th>휘핑</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<tr class="text-center">
						<td>1</td>
						<td>(HOT)아메리카노</td>
						<td>M</td>
						<td>1</td>
						<td>-</td>
						<td>-</td>
						<td>
							<button onclick="location.href='#'" class="btn btn-secondary px-3">완료</button> &nbsp;
							<button onclick="location.href='#'" class="btn btn-light px-3">취소</button>
						</td>
					</tr>	
					<tr class="text-center">
						<td>1</td>
						<td>(HOT)아메리카노</td>
						<td>M</td>
						<td>1</td>
						<td>-</td>
						<td>-</td>
						<td>
							<button onclick="location.href='#'" class="btn btn-secondary px-3">완료</button> &nbsp;
							<button onclick="location.href='#'" class="btn btn-light px-3">취소</button>
						</td>
					</tr>	
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>
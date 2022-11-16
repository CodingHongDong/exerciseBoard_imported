<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="with=divice-width,initial-scale=1">
<link rel="stylesheet" href="<c:url value="/resources/user/css/bootstrap.min.css" />">
<script src="http://code.jquery.com/jquery-2.2.3.min.js"></script>
<script src="<c:url value="/resources/user/js/bootstrap.min.js" />"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta charset="UTF-8">
<style type="text/css">
body {
	background-color: #afe0b3;
}
details :hover {
	text-decoration: underline;
	color: white;
}
</style>
<script type="text/javascript">
$(function() {
	$("#cancelBtn").click(function() {
		history.back();
	});
});
</script>
<title>Fitness Board</title>
</head>
<body>
<form action="write.do" method="post">
<input type="hidden" name="perPageNum" value="${param.perPageNum }">
<div class="container">
<h2>Fitness 게시판 > 글쓰기</h2>
<table class="table">
	<tr>
		<th>제목</th>
		<td><input name="title"></td>
	</tr>
	
	<tr>
		<th>내용</th>
		<td><textarea rows="5" style="width: 600px;" name="content"></textarea> </td>
	</tr>
	
	<tr>
		<th>작성자</th>
		<td><input name="memberId" value="${login.getId()}" readonly="readonly"></td>
	</tr>
	<tr>
		<th>위치</th>
		<td>
			<details>
				<summary>위치보기</summary>
				<jsp:include page="/WEB-INF/views/kakaomap/address.jsp"></jsp:include>
					<input type="hidden" id="lat" name="lat" value="">
					<input type="hidden" id="lng" name="lng" value="">
			</details> 
		</td>
	</tr>
	
	<tr>
		<td><button class="btn btn-default">등록</button></td>
		<td><button type="button" id="cancelBtn" class="btn btn-default">취소</button></td>
	</tr>
</table>
</div>
</form>
</body>
</html>
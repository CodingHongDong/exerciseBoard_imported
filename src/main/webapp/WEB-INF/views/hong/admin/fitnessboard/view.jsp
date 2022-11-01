<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="with=divice-width,initial-scale=1">
<link rel="stylesheet" 
		href="<c:url value="/resources/user/css/bootstrap.min.css" />">
<script src="http://code.jquery.com/jquery-2.2.3.min.js"></script>
<script src="<c:url value="/resources/user/js/bootstrap.min.js"/>"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta charset="UTF-8">
<style type="text/css">

details :hover {
	text-decoration: underline;
	color: white;
}

</style>
<script type="text/javascript">
$(function() {
	$("#deleteBtn").click(function() {
		return confirm("정말 삭제하시겠습니까?");
	});
})
</script>
<title>관리자 > Fitness Board</title>
</head>
<body>
<div class="container">
<h2>관리자 > Fitness Board > 글보기</h2>
<table class="table">
	<tr>
		<th>번호</th>
		<td>${vo.no}</td>
	</tr>
	
	<tr>
		<th>제목</th>
		<td>${vo.title}</td>
	</tr>
	
	<tr>
		<th>내용</th>
		<td>${vo.content}</td>
	</tr>
	
	<tr>
		<th>작성자</th>
		<td>${vo.memberId}</td>
	</tr>
	
	<tr>
		<th>작성일</th>
		<td><fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd"/></td>
	</tr>
	
	<tr>
		<th>위치</th>
		<td>
		<details>
			<summary>위치보기</summary>
			<jsp:include page="/WEB-INF/views/kakaomap/address.jsp"/>
		</details> 
		</td>
	</tr>
	
	<tr>
		<th>조회수</th>
		<td>${vo.hit}</td>
	</tr>
	
</table>
	<div>
		<a href="delete.do?no=${vo.no}&perPageNum=${param.perPageNum}" 
			class="btn btn-default" id="deleteBtn">삭제</a>
		<a href="list.do?page=${param.page}&perPageNum=${param.perPageNum}" class="btn btn-default">리스트</a>
	</div>
</div>

<!-- 댓글 기능 -->
<div class="container">
	<ul>
		<c:forEach items="${reply}" var="reply">
			<li>
				<div>
					<p>${reply.writer} / <fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd"/></p>
					<p>${reply.content}</p>
				</div>
				<div>

				 <a href="/reply/delete.do?no=${vo.no}&rno=${reply.rno}&inc=0" 
					class="btn btn-default">댓글 삭제</a> 
				</div>
			</li>				
		</c:forEach>
	</ul>
</div>

<!-- 댓글 기능 구현 끝 -->

</body>
</html>
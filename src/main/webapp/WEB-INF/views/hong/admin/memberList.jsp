<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩, 제이쿼리 -->
<meta name="viewport" content="with=divice-width,initial-scale=1">
<link rel="stylesheet" 
		href="<c:url value="/resources/user/css/bootstrap.min.css" />">
<link rel="stylesheet" 
		href="<c:url value="/resources/user/css/bootstrap.css" />">
<script src="http://code.jquery.com/jquery-2.2.3.min.js"></script>
<script src="<c:url value="/resources/user/js/bootstrap.min.js"/>"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>관리자 - 회원관리</title>
</head>
<body>
<h1 style="text-align: center;">회원리스트</h1>
<div class="container">
<table class="table">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>생년월일</th>
		<th>이메일</th>
	</tr>
	
	<c:forEach items="${vo}" var="vo">
	<tr class="dataRow">
		<td>${vo.id}</td>
		<td>${vo.name}</td>	
		<td><fmt:formatDate value="${vo.birth}" pattern="yyyy-MM-dd"/></td>
		<td>${vo.email}</td>
	</tr>
	</c:forEach>
	
	<c:if test="${pageObject.totalPage > 1 }">
	<!-- 전체 페이지가 2페이지 이상이면 보여주는 부분 -->
		<tr>
			<td colspan="5">
				<pageNav:pageNav listURI="memberLists.do" 
					pageObject="${pageObject }" />
			</td>
		</tr>
	</c:if>
	
</table>
</div>
</body>
</html>
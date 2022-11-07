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
<script type="text/javascript">
$(function() {
	$(".dataRow").click(function() {
		var id = $(this).find(".id").text();
		location = "view.do?id=" + id 
				+ "&page=${pageObject.page}"
				+ "&perPageNum=${pageObject.perPageNum}"
	});

});
</script>
<style type="text/css">
nav{
	margin: 10px;
}

.dataRow:hover {
	background: #eee;
	cursor: pointer;
	}
	
img {
	margin: 10px;
	height: 100px;
	width: 100px;
	float: none;
}

ul {
	list-style: none;
	text-align: center;
	border-top: 2px solid #d9d441;
	border-bottom: 2px solid  #d9d441;
	padding: 10px 0;
}

ul li {
	display: inline;
	text-transform: uppercase;
	padding: 0 10px;
	letter-spacing: 10px;
}

ul li a {
	text-decoration: none;
	color: black;
}

ul li a:hover {
	text-decoration: underline;
	color: white;
}

member {
	font-size: 24px;
	font-weight: bold;
	text-align: center;
}
</style>
<title>관리자 - 회원관리</title>
</head>
<body>

<!-- 로고 -->
<header>
	<h1 class="text-center">
		<a href="http://localhost/hong/home.do"><img src="<c:url value="/resources/user/dog.jpg"/>"></a>
	</h1>
</header>

<!-- nav -->
<nav>
	<ul>
		<li><b><a href="fitnessboard/list.do">fitness</a></b></li>
		<li><b><a href="runningboard/list.do">running</a></b></li>
		<li><b><a href="pilatesboard/list.do">pilates</a></b></li>
		<li><b><a href="freeboard/list.do">자유게시판</a></b></li>
	</ul>
</nav>

<h1 style="text-align: center;">회원리스트</h1>
<div class="container">
<table class="table">

	<tr class="member">
		<th>총 회원 수</th>
		<th>${member}</th>
	</tr>
	
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>생년월일</th>
		<th>이메일</th>
	</tr>
	
	<c:forEach items="${vo}" var="vo" >
	<tr class="dataRow">
		<td class="id">${vo.id}</td>
		<td>${vo.name}</td>	
		<td>${vo.birth }</td>
		<td>${vo.email}</td>
	</tr>
	
	</c:forEach>
	
	<c:if test="${pageObject.totalPage > 1 }">
	<!-- 전체 페이지가 2페이지 이상이면 보여주는 부분 -->
		<tr>
			<td colspan="5">
				<pageNav:pageNav listURI="admin/memberList.do" 
					pageObject="${pageObject}" />
			</td>
		</tr>
	</c:if>
	
</table>
</div>
	<ol class="list-group" style="margin: 1cm; text-align: center;">
	<c:if test="${getTotalRowFitness != null && getTotalRowFitness != 0}">
	  <li class="list-group-item">FITNESS BOARD 총 게시글 수 : ${getTotalRowFitness}</li>
	</c:if>
	<c:if test="${getTotalRowFitness == null || getTotalRowFitness == 0}">
	  <li class="list-group-item">FITNESS BOARD의 게시글이 없습니다.</li>	
	</c:if>
	
	<c:if test="${getTotalRowRunning != null && getTotalRowRunning != 0}">
	  <li class="list-group-item">RUNNING BOARD 총 게시글 수 : ${getTotalRowRunning}</li>
	</c:if>
	<c:if test="${getTotalRowRunning == null || getTotalRowRunning == 0}">
	  <li class="list-group-item">RUNNING BOARD의 게시글이 없습니다.</li>	
	</c:if>
	
	<c:if test="${getTotalRowPilates != null && getTotalRowPilates != 0}">
	  <li class="list-group-item">PILATES BOARD 총 게시글 수 : ${getTotalRowPilates}</li>
	</c:if>
	<c:if test="${getTotalRowPilates == null || getTotalRowPilates == 0}">
	  <li class="list-group-item">PILATES BOARD의 게시글이 없습니다.</li>	
	</c:if>
	
	<c:if test="${getTotalRowFree != null && getTotalRowFree != 0}">
	  <li class="list-group-item">FREE BOARD 총 게시글 수 : ${getTotalRowFree}</li>
	</c:if>
	<c:if test="${getTotalRowFree == null || getTotalRowFree == 0}">
	  <li class="list-group-item">FREE BOARD의 게시글이 없습니다.</li>	
	</c:if>
	</ol>
</body>
</html>
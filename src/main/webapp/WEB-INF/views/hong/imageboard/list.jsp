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
<title>Image Board</title>
<script type="text/javascript">
$(function() {
	$(".dataRow").click(function() {
		var no = $(this).find(".no").text();
		location = "view.do?no=" + no
					+ "&page=${pageObject.page}"
					+ "&perPageNum=${pageObject.perPageNum}"
					+ "&key=${pageObject.key}"
					+ "&word=${pageObject.word}"
	});
	
	// perPageNum 데이터 변경 이벤트 처리 -> jQuery에 대한 이벤트
	$("#perPageNumSelect").change(function() {
		$("#perPageNumForm").submit();
	});
	
})
</script>
<style type="text/css">
body {
	background-color: #ffffff;
}

footer {
	background-color: black;
	padding: 25px;
	color: #ddd;
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
</style>
</head>
<body>

<!-- 로고 -->
<header>
	<h1 class="text-center">
		<a href="http://localhost/hong/home.do"><img src="<c:url value="/resources/user/dog.jpg"/>"></a>
	</h1>
</header>

<div class="container">
<h2>Image 게시판 > 리스트</h2>

<div class="row" style="margin-bottom: 5px;">
	<!-- 검색 기능 -->
	<div class="col-md-8">
		<form class="form-inline">
		<input type="hidden" name="perPageNum" value="${pageObject.perPageNum}">
			<div class="input-group">
			  	<select name="key" class="form-control">
			  		<option value="t" ${(pageObject.key == "t")? "selected" : ""}>제목</option>
			  		<option value="c" ${(pageObject.key == "c")? "selected" : ""}>내용</option>
			  		<option value="w" ${(pageObject.key == "w")? "selected" : ""}>작성자</option>
			  		<option value="tc" ${(pageObject.key == "tc")? "selected" : ""}>제목/내용</option>
			  		<option value="tw" ${(pageObject.key == "tw")? "selected" : ""}>제목/작성자</option>
			  		<option value="cw" ${(pageObject.key == "cw")? "selected" : ""}>내용/작성자</option>
			  		<option value="tcw" ${(pageObject.key == "tcw")? "selected" : ""}>전체</option>
			  	</select> 			
			</div>
		  <div class="input-group">
		    <input type="text" class="form-control" placeholder="Search" name="word" value="${pageObject.word}">
		    <div class="input-group-btn">
		      <button class="btn btn-default" type="submit">
		        <i class="glyphicon glyphicon-search"></i>
		      </button>
		    </div>
		  </div>
		</form>
	</div>
	<!-- 한 페이지 당 보여주는 데이터 갯수 -->
	<div class="col-md-4 text-right">
		<form action="list.do" class="form-inline" id="perPageNumForm">
			<input type="hidden" name="page" value="1">
			<input type="hidden" name="key" value="${pageObject.key}">
			<input type="hidden" name="word" value="${pageObject.word}">
			<div class="form-group">
				<label> 1페이지 당 개수
					<select name="perPageNum" class="form-control" id="perPageNumSelect">
						<option ${(pageObject.perPageNum == 5)? "selected" : "" }>5</option>
						<option ${(pageObject.perPageNum == 10)? "selected" : "" }>10</option>
						<option ${(pageObject.perPageNum == 15)? "selected" : "" }>15</option>
						<option ${(pageObject.perPageNum == 20)? "selected" : "" }>20</option>
					</select>
				</label>
			</div>
		</form>	
	</div>
</div>
	
	<!-- 한줄 시작 -->
	 <div class="row">
	 <c:forEach items="${list}" var="vo" varStatus="vs">
	 	<!-- 이미지 데이터 한개 표시 시작 -->
		<div class="col-md-3 dataRow">
		   <div class="thumbnail">	     
		      <img src="${vo.filename}" alt="Lights" style="width:100%">
		        <div class="caption">
		          <p><span class="no">${vo.no}</span>. ${vo.title}</p>
		          <div>${vo.memberId} (<fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd"/>)<p style="text-align: right;">${vo.hit}</p></div>
		        </div>		     
		    </div>
		  </div>
		  <!-- 이미지 데이터 한개 표시 끝 -->
		  <c:if test="${vs.count % 4 == 0 && vs.count != pageObject.perPageNum}">
		  	${"</div>" }
		  	${"<div class='row'>" }
		  </c:if>
	  </c:forEach>
	  </div>  
	  
  	<!-- 이미지 한줄 끝 -->
  	<div><pageNav:pageNav listURI="list.do" pageObject="${pageObject}" /></div>
  	<div><a href="write.do?perPageNum=${pageObject.perPageNum}" class="btn btn-default">등록</a></div>
</div>
</body>
</html>
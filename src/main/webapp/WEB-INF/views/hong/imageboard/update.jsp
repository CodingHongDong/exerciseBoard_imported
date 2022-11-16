<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="with=divice-width,initial-scale=1">
<link rel="stylesheet" 
		href="<c:url value="/resources/user/css/bootstrap.min.css" />">
<script src="http://code.jquery.com/jquery-2.2.3.min.js"></script>
<script src="<c:url value="/resources/user/js/bootstrap.min.js"/>"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>이미지 게시판 수정</title>
<script type="text/javascript">
$(function(){
	$("#cancelBtn").click(function(){
		history.back();
	});
});
</script>
</head>
<body>
<div class="container">
	<h2>이미지 게시판 수정</h2>
	<form method="post">
		<input type="hidden" name="page" value="${param.page }">
		<input type="hidden" name="perPageNum" value="${param.perPageNum }">
		<div class="form-group">
			<label for="no">번호</label>
			<input name="no" id="no" class="form-control" readonly="readonly" value="${vo.no }">
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input name="title" id="title" class="form-control" required="required" value="${vo.title }">
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea rows="5" name="content" class="form-control">${vo.content }</textarea>
		</div>
		<button class="btn btn-default">수정</button>
		<button type="reset" class="btn btn-default">새로입력</button>
		<button type="button" id="cancelBtn" class="btn btn-default">취소</button>
	</form>
</div>
</body>
</html>
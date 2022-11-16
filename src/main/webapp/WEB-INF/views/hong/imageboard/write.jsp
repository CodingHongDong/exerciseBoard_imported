<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩, 제이쿼리 -->
<meta name="viewport" content="with=divice-width,initial-scale=1">
<link rel="stylesheet" href="<c:url value="/resources/user/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/user/css/bootstrap.css"/>">
<script src="http://code.jquery.com/jquery-2.2.3.min.js"></script>
<script src="<c:url value="/resources/user/js/bootstrap.min.js"/>"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>이미지 게시판 등록</title>
<script type="text/javascript">
$(function() {
	$("#cancelBtn").click(function() {
		history.back();
	});
});
</script>
<style type="text/css">
body {
	background-color: #ffffff;
}
</style>
</head>
<body>
<div class="container">
	<h2>이미지 게시판 등록</h2>
	<form action="write.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="perPageNum" value="${param.perPageNum }">
		<div class="form-group">
			<label for="title">제목</label>
			<input name="title" id="title" class="form-control" required="required">
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea rows="5" name="content" class="form-control"></textarea>
		</div>
		<div class="form-group">
			<label for="imageFile">첨부파일</label>
			<input name="imageFile" id="imageFile" class="form-control" required="required"
			 type="file">
		</div>
		<div class="form-group">
			<label for="memberId">작성자</label>
			<input name="memberId" value="${login.getId()}" readonly="readonly">
		</div>
		<button class="btn btn-default">등록</button>
		<button type="reset" class="btn btn-default">새로입력</button>
		<button type="button" id="cancelBtn" class="btn btn-default">취소</button>
	</form>
</div>
</body>
</html>